# B07 | Verification and self-test gate

**Row ID:** `B07`

**Built tier:** `fully kitted`

**Purpose:** Verification and self-test gate

**Use after:** C05,B06

## Populated first instance

**Starter scenario:** The first build this gate checks is this package itself. The check below is ready to run today.

A check counts only when someone other than its author can run it and get the same reading. A table that names a check is not a check. This row ships one real check with both control arms, and a card for writing your own.

### The package check

| Field | Value |
|---|---|
| Invariant | Every path listed in `KIT-MANIFEST.md` exists, every file under `KIT/` is listed, no path is listed twice, and the manifest's stated file count matches both. |
| Run from | The folder that holds `KIT-MANIFEST.md`. |
| Command, Mac or Linux | `sh KIT/B07/check-kit-mac-linux.sh` |
| Command, Windows | `powershell -NoProfile -ExecutionPolicy Bypass -File KIT\B07\check-kit-windows.ps1` |
| Clean arm passes when | The last line reads `RESULT PASS` and the exit code is 0. |
| Planted-breach arm | Add `--plant` (Mac or Linux) or `-Plant` (Windows) to the same command. The check adds one path that does not exist, in memory only, and must end in `RESULT BREACH` with exit code 1. If this arm passes, the check is blind and its clean reading means nothing. |
| Instrument failure | `RESULT INSTRUMENT-UNAVAILABLE` with exit code 2: the manifest or the `KIT` folder could not be read, or no inventory rows were found. Never record it as PASS. |
| What it writes | Nothing. Both arms only read. |
| Observed result | Record only after both arms have run: the exit code and the last line of each, copied from the run. |

### Rules for every check, including the ones you add

- A check needs four things: a command that can be pasted and run, the folder it runs from, the exact passing reading (last line and exit code), and a planted-breach arm that must fail.
- A description of what to look at ("review the file", "confirm it works", "resolve each path") is a procedure, not a check. Record it as `NOT RUNNABLE`. A `NOT RUNNABLE` row never marks work complete.
- Run both arms after the last change to what they check. Changed bytes require a new result.
- Copy the exit code and the deciding line from the run itself. A summary of the run is not the reading.
- If the command cannot run, the reading is `INSTRUMENT-UNAVAILABLE`. Instrument failure never becomes PASS.
- If your agent cannot run commands, every check stays `INSTRUMENT-UNAVAILABLE` until a person runs it and records the reading.

### Check card for your own build

| Field | Your value | State |
|---|---|---|
| Invariant | `UNKNOWN` | OPEN |
| Run from | `UNKNOWN` | OPEN |
| Command | `UNKNOWN` | NOT RUNNABLE until a runnable command is written here |
| Clean arm passes when | `UNKNOWN` | OPEN |
| Planted-breach arm | `UNKNOWN` | NOT RUNNABLE until a breach arm is written here |
| Observed: clean arm | exit code and last line, copied after the run | OPEN |
| Observed: planted-breach arm | exit code and last line, copied after the run | OPEN |

For folder contents, `KIT/B12/` ships a ready comparison with its own planted arm: `compare FOLDER-A FOLDER-B` and `compare --plant FOLDER-A FOLDER-B` (usage in `KIT/B12/README.md`).

## Use now

1. From the folder that holds `KIT-MANIFEST.md`, run the clean arm. Copy its exit code and last line.
2. Run the planted-breach arm. It must end in `RESULT BREACH` with exit code 1.
3. If the clean arm reads `RESULT PASS` with exit code 0 and the planted arm reads `RESULT BREACH` with exit code 1, record the package claim in C05 as PASS. Otherwise record exactly what you saw.
4. For your first build, copy the check card and fill it. It stays `NOT RUNNABLE` until its command and planted arm exist and both have run.

## Adaptation notes

- Keep the planted-breach arm on every check you add. A check that has never failed on purpose has not shown it can see anything.
- Keep checks local and read-only unless C02 grants more.
- Record who approved any changed default.

## Completion check

- [ ] Both control arms ran and their exit codes and last lines were copied from the run.
- [ ] The clean arm returned 0 and the planted-breach arm returned 1.
- [ ] No check marked `NOT RUNNABLE` or `INSTRUMENT-UNAVAILABLE` is counted as PASS.
- [ ] The result binds the checked candidate: any change means a new run.
