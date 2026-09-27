# C12 | Usage budget and pacing plan

**Row ID:** `C12`

**Built tier:** `generic template`

**Purpose:** Usage budget and pacing plan

**Use after:** C02,C08

## How to use

Copy the template table, fill only facts supported by the named sources, and keep unresolved fields as `UNKNOWN`.

## Field notes

| Field | What belongs here |
|---|---|
| Session budget | Choose a time, message, or task boundary. |
| Mode | Choose interactive for judgment or batch for repetitive work. |
| Checkpoint | Name the artifact saved before the limit. |
| Resume condition | State the first read and next action. |

## Safe defaults

- Work in slices of one to three dependent items.
- Bank state before opening the next slice.
- At a limit, write the handoff and stop.

## Reusable stub

| Field | Recipient value | Source or decision | State |
|---|---|---|---|
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |

## Neutral worked example

The example shows shape, not recipient facts.

| Field | Example value |
|---|---|
| Session budget | One focused work block |
| Mode | Interactive for scope decisions |
| Checkpoint | Save the reviewed brief and handoff |
| Resume | Read the handoff, then open the next dependency |

## Adaptation notes

- Replace the example with inspected recipient facts.
- Keep the field names unless a recipient workflow requires a clearer local term.
- Record who approved any changed default.

## Completion check

- [ ] The stop rule preserves state.
- [ ] The resume step names a file and an action.
