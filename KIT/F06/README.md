# F06 | Naming, version, and archive rules

**Row ID:** `F06`

**Built tier:** `generic template`

**Purpose:** Naming, version, and archive rules

**Use after:** F01,C02

## How to use

Copy the template table, fill only facts supported by the named sources, and keep unresolved fields as `UNKNOWN`.

## Field notes

| Field | What belongs here |
|---|---|
| Object type | Name the document or folder class. |
| Pattern | Use a short human-readable rule. |
| Version rule | State when a new version is created. |
| Archive rule | Name trigger, location, and recovery note. |

## Safe defaults

- Use lowercase words separated by hyphens for new files.
- Use dates only when chronology aids retrieval.
- Propose renames; do not migrate existing files automatically.

## Reusable stub

| Field | Recipient value | Source or decision | State |
|---|---|---|---|
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |

## Neutral worked example

The example shows shape, not recipient facts.

| Field | Example value |
|---|---|
| Object type | Status report |
| Pattern | status-YYYY-MM-DD.md |
| Version | New file for each approved reporting date |
| Archive | Move after the next report is approved |

## Adaptation notes

- Replace the example with inspected recipient facts.
- Keep the field names unless a recipient workflow requires a clearer local term.
- Record who approved any changed default.

## Completion check

- [ ] Patterns avoid hidden meaning.
- [ ] Archive actions preserve a recovery route.
