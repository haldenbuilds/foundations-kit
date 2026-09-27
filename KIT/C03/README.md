# C03 | Context and source-of-truth map

**Row ID:** `C03`

**Built tier:** `generic template`

**Copy status:** `PANEL-OWED`

**Purpose:** Context and source-of-truth map

**Use after:** C01

## How to use

Copy the template table, fill only facts supported by the named sources, and keep unresolved fields as `UNKNOWN`.

## Field notes

| Field | What belongs here |
|---|---|
| Source | Use a stable path, system name, or document title. |
| Authority | State what question this source is allowed to answer. |
| Owner and freshness | Name who maintains it and how age is judged. |
| Conflict rule | State which source wins or who decides. |

## Safe defaults

- Unknown ownership remains UNKNOWN.
- A newer timestamp does not automatically outrank a ratified source.
- Conflicts stop downstream claims until resolved.

## Reusable stub

| Field | Recipient value | Source or decision | State |
|---|---|---|---|
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |

## Neutral worked example

The example shows shape, not recipient facts.

| Field | Example value |
|---|---|
| Source | Approved project brief |
| Authority | Scope and success evidence |
| Owner | Project owner |
| Conflict rule | Ask the owner when the brief and status note disagree |

## Adaptation notes

- Replace the example with inspected recipient facts.
- Keep the field names unless a recipient workflow requires a clearer local term.
- Record who approved any changed default.

## Completion check

- [ ] Each source has a bounded authority.
- [ ] Unknown and unavailable are not treated as current.
