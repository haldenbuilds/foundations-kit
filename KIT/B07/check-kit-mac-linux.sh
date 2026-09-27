#!/bin/sh
# B07 package check, Mac and Linux.
# Run it from the folder that holds KIT-MANIFEST.md.
#
#   Clean arm:           sh KIT/B07/check-kit-mac-linux.sh
#   Planted-breach arm:  sh KIT/B07/check-kit-mac-linux.sh --plant
#
# What it checks: every path the manifest lists exists, every file under KIT/ is
# listed, no path is listed twice, and the manifest's stated file count matches.
# The planted-breach arm adds one path that does not exist to the listed set, in
# memory only, so it must report a breach. If it does not, the check is blind.
#
# Exit codes: 0 = RESULT PASS, 1 = RESULT BREACH, 2 = RESULT INSTRUMENT-UNAVAILABLE.
# It only reads. It writes nothing.
# Files it ignores, and counts: .DS_Store, names starting with ._, Thumbs.db, desktop.ini

LC_ALL=C
export LC_ALL
M=KIT-MANIFEST.md
PLANT=""

if [ "$#" -gt 1 ]; then
  printf '%s\n' "Too many options. Use no option, or --plant."
  printf '%s\n' "RESULT INSTRUMENT-UNAVAILABLE"
  exit 2
fi
case "${1:-}" in
  "") ;;
  --plant) PLANT="KIT/Z99/PLANTED-BREACH-CONTROL.md" ;;
  *)
    printf '%s\n' "Unknown option: $1. Use no option, or --plant."
    printf '%s\n' "RESULT INSTRUMENT-UNAVAILABLE"
    exit 2
    ;;
esac

if [ ! -r "$M" ] || [ ! -d KIT ]; then
  printf '%s\n' "Cannot read $M or find the KIT folder here."
  printf '%s\n' "Run this from the folder that holds $M."
  printf '%s\n' "RESULT INSTRUMENT-UNAVAILABLE"
  exit 2
fi

if ! DISK=$(find KIT -type f); then
  printf '%s\n' "Could not list every file under KIT (a folder may be unreadable)."
  printf '%s\n' "RESULT INSTRUMENT-UNAVAILABLE"
  exit 2
fi

{
  sed -n 's/^| `\([^`]*\)` |.*/L \1/p' "$M"
  if [ -n "$PLANT" ]; then printf 'L %s\n' "$PLANT"; fi
  printf 'D %s\n' "$M"
  if [ -n "$DISK" ]; then printf '%s\n' "$DISK" | sed 's/^/D /'; fi
  sed -n 's/^Generated package file count: \*\*\([0-9][0-9]*\)\*\*.*/N \1/p' "$M"
} | awk -v plant="$PLANT" '
  function add(line) { out[++nout] = line }
  {
    tag = substr($0, 1, 1)
    p = substr($0, 3)
    sub(/\r$/, "", p)
  }
  tag == "N" { stated = p; nstated++; next }
  tag == "L" {
    if (p in listed) { add("DUPLICATE " p); bad++ }
    listed[p] = 1; nlisted++
    if (p != plant) real++
    next
  }
  tag == "D" {
    n = split(p, parts, "/"); base = parts[n]
    if (base == ".DS_Store" || substr(base, 1, 2) == "._" || base == "Thumbs.db" || base == "desktop.ini") { ignored++; next }
    ondisk[p] = 1; ndisk++
    next
  }
  END {
    if (real + 0 == 0) {
      print "No inventory rows were read from KIT-MANIFEST.md, so this check cannot see its subject."
      print "RESULT INSTRUMENT-UNAVAILABLE"
      exit 2
    }
    for (p in listed) if (!(p in ondisk)) { add("MISSING " p); bad++ }
    for (p in ondisk) if (!(p in listed)) { add("UNLISTED " p); bad++ }
    if (nstated != 1) {
      add("COUNT-LINE the manifest must carry exactly one file count line; found " nstated + 0)
      bad++
    } else if (stated + 0 != nlisted || stated + 0 != ndisk) {
      add("COUNT stated=" stated " listed=" nlisted " on-disk=" ndisk)
      bad++
    }
    for (i = 2; i <= nout; i++) {
      v = out[i]; j = i - 1
      while (j > 0 && out[j] > v) { out[j + 1] = out[j]; j-- }
      out[j + 1] = v
    }
    for (i = 1; i <= nout; i++) print out[i]
    print "CHECKED listed=" nlisted " on-disk=" ndisk " stated=" (nstated == 1 ? stated : "none") " ignored-os-files=" ignored + 0 (plant != "" ? " planted=1" : "")
    if (bad) { print "RESULT BREACH"; exit 1 }
    print "RESULT PASS"
    exit 0
  }'
