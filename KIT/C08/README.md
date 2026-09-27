# C08 | Session handoff and continuity note

**Row ID:** `C08`

**Built tier:** `generic template`

**Purpose:** Session handoff and continuity note

**Use after:** C03,C07

## How to use

Copy the template table, fill only facts supported by the named sources, and keep unresolved fields as `UNKNOWN`.

## Field notes

| Field | What belongs here |
|---|---|
| Current state | State the last completed boundary. |
| Evidence | Point to checks and decisions. |
| Changed files | List exact recipient-package paths. |
| Next act and blockers | Name one next act, its owner, and any stop. |

## Safe defaults

- Bank state before a session ends.
- List no changed file that was not inspected.
- One named next act is better than a vague backlog.

## Reusable stub

| Field | Recipient value | Source or decision | State |
|---|---|---|---|
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |

## Neutral worked example

The example shows shape, not recipient facts.

| Field | Example value |
|---|---|
| Current state | Project brief drafted |
| Evidence | Scope checklist passed |
| Changed files | PROJECT-BRIEF.md |
| Next act | Owner reviews the evidence table |

## Adaptation notes

- Replace the example with inspected recipient facts.
- Keep the field names unless a recipient workflow requires a clearer local term.
- Record who approved any changed default.

## Completion check

- [ ] Status surfaces and decisions are updated.
- [ ] Changed files and the next act are named.
