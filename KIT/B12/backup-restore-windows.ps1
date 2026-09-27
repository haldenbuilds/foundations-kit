# B12 backup and restore routine, Windows.
# Start every line below with:  powershell -NoProfile -ExecutionPolicy Bypass -File KIT\B12\backup-restore-windows.ps1
#
#   Back up, then test the backup:  ... backup SOURCE-FOLDER BACKUP-FOLDER
#   Planted-breach arm of backup:   ... backup -Plant SOURCE-FOLDER
#   Restore into a new folder:      ... restore ARCHIVE NEW-FOLDER
#   Compare two folders:            ... compare FOLDER-A FOLDER-B
#   Planted-breach arm of compare:  ... compare -Plant FOLDER-A FOLDER-B
#
# backup   writes one archive (.zip) and its fingerprint list (.sha256.txt) into BACKUP-FOLDER,
#          unpacks the archive into a temporary folder, and compares every file with the source.
# restore  unpacks an archive into a folder that is new or empty, never over existing files,
#          then compares the result with the fingerprint list saved beside the archive.
# compare  compares two folders file by file (name and sha256 fingerprint). It reads only.
# -Plant   proves the comparison can see a difference. It works on a temporary copy, changes
#          one byte of one file there, and must end in RESULT FAIL. It writes nothing else.
#
# Exit codes: 0 = RESULT PASS, 1 = RESULT FAIL, 2 = RESULT INSTRUMENT-UNAVAILABLE.
# "-ExecutionPolicy Bypass" applies to this one run only; it does not change the computer's settings.
# Files it ignores when comparing, and counts: .DS_Store, names starting with ._, Thumbs.db, desktop.ini

param([string]$Mode, [string]$First, [string]$Second, [switch]$Plant)

$script:Temp = $null

function Remove-Temp {
    if ($script:Temp -and (Test-Path -LiteralPath $script:Temp -PathType Container)) {
        Remove-Item -LiteralPath $script:Temp -Recurse -Force -ErrorAction SilentlyContinue
    }
}

function Stop-Unavailable([string]$Message) {
    Write-Output $Message
    Write-Output 'RESULT INSTRUMENT-UNAVAILABLE'
    Remove-Temp
    exit 2
}

function Stop-Result([int]$Code) {
    if ($Code -eq 0) { Write-Output 'RESULT PASS' } else { Write-Output 'RESULT FAIL' }
    Remove-Temp
    exit $Code
}

function Show-Usage([string]$Message) {
    Write-Output 'Usage (start each with: powershell -NoProfile -ExecutionPolicy Bypass -File KIT\B12\backup-restore-windows.ps1):'
    Write-Output '  backup SOURCE-FOLDER BACKUP-FOLDER'
    Write-Output '  backup -Plant SOURCE-FOLDER'
    Write-Output '  restore ARCHIVE NEW-FOLDER'
    Write-Output '  compare [-Plant] FOLDER-A FOLDER-B'
    Stop-Unavailable $Message
}

function Test-Ignored([string]$Name) {
    return ($Name -eq '.DS_Store' -or $Name.StartsWith('._') -or $Name -eq 'Thumbs.db' -or $Name -eq 'desktop.ini')
}

function Resolve-Folder([string]$Path) {
    if (-not $Path) { return $null }
    if (-not (Test-Path -LiteralPath $Path -PathType Container)) { return $null }
    return (Resolve-Path -LiteralPath $Path).ProviderPath.TrimEnd('\', '/')
}

# Returns a sorted list of "relative-path<TAB>sha256" lines, or throws.
function Get-Fingerprints([string]$Folder) {
    $rows = New-Object 'System.Collections.Generic.List[string]'
    $files = @(Get-ChildItem -LiteralPath $Folder -Recurse -File -Force -ErrorAction Stop)
    foreach ($f in $files) {
        if (Test-Ignored $f.Name) { continue }
        $h = Get-FileHash -LiteralPath $f.FullName -Algorithm SHA256 -ErrorAction Stop
        if (-not $h -or -not $h.Hash) { throw ("No fingerprint for " + $f.FullName) }
        $rel = $f.FullName.Substring($Folder.Length).TrimStart('\', '/').Replace('\', '/')
        $rows.Add($rel + "`t" + $h.Hash.ToLowerInvariant())
    }
    $rows.Sort([System.StringComparer]::Ordinal)
    return ,$rows
}

function Read-Fingerprints([string]$Path) {
    $map = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([System.StringComparer]::Ordinal)
    foreach ($line in [System.IO.File]::ReadAllLines($Path)) {
        $t = $line.TrimEnd("`r")
        if ($t.Length -eq 0) { continue }
        $i = $t.LastIndexOf("`t")
        if ($i -lt 1) { throw ("Unreadable fingerprint line in " + $Path) }
        $map[$t.Substring(0, $i)] = $t.Substring($i + 1)
    }
    return ,$map
}

function ConvertTo-Map($Rows) {
    $map = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([System.StringComparer]::Ordinal)
    foreach ($r in $Rows) { $i = $r.LastIndexOf("`t"); $map[$r.Substring(0, $i)] = $r.Substring($i + 1) }
    return ,$map
}

# Prints differences; sets $script:CompareCode to 0 when identical and non-empty, 1 otherwise.
$script:CompareCode = 1
function Compare-Maps($A, $B, [string]$LabelA, [string]$LabelB) {
    $out = New-Object 'System.Collections.Generic.List[string]'
    foreach ($k in $A.Keys) {
        if (-not $B.ContainsKey($k)) { $out.Add("ONLY-IN-" + $LabelA + " " + $k) }
        elseif ($A[$k] -cne $B[$k]) { $out.Add("DIFFERENT " + $k) }
    }
    foreach ($k in $B.Keys) { if (-not $A.ContainsKey($k)) { $out.Add("ONLY-IN-" + $LabelB + " " + $k) } }
    $out.Sort([System.StringComparer]::Ordinal)
    foreach ($x in $out) { Write-Output $x }
    Write-Output ("COMPARED " + $LabelA + "-files=" + $A.Count + " " + $LabelB + "-files=" + $B.Count)
    if ($out.Count -gt 0 -or $A.Count -eq 0) { $script:CompareCode = 1 } else { $script:CompareCode = 0 }
}

# Changes one byte of the first file (sorted) inside a TEMPORARY copy; sets $script:Planted.
$script:Planted = $false
function Set-PlantedChange([string]$Folder) {
    $script:Planted = $false
    $files = @(Get-ChildItem -LiteralPath $Folder -Recurse -File -Force -ErrorAction Stop | Where-Object { -not (Test-Ignored $_.Name) })
    if ($files.Count -eq 0) { return }
    $rels = New-Object 'System.Collections.Generic.List[string]'
    foreach ($f in $files) { $rels.Add($f.FullName.Substring($Folder.Length).TrimStart('\', '/').Replace('\', '/')) }
    $rels.Sort([System.StringComparer]::Ordinal)
    $target = Join-Path $Folder ($rels[0].Replace('/', [System.IO.Path]::DirectorySeparatorChar))
    $stream = [System.IO.File]::Open($target, [System.IO.FileMode]::Append)
    try { $stream.WriteByte(120) } finally { $stream.Close() }
    Write-Output ("PLANTED one changed byte in the temporary copy of " + $rels[0])
    $script:Planted = $true
}

if ($args.Count -gt 0) { Show-Usage ("Unexpected extra input: " + ($args -join ' ')) }

try {
    Add-Type -AssemblyName System.IO.Compression.FileSystem -ErrorAction Stop
    $script:Temp = Join-Path ([System.IO.Path]::GetTempPath()) ('kit-b12-' + [System.Guid]::NewGuid().ToString('N'))
    [void](New-Item -ItemType Directory -Path $script:Temp -ErrorAction Stop)
} catch {
    Stop-Unavailable ("Could not prepare: " + $_.Exception.Message)
}

switch ($Mode) {
    'backup' {
        if ($Plant) {
            if (-not $First -or $Second) { Show-Usage 'backup -Plant takes one folder: the source.' }
        } else {
            if (-not $First -or -not $Second) { Show-Usage 'backup takes two folders: the source and the backup folder.' }
        }
        $src = Resolve-Folder $First
        if (-not $src) { Stop-Unavailable ("Source folder not found or not readable: " + $First) }
        if ($Plant) {
            $dest = Join-Path $script:Temp 'dest'
            [void](New-Item -ItemType Directory -Path $dest)
        } else {
            $dest = Resolve-Folder $Second
            if (-not $dest) { Stop-Unavailable ("Backup folder not found: " + $Second + ". Create it first, with the owner's approval.") }
            $sep = [System.IO.Path]::DirectorySeparatorChar
            if (($dest + $sep).StartsWith($src + $sep, [System.StringComparison]::OrdinalIgnoreCase)) {
                Stop-Unavailable 'The backup folder is inside the source folder. A backup kept inside what it protects is lost with it.'
            }
            if (($src + $sep).StartsWith($dest + $sep, [System.StringComparison]::OrdinalIgnoreCase)) {
                Stop-Unavailable 'The source folder is inside the backup folder. Choose a separate backup folder.'
            }
            $rootSrc = [System.IO.Path]::GetPathRoot($src)
            $rootDest = [System.IO.Path]::GetPathRoot($dest)
            if ($rootSrc -and ($rootSrc -eq $rootDest)) {
                Write-Output ("WARNING SAME-DISK the backup folder is on the same drive as the source (" + $rootSrc + "). This protects against mistakes, not against losing the drive.")
            }
        }
        $base = Split-Path -Leaf $src
        $arch = Join-Path $dest ($base + '-backup-' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '.zip')
        if (Test-Path -LiteralPath $arch) { Stop-Unavailable ("An archive with this name already exists: " + $arch + ". Wait one second and run again.") }
        try {
            [System.IO.Compression.ZipFile]::CreateFromDirectory($src, $arch, [System.IO.Compression.CompressionLevel]::Optimal, $true)
            $srcRows = Get-Fingerprints $src
            [System.IO.File]::WriteAllLines($arch + '.sha256.txt', [string[]]$srcRows.ToArray())
        } catch {
            Stop-Unavailable ("Could not write or fingerprint the backup: " + $_.Exception.Message)
        }
        $restored = Join-Path $script:Temp 'restored'
        try {
            [System.IO.Compression.ZipFile]::ExtractToDirectory($arch, $restored)
        } catch {
            Write-Output ("The archive could not be unpacked: " + $arch)
            Stop-Result 1
        }
        $restoredBase = Join-Path $restored $base
        try {
            if ($Plant) {
                Set-PlantedChange $restoredBase
                if (-not $script:Planted) { Stop-Unavailable 'The source has no file to plant a change in.' }
            }
            $a = Read-Fingerprints ($arch + '.sha256.txt')
            $b = ConvertTo-Map (Get-Fingerprints $restoredBase)
        } catch {
            Stop-Unavailable ("Could not fingerprint the restored copy: " + $_.Exception.Message)
        }
        if (-not $Plant) { Write-Output ("ARCHIVE " + $arch); Write-Output ("FINGERPRINTS " + $arch + '.sha256.txt') }
        Compare-Maps $a $b 'source' 'restored'
        Stop-Result $script:CompareCode
    }
    'restore' {
        if ($Plant) { Show-Usage 'restore has no planted arm; use backup -Plant or compare -Plant.' }
        if (-not $First -or -not $Second) { Show-Usage 'restore takes an archive and a new folder.' }
        if (-not (Test-Path -LiteralPath $First -PathType Leaf)) { Stop-Unavailable ("Archive not found or not readable: " + $First) }
        $arch = (Resolve-Path -LiteralPath $First).ProviderPath
        if (Test-Path -LiteralPath $Second) {
            if (-not (Test-Path -LiteralPath $Second -PathType Container)) { Stop-Unavailable ("Not a folder: " + $Second) }
            if (@(Get-ChildItem -LiteralPath $Second -Force).Count -gt 0) {
                Stop-Unavailable ("The restore folder is not empty: " + $Second + ". Restore into a new or empty folder, never over existing files.")
            }
        } else {
            try { [void](New-Item -ItemType Directory -Path $Second -ErrorAction Stop) } catch {
                Stop-Unavailable ("Could not create the restore folder: " + $Second + " (its parent folder must exist).")
            }
        }
        $new = (Resolve-Path -LiteralPath $Second).ProviderPath
        try {
            if ($arch.EndsWith('.zip', [System.StringComparison]::OrdinalIgnoreCase)) {
                [System.IO.Compression.ZipFile]::ExtractToDirectory($arch, $new)
            } else {
                $tar = Get-Command tar -ErrorAction SilentlyContinue
                if (-not $tar) { Stop-Unavailable 'This archive is not a .zip and no tar program was found to unpack it.' }
                & $tar.Path -xf $arch -C $new
                if ($LASTEXITCODE -ne 0) { throw ("tar exit code " + $LASTEXITCODE) }
            }
        } catch {
            Write-Output ("The archive could not be unpacked: " + $arch + " (" + $_.Exception.Message + ")")
            Stop-Result 1
        }
        $top = @(Get-ChildItem -LiteralPath $new -Force)
        if ($top.Count -ne 1 -or -not $top[0].PSIsContainer) { Stop-Unavailable 'The archive did not unpack into exactly one folder, so it cannot be checked.' }
        Write-Output ("RESTORED " + $top[0].FullName)
        if (-not (Test-Path -LiteralPath ($arch + '.sha256.txt') -PathType Leaf)) {
            Stop-Unavailable ("Restored, but not verified: no fingerprint list beside the archive (" + $arch + ".sha256.txt).")
        }
        try {
            $a = Read-Fingerprints ($arch + '.sha256.txt')
            $b = ConvertTo-Map (Get-Fingerprints $top[0].FullName)
        } catch {
            Stop-Unavailable ("Could not fingerprint the restored folder: " + $_.Exception.Message)
        }
        Compare-Maps $a $b 'archive' 'restored'
        Stop-Result $script:CompareCode
    }
    'compare' {
        if (-not $First -or -not $Second) { Show-Usage 'compare takes two folders.' }
        $fa = Resolve-Folder $First
        $fb = Resolve-Folder $Second
        if (-not $fa) { Stop-Unavailable ("Folder not found or not readable: " + $First) }
        if (-not $fb) { Stop-Unavailable ("Folder not found or not readable: " + $Second) }
        try {
            if ($Plant) {
                $copy = Join-Path $script:Temp 'b'
                Copy-Item -LiteralPath $fb -Destination $copy -Recurse -Force -ErrorAction Stop
                Set-PlantedChange $copy
                if (-not $script:Planted) { Stop-Unavailable 'The second folder has no file to plant a change in.' }
                $fb = $copy
            }
            $a = ConvertTo-Map (Get-Fingerprints $fa)
            $b = ConvertTo-Map (Get-Fingerprints $fb)
        } catch {
            Stop-Unavailable ("Could not fingerprint the folders: " + $_.Exception.Message)
        }
        Compare-Maps $a $b 'first' 'second'
        Stop-Result $script:CompareCode
    }
    default {
        Show-Usage ("Unknown or missing mode: " + $(if ($Mode) { $Mode } else { 'none' }) + ". Use backup, restore, or compare.")
    }
}
