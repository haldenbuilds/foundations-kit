# B12 | Backup and restore routine

**Row ID:** `B12`

**Built tier:** `fully kitted`

**Purpose:** Backup and restore routine

**Use after:** F01,C06

## Populated first instance

**Starter scenario:** A tested routine that backs up one project folder, proves the backup restores, and restores it when files are lost. The commands are ready; the folders are yours to name.

A backup is not trusted until a restore test passes. This routine runs the restore test every time it makes a backup, so an untested backup never looks like a good one.

### The routine

| Field | Value |
|---|---|
| Scope | `UNKNOWN` until the owner names the folder that would hurt to lose. Suggested first scope: the project folder the agent works in. |
| Destination | `UNKNOWN` until the owner approves a separate backup folder, ideally on another drive or device. The routine refuses a backup folder inside the source. |
| Cadence and owner | Before any change recorded in B08, and after each approved milestone. The project owner approves; the agent runs it. |
| Mac or Linux | `sh KIT/B12/backup-restore-mac-linux.sh backup SOURCE-FOLDER BACKUP-FOLDER` |
| Windows | `powershell -NoProfile -ExecutionPolicy Bypass -File KIT\B12\backup-restore-windows.ps1 backup SOURCE-FOLDER BACKUP-FOLDER` |
| What it does | Writes one archive and its fingerprint list into the backup folder, unpacks the archive into a temporary folder, and compares every file with the source by name and sha256 fingerprint. |
| Passes when | The last line reads `RESULT PASS` and the exit code is 0. |
| Planted-breach arm | `backup --plant SOURCE-FOLDER` (Mac or Linux) or `backup -Plant SOURCE-FOLDER` (Windows). It works in a temporary folder, changes one byte of one restored file, and must end in `RESULT FAIL` with exit code 1. It writes nothing into the backup folder. |
| Instrument failure | `RESULT INSTRUMENT-UNAVAILABLE` with exit code 2: a folder is missing, the backup folder sits inside the source, or a file could not be read. Never record it as PASS. |
| Same-disk warning | A `WARNING SAME-DISK` line means the backup protects against mistakes but not against losing the drive. Record it; it does not meet the separate-destination default. |

### Recovering lost or damaged files

1. Stop work on the damaged folder. Do not write into it.
2. Pick the newest archive whose backup run ended in `RESULT PASS`.
3. Restore into a new, empty folder, never over the damaged one:
   - Mac or Linux: `sh KIT/B12/backup-restore-mac-linux.sh restore ARCHIVE NEW-FOLDER`
   - Windows: `powershell -NoProfile -ExecutionPolicy Bypass -File KIT\B12\backup-restore-windows.ps1 restore ARCHIVE NEW-FOLDER`
4. The restore compares every restored file with the fingerprint list saved beside the archive. It must end in `RESULT PASS`.
5. The owner decides which restored files replace which damaged ones. Replacing files is a change: record it in B08.

### Comparing two folders

`compare FOLDER-A FOLDER-B` reports every file that differs or exists on one side only, and ends in `RESULT PASS` only when both folders hold the same files with the same fingerprints. Its planted arm, `compare --plant FOLDER-A FOLDER-B` (Windows: `compare -Plant`), changes one byte in a temporary copy and must end in `RESULT FAIL`. Compare reads the two folders and changes neither. B08 uses it to verify a change.

## Use now

1. Ask the owner to name the scope and approve the backup folder. Running `backup` writes outside the workspace, so it is a Stop act in C02 until approved.
2. Run the planted-breach arm on the scope. It must end in `RESULT FAIL` with exit code 1.
3. Run `backup`. Copy its exit code, last line, and archive path into the C05 ledger.
4. Once, while nothing is broken, run `restore` into a new folder to see the recovery path work.

## Adaptation notes

- Keep the backup folder separate from the source failure domain.
- Do not copy restricted data without approval: check the scope against C06 first.
- A failed or unavailable restore test leaves the backup untrusted, whatever the archive looks like.

## Completion check

- [ ] The backup run ended in `RESULT PASS`, and its planted-breach arm ended in `RESULT FAIL`.
- [ ] The test restored bytes and compared every file, and a failed test left the status FAIL.
- [ ] The backup folder was approved by the owner and is not inside the source.
