# P13 | Bottleneck finder: sales, time, and money

**Row ID:** `P13`

**Built tier:** `fully kitted`

**Copy status:** `PANEL-OWED`

**Purpose:** Bottleneck finder: sales, time, and money

**Use after:** P01,C02

## Populated first instance

**What it does:** Start here for business work: find what limits the business most, where your hours and money go, and the one change that frees the most.

**Starter scenario:** Bottleneck finder for the neutral document-preparation service. The questions and audit columns are set; the answers read UNKNOWN until the owner gives them.

This first instance is populated with neutral, explicit starter content. Recipient-specific facts not supplied to the package remain `UNKNOWN` and must be confirmed before they are treated as authority.

| Surface | Populated content |
|---|---|
| Start here | Ask one question. If demand doubled tomorrow, would the business double or break? If it would double, sales is the limit: go to P09, then P11. If it would break because you could not deliver, time is the limit: do the time audit below, then Pick one. If it would break because you could not pay for it, money is the limit: go to P12, then P10, then do the cost audit below and Pick one. If it would break for both reasons, start with money, then come back for time. Starter answer: UNKNOWN until the owner answers. |
| If you keep a step table | If sales is the limit and you keep the P11 step table, work on the step that P11's own rule picks. |
| Your period | The number of days every hour and every amount on this sheet is counted over. The owner sets it: UNKNOWN until set. The time audit logs that number of days of work. |
| Time audit | Log every task in your period as you do it, or rebuild the period from your calendar. Then check the calendar for recurring tasks that did not come up in the period and add them, each with its hours per period: the hours it takes each time, times the days in your period, divided by the days from each time it happens to the next. List every recurring task with its hours per period, and give each one a mark on the judgment scale below. Starter task list: UNKNOWN. |
| Judgment scale | The owner marks each task by how much of the owner's own judgment it needs. Green, none: someone else can do it now. Yellow, some: it can go once its steps and decisions are written down. Red, all: nobody else can do it yet. Grey: nobody needs it, so stop doing it. The marks only build the list of candidates: each Grey task is a candidate to stop, each Green task a candidate to hand off, and each Yellow task a candidate to write down. Red tasks stay with the owner and are not candidates. The marks and the hours do not rank the list; only Pick one does. |
| Cost audit | List every recurring cost with its amount per period (a bill that covers a different stretch: its amount, times the days in your period, divided by the days the bill covers), the job it does, when it was last used, and a decision: keep, cut, renegotiate, or replace. Every cut, renegotiate, or replace line is a candidate. Put the cancel-by date beside anything you plan to cut. Starter cost list: UNKNOWN. |
| Pick one | This is the only rule that chooses. Put every candidate in money per period: the hours it frees per period (for a Yellow task, the hours it will free once it is written down and handed off) times your hourly value, plus any money it saves per period, minus any money it costs per period, such as a tool or the pay of the person who takes the task. A one-time cost counts as its amount, times the days in your period, divided by the days you expect the change to last. Your hourly value is set by the owner: UNKNOWN until set. If you have no figure yet, divide the business's gross profit over your period by the hours you worked in it. If you worked no hours in it, P10's zero rule applies: the division has no result, and your hourly value stays UNKNOWN until you set it. Choose the single candidate worth the most money. If no candidate is worth more than zero, pick nothing and keep the list. If candidates tie, choose the one that frees more of your hours; if they still tie, take the one higher on your list. Write it as a project brief in P03, and leave the rest on the list. |
| Order of work | When the picked change is a task: question it, delete it if you can, simplify what is left, speed it up, and only then automate it or hand it off. |
| Where results go | Besides its P03 brief, the picked change goes to one place: a Grey task to C07 as a decision to stop it, a Green task to P14 to be handed off, a Yellow task to P07 to be written down, and a cost to cut, renegotiate, or replace through C14. |
| Safe default | Cancelling, buying, or changing any account needs the owner's exact approval: it is a Stop act in C02. |

## Use now

1. Read the populated instance against its declared prerequisites.
2. Confirm which starter statements are true for the recipient.
3. Replace unsupported statements with `UNKNOWN`, then record the source or owner decision.
4. Run the row's completion or review check before depending on it.

## Adaptation notes

- Ask the start question again whenever the business changes; the limit moves.
- Log a normal period, not a quiet or unusual one.
- Delete before you automate: automating a task nobody needs only repeats the waste faster.
- Use the same period and the same hourly value for every comparison, and record how you set both in C07.
- The chosen change becomes a P03 project; the rest stays on the list.

## Completion check

- [ ] Every recipient-specific statement has a source or owner decision.
- [ ] Unknowns remain visible.
- [ ] Any consequential next action is inside the authority boundary.
- [ ] The start question has an answer and names the next sheet to open.
- [ ] Every task has a mark on the judgment scale, and the chosen change is compared in money using the owner's hourly value.
- [ ] Every hour and every amount on the sheet is counted over your period.
