#!/bin/sh
# B12 backup and restore routine, Mac and Linux.
#
#   Back up, then test the backup:  sh KIT/B12/backup-restore-mac-linux.sh backup SOURCE-FOLDER BACKUP-FOLDER
#   Planted-breach arm of backup:   sh KIT/B12/backup-restore-mac-linux.sh backup --plant SOURCE-FOLDER
#   Restore into a new folder:      sh KIT/B12/backup-restore-mac-linux.sh restore ARCHIVE NEW-FOLDER
#   Compare two folders:            sh KIT/B12/backup-restore-mac-linux.sh compare FOLDER-A FOLDER-B
#   Planted-breach arm of compare:  sh KIT/B12/backup-restore-mac-linux.sh compare --plant FOLDER-A FOLDER-B
#
# backup   writes one archive (.tar) and its fingerprint list (.sha256.txt) into BACKUP-FOLDER,
#          unpacks the archive into a temporary folder, and compares every file with the source.
# restore  unpacks an archive into a folder that is new or empty, never over existing files,
#          then compares the result with the fingerprint list saved beside the archive.
# compare  compares two folders file by file (name and sha256 fingerprint). It reads only.
# --plant  proves the comparison can see a difference. It works on a temporary copy, changes
#          one byte of one file there, and must end in RESULT FAIL. It writes nothing else.
#
# Exit codes: 0 = RESULT PASS, 1 = RESULT FAIL, 2 = RESULT INSTRUMENT-UNAVAILABLE.
# Files it ignores when comparing, and counts: .DS_Store, names starting with ._, Thumbs.db, desktop.ini

LC_ALL=C
export LC_ALL

say() { printf '%s\n' "$*"; }
unavailable() { say "$*"; say "RESULT INSTRUMENT-UNAVAILABLE"; exit 2; }
usage() {
  say "Usage:"
  say "  sh KIT/B12/backup-restore-mac-linux.sh backup SOURCE-FOLDER BACKUP-FOLDER"
  say "  sh KIT/B12/backup-restore-mac-linux.sh backup --plant SOURCE-FOLDER"
  say "  sh KIT/B12/backup-restore-mac-linux.sh restore ARCHIVE NEW-FOLDER"
  say "  sh KIT/B12/backup-restore-mac-linux.sh compare [--plant] FOLDER-A FOLDER-B"
  unavailable "$1"
}

if command -v sha256sum >/dev/null 2>&1; then
  HASH="sha256sum"
elif command -v shasum >/dev/null 2>&1; then
  HASH="shasum -a 256"
else
  unavailable "No sha256 tool (sha256sum or shasum) was found, so files cannot be compared."
fi

T=$(mktemp -d 2>/dev/null) || unavailable "Could not create a temporary folder."
[ -n "$T" ] && [ -d "$T" ] || unavailable "Could not create a temporary folder."
trap 'rm -rf "$T"' EXIT
trap 'exit 2' INT TERM

abs_dir() { (cd "$1" 2>/dev/null && pwd -P); }

# fingerprints FOLDER OUTFILE: one "relative-path<TAB>sha256" line per file, sorted.
fingerprints() {
  ( cd "$1" && find . -type f ! -name '.DS_Store' ! -name '._*' ! -name 'Thumbs.db' ! -name 'desktop.ini' -exec $HASH {} + ) > "$T/fp.raw" || return 1
  awk '{ h = substr($0, 1, 64); p = substr($0, 67); sub(/^\.\//, "", p); print p "\t" h }' "$T/fp.raw" | sort > "$2"
}

# compare_lists LIST-A LIST-B LABEL-A LABEL-B: prints differences, returns 0 when identical.
compare_lists() {
  awk -F '\t' -v la="$3" -v lb="$4" '
    { sub(/\r$/, "", $2) }
    FNR == NR { a[$1] = $2; na++; next }
    { b[$1] = $2; nb++ }
    END {
      for (p in a) {
        if (!(p in b)) { out[++n] = "ONLY-IN-" la " " p }
        else if (a[p] != b[p]) { out[++n] = "DIFFERENT " p }
      }
      for (p in b) if (!(p in a)) out[++n] = "ONLY-IN-" lb " " p
      for (i = 2; i <= n; i++) { v = out[i]; j = i - 1; while (j > 0 && out[j] > v) { out[j + 1] = out[j]; j-- } out[j + 1] = v }
      for (i = 1; i <= n; i++) print out[i]
      print "COMPARED " la "-files=" na + 0 " " lb "-files=" nb + 0
      exit (n > 0 || na + 0 == 0) ? 1 : 0
    }' "$1" "$2"
}

# plant_one FOLDER: changes one byte of the first file (sorted) inside a TEMPORARY copy.
plant_one() {
  first=$(cd "$1" && find . -type f ! -name '.DS_Store' ! -name '._*' ! -name 'Thumbs.db' ! -name 'desktop.ini' | sort | head -n 1)
  [ -n "$first" ] || return 1
  printf 'x' >> "$1/$first" || return 1
  say "PLANTED one changed byte in the temporary copy of ${first#./}"
}

finish() {
  if [ "$1" -eq 0 ]; then say "RESULT PASS"; exit 0; fi
  say "RESULT FAIL"; exit 1
}

MODE="${1:-}"
[ "$#" -gt 0 ] && shift
PLANT=0
if [ "${1:-}" = "--plant" ]; then PLANT=1; shift; fi

case "$MODE" in
  backup)
    if [ "$PLANT" -eq 1 ]; then
      [ "$#" -eq 1 ] || usage "backup --plant takes one folder: the source."
    else
      [ "$#" -eq 2 ] || usage "backup takes two folders: the source and the backup folder."
    fi
    SRC=$(abs_dir "$1") || unavailable "Source folder not found or not readable: $1"
    [ -n "$SRC" ] || unavailable "Source folder not found or not readable: $1"
    if [ "$PLANT" -eq 1 ]; then
      mkdir "$T/dest" || unavailable "Could not create a temporary backup folder."
      DEST="$T/dest"
    else
      DEST=$(abs_dir "$2") || unavailable "Backup folder not found: $2. Create it first, with the owner's approval."
      [ -n "$DEST" ] || unavailable "Backup folder not found: $2. Create it first, with the owner's approval."
      [ -w "$DEST" ] || unavailable "Backup folder is not writable: $DEST"
      case "$DEST/" in "$SRC/"*) unavailable "The backup folder is inside the source folder. A backup kept inside what it protects is lost with it." ;; esac
      case "$SRC/" in "$DEST/"*) unavailable "The source folder is inside the backup folder. Choose a separate backup folder." ;; esac
      disk_src=$(df -P "$SRC" 2>/dev/null | awk 'NR == 2 { print $1 }')
      disk_dest=$(df -P "$DEST" 2>/dev/null | awk 'NR == 2 { print $1 }')
      if [ -n "$disk_src" ] && [ "$disk_src" = "$disk_dest" ]; then
        say "WARNING SAME-DISK the backup folder is on the same disk as the source ($disk_src). This protects against mistakes, not against losing the disk."
      fi
    fi
    BASE=$(basename "$SRC")
    PARENT=$(dirname "$SRC")
    ARCH="$DEST/$BASE-backup-$(date +%Y%m%d-%H%M%S).tar"
    [ -e "$ARCH" ] && unavailable "An archive with this name already exists: $ARCH. Wait one second and run again."
    tar -cf "$ARCH" -C "$PARENT" "$BASE" || unavailable "tar could not write the archive: $ARCH"
    fingerprints "$SRC" "$ARCH.sha256.txt" || unavailable "Could not fingerprint every file in the source."
    mkdir "$T/restored" || unavailable "Could not create a temporary restore folder."
    tar -xf "$ARCH" -C "$T/restored" || { say "The archive could not be unpacked: $ARCH"; finish 1; }
    [ "$PLANT" -eq 1 ] && { plant_one "$T/restored/$BASE" || unavailable "The source has no file to plant a change in."; }
    fingerprints "$T/restored/$BASE" "$T/restored.fp" || unavailable "Could not fingerprint the restored copy."
    [ "$PLANT" -eq 1 ] || { say "ARCHIVE $ARCH"; say "FINGERPRINTS $ARCH.sha256.txt"; }
    compare_lists "$ARCH.sha256.txt" "$T/restored.fp" source restored
    finish $?
    ;;
  restore)
    [ "$PLANT" -eq 0 ] || usage "restore has no planted arm; use backup --plant or compare --plant."
    [ "$#" -eq 2 ] || usage "restore takes an archive and a new folder."
    ARCH="$1"
    NEW="$2"
    [ -f "$ARCH" ] && [ -r "$ARCH" ] || unavailable "Archive not found or not readable: $ARCH"
    if [ -e "$NEW" ]; then
      [ -d "$NEW" ] || unavailable "Not a folder: $NEW"
      [ -z "$(ls -A "$NEW")" ] || unavailable "The restore folder is not empty: $NEW. Restore into a new or empty folder, never over existing files."
    else
      mkdir "$NEW" || unavailable "Could not create the restore folder: $NEW (its parent folder must exist)."
    fi
    case "$ARCH" in
      *.zip) command -v unzip >/dev/null 2>&1 || unavailable "unzip is not installed, so a .zip archive cannot be unpacked here."
             unzip -q "$ARCH" -d "$NEW" || { say "The archive could not be unpacked: $ARCH"; finish 1; } ;;
      *) tar -xf "$ARCH" -C "$NEW" || { say "The archive could not be unpacked: $ARCH"; finish 1; } ;;
    esac
    TOP=$(ls -A "$NEW")
    [ "$(printf '%s\n' "$TOP" | wc -l | tr -d ' ')" -eq 1 ] && [ -d "$NEW/$TOP" ] || unavailable "The archive did not unpack into exactly one folder, so it cannot be checked."
    say "RESTORED $NEW/$TOP"
    [ -f "$ARCH.sha256.txt" ] || unavailable "Restored, but not verified: no fingerprint list beside the archive ($ARCH.sha256.txt)."
    fingerprints "$NEW/$TOP" "$T/restored.fp" || unavailable "Could not fingerprint the restored folder."
    compare_lists "$ARCH.sha256.txt" "$T/restored.fp" archive restored
    finish $?
    ;;
  compare)
    [ "$#" -eq 2 ] || usage "compare takes two folders."
    A=$(abs_dir "$1") || unavailable "Folder not found or not readable: $1"
    B=$(abs_dir "$2") || unavailable "Folder not found or not readable: $2"
    [ -n "$A" ] && [ -n "$B" ] || unavailable "Folder not found or not readable."
    if [ "$PLANT" -eq 1 ]; then
      cp -R "$B" "$T/b" || unavailable "Could not make a temporary copy of $B"
      plant_one "$T/b" || unavailable "The second folder has no file to plant a change in."
      B="$T/b"
    fi
    fingerprints "$A" "$T/a.fp" || unavailable "Could not fingerprint every file in $A"
    fingerprints "$B" "$T/b.fp" || unavailable "Could not fingerprint every file in $B"
    compare_lists "$T/a.fp" "$T/b.fp" first second
    finish $?
    ;;
  *)
    usage "Unknown or missing mode: ${MODE:-none}. Use backup, restore, or compare."
    ;;
esac
