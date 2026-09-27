# B07 package check, Windows.
# Run it from the folder that holds KIT-MANIFEST.md.
#
#   Clean arm:           powershell -NoProfile -ExecutionPolicy Bypass -File KIT\B07\check-kit-windows.ps1
#   Planted-breach arm:  powershell -NoProfile -ExecutionPolicy Bypass -File KIT\B07\check-kit-windows.ps1 -Plant
#
# What it checks: every path the manifest lists exists, every file under KIT\ is
# listed, no path is listed twice, and the manifest's stated file count matches.
# The planted-breach arm adds one path that does not exist to the listed set, in
# memory only, so it must report a breach. If it does not, the check is blind.
#
# Exit codes: 0 = RESULT PASS, 1 = RESULT BREACH, 2 = RESULT INSTRUMENT-UNAVAILABLE.
# It only reads. It writes nothing. "-ExecutionPolicy Bypass" applies to this one
# run only; it does not change the computer's settings.
# Files it ignores, and counts: .DS_Store, names starting with ._, Thumbs.db, desktop.ini

param([switch]$Plant)

function Finish([string]$Result, [int]$Code) {
    Write-Output ("RESULT " + $Result)
    exit $Code
}

if ($args.Count -gt 0) {
    Write-Output ("Unknown option: " + ($args -join ' ') + ". Use no option, or -Plant.")
    Finish 'INSTRUMENT-UNAVAILABLE' 2
}

$manifest = 'KIT-MANIFEST.md'
if (-not (Test-Path -LiteralPath $manifest -PathType Leaf) -or -not (Test-Path -LiteralPath 'KIT' -PathType Container)) {
    Write-Output "Cannot read $manifest or find the KIT folder here."
    Write-Output "Run this from the folder that holds $manifest."
    Finish 'INSTRUMENT-UNAVAILABLE' 2
}

$root = (Get-Location).ProviderPath
try {
    $lines = @([System.IO.File]::ReadAllLines((Join-Path $root $manifest)))
    $files = @(Get-ChildItem -LiteralPath (Join-Path $root 'KIT') -Recurse -File -Force -ErrorAction Stop)
} catch {
    Write-Output ("Could not read the manifest or list every file under KIT: " + $_.Exception.Message)
    Finish 'INSTRUMENT-UNAVAILABLE' 2
}

$findings = New-Object 'System.Collections.Generic.List[string]'
$listed = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::Ordinal)
$ondisk = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::Ordinal)
$plantPath = 'KIT/Z99/PLANTED-BREACH-CONTROL.md'
$stated = @()
$real = 0
$nListed = 0
$ignored = 0

$entries = New-Object 'System.Collections.Generic.List[string]'
foreach ($line in $lines) {
    if ($line -match '^\| `([^`]+)` \|') {
        $entries.Add($Matches[1])
        $real++
    } elseif ($line -match '^Generated package file count: \*\*([0-9]+)\*\*') {
        $stated += [int]$Matches[1]
    }
}
if ($Plant) { $entries.Add($plantPath) }

foreach ($p in $entries) {
    if (-not $listed.Add($p)) { $findings.Add("DUPLICATE " + $p) }
    $nListed++
}

[void]$ondisk.Add($manifest)
foreach ($f in $files) {
    $name = $f.Name
    if ($name -eq '.DS_Store' -or $name.StartsWith('._') -or $name -eq 'Thumbs.db' -or $name -eq 'desktop.ini') {
        $ignored++
        continue
    }
    $rel = $f.FullName.Substring($root.Length).TrimStart('\', '/').Replace('\', '/')
    [void]$ondisk.Add($rel)
}

if ($real -eq 0) {
    Write-Output "No inventory rows were read from KIT-MANIFEST.md, so this check cannot see its subject."
    Finish 'INSTRUMENT-UNAVAILABLE' 2
}

foreach ($p in $listed) { if (-not $ondisk.Contains($p)) { $findings.Add("MISSING " + $p) } }
foreach ($p in $ondisk) { if (-not $listed.Contains($p)) { $findings.Add("UNLISTED " + $p) } }

$statedText = 'none'
if ($stated.Count -ne 1) {
    $findings.Add("COUNT-LINE the manifest must carry exactly one file count line; found " + $stated.Count)
} else {
    $statedText = [string]$stated[0]
    if ($stated[0] -ne $nListed -or $stated[0] -ne $ondisk.Count) {
        $findings.Add("COUNT stated=" + $stated[0] + " listed=" + $nListed + " on-disk=" + $ondisk.Count)
    }
}

$sorted = New-Object 'System.Collections.Generic.List[string]'
foreach ($x in $findings) { $sorted.Add($x) }
$sorted.Sort([System.StringComparer]::Ordinal)
foreach ($x in $sorted) { Write-Output $x }

$tail = "CHECKED listed=" + $nListed + " on-disk=" + $ondisk.Count + " stated=" + $statedText + " ignored-os-files=" + $ignored
if ($Plant) { $tail += " planted=1" }
Write-Output $tail

if ($findings.Count -gt 0) { Finish 'BREACH' 1 }
Finish 'PASS' 0
