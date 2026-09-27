# F01 | Root folder map

**Row ID:** `F01`

**Built tier:** `generic template`

**Purpose:** Root folder map

**Use after:** C03

## How to use

Copy the template table, fill only facts supported by the named sources, and keep unresolved fields as `UNKNOWN`.

## Field notes

| Field | What belongs here |
|---|---|
| Route | Name a relative folder or stable system location. |
| Purpose | State what belongs there. |
| Read when | Name the task trigger. |
| Owner | Name who may change the route. |

## Safe defaults

- Map existing folders before proposing new ones.
- Use relative routes in portable project material.
- Unknown destinations stay unassigned.

## Reusable stub

| Field | Recipient value | Source or decision | State |
|---|---|---|---|
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |

## Neutral worked example

The example shows shape, not recipient facts.

| Field | Example value |
|---|---|
| Route | projects/current |
| Purpose | Active project work |
| Read when | Starting or resuming a project |
| Owner | Project owner |

## Adaptation notes

- Replace the example with inspected recipient facts.
- Keep the field names unless a recipient workflow requires a clearer local term.
- Record who approved any changed default.

## Completion check

- [ ] Every route has one primary purpose.
- [ ] No existing file is moved by this map.
