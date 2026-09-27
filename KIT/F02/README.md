# F02 | Project map and context router

**Row ID:** `F02`

**Built tier:** `generic template`

**Purpose:** Project map and context router

**Use after:** F01,C02,C03

## How to use

Copy the template table, fill only facts supported by the named sources, and keep unresolved fields as `UNKNOWN`.

## Field notes

| Field | What belongs here |
|---|---|
| Room | Name the smallest useful project area. |
| Required reads | List only files needed on entry. |
| Write target | Name where this room leaves results. |
| Size cue | State when to split or archive. |

## Safe defaults

- Load the manifest and authority boundary first.
- Keep active context small and task-specific.
- Do not copy the same fact into several rooms.

## Reusable stub

| Field | Recipient value | Source or decision | State |
|---|---|---|---|
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |

## Neutral worked example

The example shows shape, not recipient facts.

| Field | Example value |
|---|---|
| Room | Review |
| Required reads | Project brief and evidence contract |
| Write target | review/receipt.md |
| Size cue | Archive after the decision is banked |

## Adaptation notes

- Replace the example with inspected recipient facts.
- Keep the field names unless a recipient workflow requires a clearer local term.
- Record who approved any changed default.

## Completion check

- [ ] Each room has a read and write contract.
- [ ] Shared facts have one source of truth.
