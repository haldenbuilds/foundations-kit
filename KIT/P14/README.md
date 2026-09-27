# P14 | Delegation card

**Row ID:** `P14`

**Built tier:** `generic template`

**Purpose:** Delegation card

**Use after:** P07,P08,C02

## How to use

**What it does:** Hand one task to a person or to the agent with the steps, the limits, and the check written down first.

Copy the template table, fill only facts supported by the named sources, and keep unresolved fields as `UNKNOWN`.

## Field notes

| Field | What belongs here |
|---|---|
| Task | The task, and how it makes or saves money. |
| Who takes it | A named person or the agent. |
| Ready to hand off | The readiness bar, set by the owner before handing off: how many times the owner has done the task themselves (`UNKNOWN` until the owner sets the number), plus these yes-or-no tests. Can you list the steps from memory? Can you name the ways it goes wrong? Can you write What good looks like for this task as a yes-or-no check or a number? Hand it off when the count is met and every answer is yes. |
| Steps | The steps, taken from a P07 SOP. |
| Decisions they may make alone | The money limit: the most a single decision may cost for them to make it alone. For the agent, this limit lives in C02. For a person, write it in P08 as a row of its own. |
| Decisions that come back | The cases that always come back to you. |
| What good looks like | The check that says the task was done well, written so it can be answered yes or no, or as a number the owner writes down, such as the most edits the owner will make before approving. |
| Handover stages | They watch you do it. You watch them do it. They do it and you stay available. Each stage lasts until the next review date. Stage minimum: the count of results since the last review that a stage needs before it can move, set by the owner and written on this card: `UNKNOWN` until set. Choose it as the number of passing results you would need to see before you trust them with less of your watching, and ask for more when a bad result would cost more; record the number and why in C07. At that review, move to the next stage only if the count of results since the last review is at least the stage minimum and every one passed What good looks like; otherwise stay at the stage you are in. Until the stage minimum is set, no stage moves. |
| Review date | The dates you look at the results together. Put each one in P06. |

## Safe defaults

- Until the owner writes a money limit, every decision comes back.
- A stage ends or moves only at a review date, by the Handover stages rule, never on a single result in between.
- Handing the agent anything that sends, spends, deletes, or changes a live system needs a recorded owner decision in C07 first.

## Reusable stub

| Field | Recipient value | Source or decision | State |
|---|---|---|---|
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |
| [field] | `UNKNOWN` | [source or owner decision] | OPEN |

## Neutral worked example

The example shows shape, not recipient facts.

| Field | Example value |
|---|---|
| Task | Draft the monthly project update; it saves the owner's writing time |
| Who takes it | The agent |
| Ready to hand off | The owner's count is met and every test is yes |
| Decisions they may make alone | Wording and order of the draft; no money decisions |
| Decisions that come back | Anything sent outside the workspace, and any source conflict |
| What good looks like | Yes or no: every claim links to a source, and the owner approves the draft with no more edits than the number the owner wrote on this card (`UNKNOWN` until the owner writes it) |
| Handover stages | The agent reads past updates; the owner reviews each agent draft; the agent drafts and the owner approves |
| Review date | Each P06 weekly review |

## Adaptation notes

- Replace the example with inspected recipient facts.
- Keep the field names unless a recipient workflow requires a clearer local term.
- Record who approved any changed default.

## Completion check

- [ ] The card names who takes the task and the money limit, or shows it as `UNKNOWN`.
- [ ] The readiness bar is set by the owner, or shows as `UNKNOWN`, and the task is handed off only once it is met.
- [ ] What good looks like can be answered yes or no, or as a number the owner wrote down.
- [ ] Every Stop act handed to the agent has a recorded owner decision in C07.
- [ ] The stage minimum is set by the owner, or shows as `UNKNOWN`, and no stage has moved while it reads `UNKNOWN`.
