# P07 | SOP and playbook capture

**Row ID:** `P07`

**Built tier:** `generic template`

**Purpose:** SOP and playbook capture

**Use after:** P03,F04

## How to use

Copy the template table, fill only facts supported by the named sources, and keep unresolved fields as `UNKNOWN`.

## Field notes

| Field | What belongs here |
|---|---|
| Trigger and owner | Name when the procedure runs and who owns it. |
| Inputs | List required materials and preconditions. |
| Steps | Use observable actions in order. |
| Proof and exceptions | Name completion evidence and escalation paths. |

## Safe defaults

- Capture only a process observed at least once.
- Keep one action per step.
- Exceptions stop or branch explicitly.

## Reusable stub

| Field | Recipient value | Source or decision | State |
|---|---|---|---|
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |

## Neutral worked example

The example shows shape, not recipient facts.

| Field | Example value |
|---|---|
| Trigger | A monthly update is requested |
| Inputs | Approved brief and current status |
| Steps | Draft, source-check, independent review, owner approval |
| Proof | Approved update and review receipt |

## Adaptation notes

- Replace the example with inspected recipient facts.
- Keep the field names unless a recipient workflow requires a clearer local term.
- Record who approved any changed default.

## Completion check

- [ ] A new operator can identify the next action.
- [ ] The proof is separate from the author claim.
