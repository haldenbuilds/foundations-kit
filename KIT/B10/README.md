# B10 | Health, freshness, and drift check

**Row ID:** `B10`

**Built tier:** `generic template`

**Copy status:** `PANEL-OWED`

**Purpose:** Health, freshness, and drift check

**Use after:** B01,B02,B07,B08,B11

## How to use

Copy the template table, fill only facts supported by the named sources, and keep unresolved fields as `UNKNOWN`.

## Field notes

| Field | What belongs here |
|---|---|
| Surface | Name what may become stale or unreachable. |
| Source and threshold | Name authority and expiry rule. |
| Procedure and receipt | State a read-only check and durable result. |
| Unavailable behavior | State what stops when the check cannot run. |

## Safe defaults

- Checks are local and read-only by default.
- Load-path health includes every manifest file.
- UNAVAILABLE blocks a clean health claim.

## Reusable stub

| Field | Recipient value | Source or decision | State |
|---|---|---|---|
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |

## Neutral worked example

The example shows shape, not recipient facts.

| Field | Example value |
|---|---|
| Surface | Agent load path |
| Source | Manifest and agent instructions |
| Procedure | Confirm every package file is routed directly or through its row artifact |
| Unavailable | Report degraded state and stop the clean claim |

## Adaptation notes

- Replace the example with inspected recipient facts.
- Keep the field names unless a recipient workflow requires a clearer local term.
- Record who approved any changed default.

## Completion check

- [ ] Freshness and reachability are separate readings.
- [ ] Every zero names the scanned manifest paths.
