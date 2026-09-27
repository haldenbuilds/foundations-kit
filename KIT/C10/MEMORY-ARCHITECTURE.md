# C10 | Memory architecture

**Row ID:** `C10`

**Built tier:** `generic template`

**Purpose:** Memory architecture

**Use after:** C09

## How to use

Copy the template table, fill only facts supported by the named sources, and keep unresolved fields as `UNKNOWN`.

## Field notes

| Field | What belongs here |
|---|---|
| Index entry | Keep a short pointer, not the whole fact. |
| Fact note | Store one durable fact with source and date. |
| Recall trigger | Name when the agent should load the note. |
| Supersession | Point old facts to the current note. |

## Safe defaults

- The index stays under forty entries.
- One durable fact lives in one note.
- Consolidate at the cap; never silently duplicate.

## Reusable stub

| Field | Recipient value | Source or decision | State |
|---|---|---|---|
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |

## Neutral worked example

The example shows shape, not recipient facts.

| Field | Example value |
|---|---|
| Index entry | Review cadence |
| Fact note | Owner reviews project status weekly |
| Recall trigger | Load before preparing a status review |
| Supersession | Replace only after an owner decision |

## Adaptation notes

- Replace the example with inspected recipient facts.
- Keep the field names unless a recipient workflow requires a clearer local term.
- Record who approved any changed default.

## Completion check

- [ ] Each fact has a source and review date.
- [ ] The index links to one current note per topic.
