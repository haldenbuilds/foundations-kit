# B11 | Rule-to-carrier map

**Row ID:** `B11`

**Built tier:** `generic template`

**Purpose:** Rule-to-carrier map

**Use after:** C02,C05,B07

## How to use

Copy the template table, fill only facts supported by the named sources, and keep unresolved fields as `UNKNOWN`.

## Field notes

| Field | What belongs here |
|---|---|
| Rule | Write one standing requirement. |
| Carrier | Name the file or check that enforces it. |
| Proof | Point to a current result or owner record. |
| Gap flag | Use CARRIED or NO-CARRIER. |

## Safe defaults

- A prose mention is not a carrier unless it is loaded at the decision point.
- NO-CARRIER remains visible until repaired.
- Review the map whenever instructions change.

## Reusable stub

| Field | Recipient value | Source or decision | State |
|---|---|---|---|
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |

## Neutral worked example

The example shows shape, not recipient facts.

| Field | Example value |
|---|---|
| Rule | External sends require owner approval |
| Carrier | Authority boundary and pre-send check |
| Proof | Current approval matrix row |
| Gap flag | CARRIED |

## Adaptation notes

- Replace the example with inspected recipient facts.
- Keep the field names unless a recipient workflow requires a clearer local term.
- Record who approved any changed default.

## Completion check

- [ ] Every standing rule has one accountable carrier.
- [ ] No-carrier rows are never omitted from health status.
