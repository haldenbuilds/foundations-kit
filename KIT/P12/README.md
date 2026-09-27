# P12 | Weekly numbers and cash sheet

**Row ID:** `P12`

**Built tier:** `fully kitted`

**Copy status:** `PANEL-OWED`

**Purpose:** Weekly numbers and cash sheet

**Use after:** P02,P10,P11

## Populated first instance

**What it does:** Read a short set of numbers once a week from named sources, including how many weeks of cash you have left.

**Starter scenario:** Weekly numbers sheet for the neutral document-preparation service. The columns are set; every value reads UNKNOWN until the owner names its source.

This first instance is populated with neutral, explicit starter content. Recipient-specific facts not supplied to the package remain `UNKNOWN` and must be confirmed before they are treated as authority.

| Surface | Populated content |
|---|---|
| Cash in the bank | The amount and the date it was read: UNKNOWN until the owner names the source. Reading a bank balance is outside the workspace, so the agent proposes it first (C02). |
| Cash this week | On this sheet, this week means the time since the last weekly read. Cash collected and cash paid out this week: UNKNOWN. On the first read there is no last read, so these stay UNKNOWN. |
| Your window | A number of weeks, set by the owner and the same every week: UNKNOWN until set. Looking back, it covers that number of the most recent weekly rows. Looking ahead, it covers that number of weeks after the date of this read. |
| Weeks ahead | Known cash coming in and known payments due inside your window after the date of this read, such as payroll, rent, tax, and subscriptions: UNKNOWN. Put known tax and payment dates in P05 as dated risks. |
| Sales numbers | This week's counts from the P11 step table, as the number who reached each of these steps: its opening step (new leads), the step where you talk with the buyer (sales conversations), and its paid step (new customers): UNKNOWN. |
| Money numbers | Revenue collected this week, and gross margin: gross profit divided by revenue collected, where gross profit is the revenue collected minus what it cost you to deliver what that money paid for (P10's definitions): UNKNOWN. In a week with no revenue collected, gross margin is UNKNOWN (no revenue collected) by P10's zero rule. |
| Weeks of cash | Add up the cash paid out and the cash collected in the weekly rows your window covers. If more went out than came in, the average weekly shortfall is paid out minus collected, divided by the number of weeks in your window, and weeks of cash is cash in the bank divided by that average. Otherwise write no shortfall. Until the sheet has at least your window's number of weekly rows, weeks of cash reads UNKNOWN. |
| Customers lost | Count only customers who were active at the last weekly read, and write how many of them were lost this week; new customers in the same week do not change it. What counts as lost, such as a cancellation or no purchase inside a stretch you choose, is the owner's rule, written once in C07: UNKNOWN until written. |
| The one constraint | End each weekly read by naming the one thing that most limits the business right now: sales, time, or money, as P13's start question decides. Then write the one fix for next week, which is the answer the page for that limit gives. Sales: the answer P11's step table gives at this read, which is the running change and its step, a new change and its step, or no change yet. Time or money: the change P13's Pick one chose last for that limit, as written in its P03 brief, or no change when Pick one picked nothing or has not been run for that limit yet. Write that answer as it stands, no change included: nothing else picks the fix. |
| Weekly row | Date, each number above with its source, the one constraint, and the one fix. Starter: no rows yet. |
| Example arithmetic (EXAMPLE, not a target) | Amounts in any currency. This example's owner set a window of 4 weeks. Over those weeks, collected 4000 and paid out 10000: shortfall 10000 - 4000 = 6000, average weekly shortfall 6000 / 4 = 1500. Cash in the bank 7500: weeks of cash 7500 / 1500 = 5. |
| Rules | Every number shows its source and date or reads UNKNOWN. Count money when it is collected, not when it is invoiced, and never count the same money twice. Add a new row each week. Never edit an old row; correct it with a new row that says so. Targets never go on this sheet: every number on it is read from a named source. |

## Use now

1. Read the populated instance against its declared prerequisites.
2. Confirm which starter statements are true for the recipient.
3. Replace unsupported statements with `UNKNOWN`, then record the source or owner decision.
4. Run the row's completion or review check before depending on it.

## Adaptation notes

- Name the source for every number once, such as the bank, the invoicing tool, or the P11 board, and read it the same way each week.
- Bring this sheet to the P06 weekly review.
- For any money or pipeline outcome on the P02 scoreboard, use the numbers here as the source, so the business keeps one set of numbers, not two.
- Record your window and why you chose it in C07; if you change it, record the change there too.
- Delete the example row once your own rows start.

## Completion check

- [ ] Every recipient-specific statement has a source or owner decision.
- [ ] Unknowns remain visible.
- [ ] Any consequential next action is inside the authority boundary.
- [ ] Old rows are corrected by new rows, never edited.
- [ ] Your window is the owner's own number or still reads UNKNOWN.
- [ ] The one fix is the answer the page for the named limit gives: P11 for sales, P13's Pick one for time or money.
