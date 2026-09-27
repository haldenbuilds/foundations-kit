# C13 | Correction and disagreement protocol

**Row ID:** `C13`

**Built tier:** `generic template`

**Copy status:** `PANEL-OWED`

**Purpose:** Correction and disagreement protocol

**Use after:** C05,C07

## How to use

Copy the template table, fill only facts supported by the named sources, and keep unresolved fields as `UNKNOWN`.

## Field notes

| Field | What belongs here |
|---|---|
| Challenge | Quote the disputed claim and expected correction. |
| Re-verify | Name the authoritative source and check. |
| Record | Append the correction and affected outputs. |
| Stop condition | Escalate after repeated failure or source conflict. |

## Safe defaults

- Recheck before defending the prior answer.
- Correct downstream artifacts, not only the chat response.
- Two repeated failures on the same rule stop work for human review.

## Reusable stub

| Field | Recipient value | Source or decision | State |
|---|---|---|---|
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |

## Neutral worked example

The example shows shape, not recipient facts.

| Field | Example value |
|---|---|
| Challenge | The reported due date conflicts with the approved brief |
| Re-verify | Read the approved brief |
| Record | Append a correction to the decision log |
| Stop condition | Escalate if two approved sources conflict |

## Adaptation notes

- Replace the example with inspected recipient facts.
- Keep the field names unless a recipient workflow requires a clearer local term.
- Record who approved any changed default.

## Completion check

- [ ] The corrected claim cites its source.
- [ ] Affected artifacts are listed.
