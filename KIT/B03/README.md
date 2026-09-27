# B03 | Build and capability inventory

**Row ID:** `B03`

**Built tier:** `generic template`

**Copy status:** `PANEL-OWED`

**Purpose:** Build and capability inventory

**Use after:** C03,F04,F06

## How to use

Copy the template table, fill only facts supported by the named sources, and keep unresolved fields as `UNKNOWN`.

## Field notes

| Field | What belongs here |
|---|---|
| Capability | Name the tool, workflow, or surface. |
| Owner and state | Record owner plus active, parked, retired, or unknown. |
| Dependencies | Name upstream services or files. |
| Freshness evidence | Record inspection date and receipt. |

## Safe defaults

- Inventory only authorized surfaces.
- UNKNOWN is a valid measured state.
- Begin with ten or fewer high-use capabilities.

## Reusable stub

| Field | Recipient value | Source or decision | State |
|---|---|---|---|
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |

## Neutral worked example

The example shows shape, not recipient facts.

| Field | Example value |
|---|---|
| Capability | Project status note |
| Owner | Project owner |
| Dependencies | Approved brief |
| Freshness | Inspected during current review |

## Adaptation notes

- Replace the example with inspected recipient facts.
- Keep the field names unless a recipient workflow requires a clearer local term.
- Record who approved any changed default.

## Completion check

- [ ] Every value is observed or marked UNKNOWN.
- [ ] The census scope is recorded.
