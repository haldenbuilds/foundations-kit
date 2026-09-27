# C05 | Evidence and completion contract

**Row ID:** `C05`

**Built tier:** `fully kitted`

**Purpose:** Evidence and completion contract

**Use after:** C01,C02

## Populated first instance

**Starter scenario:** The contract that decides when the agent may call any piece of work done, starting with this package itself.

The words *done, complete, finished, fixed, works, verified,* and *passed* may be used only about a claim that has a PASS row in the claim ledger below. Anything else is still a draft, and the agent must say so.

### What discharges a claim

A claim is discharged by one of these three kinds of evidence, captured after the last change to the thing the claim is about:

| Evidence kind | What must be recorded | Example |
|---|---|---|
| Command | The command as it was run, the folder it ran from, its exit code, and the line that decides the result, copied from the run. | `sh KIT/B07/check-kit-mac-linux.sh` run from the package folder: exit code 0, last line `RESULT PASS`. |
| File | The exact path and a fingerprint of the file as it was checked (its sha256, or at least its size and last-modified time), so a later change is visible. | `KIT/C05/README.md`, sha256 recorded in the ledger row. |
| Owner decision | Who decided, their exact words, the date, and where those words are kept (a named file, message, or record). | "Approved for internal use", project owner, dated, kept in the C07 log. |

### What never discharges a claim

- The agent's own statement that it did the work, or its summary of what it did.
- A plan, a draft, or "this should work".
- A check that was not run, or that ran before the last change.
- A check pointed at something other than the thing claimed.
- A zero ("nothing found") that does not name exactly what was searched and where.
- An UNAVAILABLE or INSTRUMENT-UNAVAILABLE reading.
- Silence, or an approval given for a different claim.

### Claim ledger

Result values are PASS, FAIL, or UNAVAILABLE. UNAVAILABLE never becomes PASS.

| Claim | Evidence kind | Evidence | Reading copied from the run | Result | Checked after the last change? |
|---|---|---|---|---|---|
| This package is complete: every listed file exists and every file is listed. | Command | B07 package check, clean arm | `UNKNOWN` until run | `UNKNOWN` | `UNKNOWN` |
| The package check can see a breach. | Command | B07 package check, planted-breach arm (exit code 1 expected) | `UNKNOWN` until run | `UNKNOWN` | `UNKNOWN` |
| The project folder can be restored from its backup. | Command | B12 routine: `backup` (exit code 0 expected) and its planted-breach arm (exit code 1 expected) | `UNKNOWN` until run | `UNKNOWN` | `UNKNOWN` |
| [your claim] | `UNKNOWN` | `UNKNOWN` | `UNKNOWN` | `UNKNOWN` | `UNKNOWN` |

### How the owner holds the agent to this

Ask: **"Show me the ledger row for that."** The agent must either show a PASS row whose evidence matches the claim and was captured after the last change, or withdraw the word and say what evidence is still missing. There is no third answer.

## Use now

1. Before the agent calls anything done, it adds a ledger row for the claim.
2. It runs or collects the evidence and copies the reading into the row.
3. If it cannot produce the evidence, the row reads UNAVAILABLE and the agent reports the work as not done.
4. Start with the first three rows: they can be discharged today with the B07 and B12 commands.

## Adaptation notes

- Keep the three evidence kinds. Add a kind only by an owner decision recorded in C07.
- A zero is valid only with its searched pattern set.
- Changed bytes invalidate earlier evidence.

## Completion check

- [ ] Every PASS names its evidence and was captured after the last change.
- [ ] Every zero names its search scope.
- [ ] No claim of done, complete, fixed, works, verified, or passed stands without a PASS row.
