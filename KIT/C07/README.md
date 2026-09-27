# C07 | Decision and assumption log

**Row ID:** `C07`

**Built tier:** `generic template`

**Copy status:** `PANEL-OWED`

**Purpose:** Decision and assumption log

**Use after:** C01,C02

## How to use

Copy the template table, fill only facts supported by the named sources, and keep unresolved fields as `UNKNOWN`.

## Field notes

| Field | What belongs here |
|---|---|
| Type | Choose decision or assumption. |
| Statement | Write one testable sentence. |
| Owner and date | Name who decided and when. |
| Wake condition | State what evidence causes review. |

## Safe defaults

- Append new rows; do not silently rewrite history.
- Assumptions are not decisions.
- Superseded rows point to their replacement.

## Reusable stub

| Field | Recipient value | Source or decision | State |
|---|---|---|---|
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |

## Neutral worked example

The example shows shape, not recipient facts.

| Field | Example value |
|---|---|
| Type | Assumption |
| Statement | The project owner reviews drafts each Friday |
| Owner and date | Project owner, date pending |
| Wake condition | Review when cadence changes |

## Adaptation notes

- Replace the example with inspected recipient facts.
- Keep the field names unless a recipient workflow requires a clearer local term.
- Record who approved any changed default.

## Completion check

- [ ] Every row has an owner or UNKNOWN.
- [ ] Each assumption has a wake condition.
