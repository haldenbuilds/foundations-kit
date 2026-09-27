# P05 | Decision, risk, and issue register

**Row ID:** `P05`

**Built tier:** `generic template`

**Purpose:** Decision, risk, and issue register

**Use after:** C07,P03

## How to use

Copy the template table, fill only facts supported by the named sources, and keep unresolved fields as `UNKNOWN`.

## Field notes

| Field | What belongs here |
|---|---|
| Type | Choose decision, assumption, risk, issue, or blocker. |
| Statement | Describe one condition or event. |
| Owner and trigger | Name who watches and what activates action. |
| Mitigation and state | Record the response and current state. |

## Safe defaults

- UNKNOWN is allowed; invented severity is not.
- A risk is future; an issue is current.
- Closed rows retain their resolution evidence.

## Reusable stub

| Field | Recipient value | Source or decision | State |
|---|---|---|---|
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |

## Neutral worked example

The example shows shape, not recipient facts.

| Field | Example value |
|---|---|
| Type | Risk |
| Statement | Owner review may miss the reporting date |
| Owner | Project owner |
| Mitigation | Prepare the draft one work block earlier |

## Adaptation notes

- Replace the example with inspected recipient facts.
- Keep the field names unless a recipient workflow requires a clearer local term.
- Record who approved any changed default.

## Completion check

- [ ] Every open row has an owner.
- [ ] Closed rows name resolution evidence.
