# B08 | Change, install, and rollback record

**Row ID:** `B08`

**Built tier:** `fully kitted`

**Copy status:** `PANEL-OWED`

**Purpose:** Change, install, and rollback record

**Use after:** C02,B03,B07,P08

## Populated first instance

**Starter scenario:** The record for copying the project starter (`KIT/F07/starter/`) into a new project folder, the first change this package makes to your files when you reach F07. Nothing is changed until this record is complete and approved.

This record does not grant installation authority. Approval of the record covers the change and the rollback steps written in it, and nothing else.

| Field | Value |
|---|---|
| Target | `UNKNOWN` until the owner names the new project folder. The change stops if that folder already holds files. |
| Preconditions | (1) Owner approval naming this record and its target (C02: writing outside the workspace is a Stop act). (2) The B07 package check reads `RESULT PASS` before copying. (3) If the target already exists, a B12 `backup` of it ended in `RESULT PASS`. |
| Change set | Copy the five files of `KIT/F07/starter/` into the target, keeping their subfolders. No existing file is overwritten. |
| Verification | `compare KIT/F07/starter TARGET` from B12 must end in `RESULT PASS` with exit code 0. Its planted arm, `compare --plant KIT/F07/starter TARGET` (Windows: `compare -Plant`), must end in `RESULT FAIL` with exit code 1. |
| Rollback | If the target did not exist before: remove the copied target folder, which this record's approval covers. If it did exist: restore it from the precondition backup into a new folder with B12 `restore`, and the owner decides the replacement. |
| Rollback test | Before the change: B12 `backup --plant` on the target ends in `RESULT FAIL`, and B12 `backup` ends in `RESULT PASS`. Those two readings prove the rollback copy restores, with no live apply. For a new target, nothing needs restoring: the rollback is removing a folder that held nothing of yours. |
| Owner | Project owner approves. The agent prepares the record and runs the checks. |
| State | `NOT APPROVED` until the owner's approval of this exact record is written in C07. |

### Rules for every change record

- A change starts only when Target, Preconditions, Change set, Verification, and Rollback are filled. `UNKNOWN` in any of those five blocks the change.
- Snapshot existing targets before an authorized change: a B12 `backup` that ended in `RESULT PASS`.
- A failed verification triggers rollback or a stop decision. A failed rollback stops all further changes until the owner decides.
- Verification uses a runnable check with a planted-breach arm (B07 rules), never a description of what to look at.
- A new target, change set, or rollback step needs a new approval.

### Record for your own change

| Field | Your value | State |
|---|---|---|
| Target | `UNKNOWN` | OPEN |
| Preconditions | `UNKNOWN` | OPEN |
| Change set | `UNKNOWN` | OPEN |
| Verification | `UNKNOWN` | NOT RUNNABLE until a runnable check is written here |
| Rollback | `UNKNOWN` | OPEN |
| Rollback test | `UNKNOWN` | OPEN |
| Owner and approval record | `UNKNOWN` | NOT APPROVED |

## Use now

1. Fill the record before touching any file. Leave `UNKNOWN` where the answer is not known.
2. Show the owner the whole record and get approval of this exact record, written in C07.
3. Run the preconditions, then the change, then the verification, copying each reading into C05.
4. If verification fails, run the rollback as written and record both readings.

## Adaptation notes

- Keep rollback and its test inside the same record as the change they undo.
- Keep installs out of this record unless C02 grants that exact install.
- Record who approved any changed default.

## Completion check

- [ ] The exact candidate and target are named.
- [ ] Rollback can be tested without a live apply, and its test readings are recorded.
- [ ] The verification ran after the change and both of its arms were recorded.
