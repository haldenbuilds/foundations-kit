# C06 | Data, privacy, and security check

**Row ID:** `C06`

**Built tier:** `generic template`

**Copy status:** `PANEL-OWED`

**Purpose:** Data, privacy, and security check

**Use after:** C02,C03

## How to use

Copy the template table, fill only facts supported by the named sources, and keep unresolved fields as `UNKNOWN`.

## Field notes

| Field | What belongs here |
|---|---|
| Data class | Name public, internal, confidential, or restricted data. |
| Action | Record read, transform, store, or send. |
| Control | Name the least authority and handling rule. |
| Stop condition | State what needs human approval. |

## Safe defaults

- Do not place credentials in prompts or files.
- External sends and irreversible actions stop for approval.
- Use the least sensitive source that answers the question.

## Reusable stub

| Field | Recipient value | Source or decision | State |
|---|---|---|---|
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |

## Neutral worked example

The example shows shape, not recipient facts.

| Field | Example value |
|---|---|
| Data class | Internal project status |
| Action | Summarize locally |
| Control | Use only the named status file |
| Stop condition | Stop before sharing outside the project team |

## Adaptation notes

- Replace the example with inspected recipient facts.
- Keep the field names unless a recipient workflow requires a clearer local term.
- Record who approved any changed default.

## Completion check

- [ ] No credential value is recorded.
- [ ] Each external boundary has an approval condition.
