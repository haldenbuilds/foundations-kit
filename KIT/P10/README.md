# P10 | Pricing and profit per customer sheet

**Row ID:** `P10`

**Built tier:** `fully kitted`

**Copy status:** `PANEL-OWED`

**Purpose:** Pricing and profit per customer sheet

**Use after:** P09,C07

## Populated first instance

**What it does:** Show what you earn on each customer, what it costs to win and serve them, and how fast the cash comes back.

**Starter scenario:** Pricing sheet for the neutral document-preparation service. The formulas are filled in; every business number reads UNKNOWN until the owner supplies it.

This first instance is populated with neutral, explicit starter content. Recipient-specific facts not supplied to the package remain `UNKNOWN` and must be confirmed before they are treated as authority.

| Surface | Populated content |
|---|---|
| Offer sequence | First offer: how a buyer starts (the P09 offer). Next offer: what they buy after the first result, UNKNOWN. Fallback offer: what you offer when they say no, a smaller scope or different payment terms, never the same thing for less, UNKNOWN. Repeat offer: what keeps them buying, such as the next update cycle, UNKNOWN. |
| Gross profit per sale | Price minus the cost to deliver that sale. Price: UNKNOWN (from P09). Cost to deliver: UNKNOWN. |
| Lifetime gross profit | For one-off sales: gross profit per sale times the average number of purchases per customer (all purchases so far divided by all customers so far). For recurring sales: the gross profit one customer brings in per billing period, divided by the share of customers who leave per billing period (customers lost in a billing period, counting only those active at its start, divided by the customers active at its start). Value: UNKNOWN. |
| Cost to win a customer | What you spent to get customers in a period you choose, divided by the new customers in that same period. Value: UNKNOWN. |
| Your line | Lifetime gross profit divided by the cost to win a customer. Write the lowest result at which you will keep spending money to win customers: UNKNOWN until the owner sets it. When the result is below your line, stop that spending until the price, the cost to deliver, or the cost to win changes, and record the decision in C07. |
| Payback check | Window: a number of days, counted from a customer's first payment, that you judge payback by. The owner sets it and uses the same window every time: UNKNOWN until set. Payback result: take the customers whose window has ended; for them, the average gross profit collected inside the window (what the customer paid inside the window, minus what it cost you to deliver what they paid for), minus the cost to win a customer. If the result is zero or more, each new customer pays for winning the next one. If it is below zero, write how many days, counted from each customer's first payment as the window is, it took for those customers' average gross profit to reach the cost to win a customer (UNKNOWN until it has), and how the business pays for the gap until then. This check does not replace Your line: Your line decides whether to keep spending to win customers; this check shows the cash you carry until a customer pays back. Answer: UNKNOWN until at least one window has ended. |
| Price-change log | Date, old price, new price, sales in the test period just before the change, sales in the test period after it, the sales needed at the new price (next row), and keep or revert. Starter: no rows yet. |
| Before a price change | Test period: the number of days you count sales over, set by the owner and the same before and after the change: UNKNOWN until set. Sales needed at the new price: sales in the test period just before the change, times the gross profit per sale at the old price, divided by the gross profit per sale at the new price. After a full test period at the new price, keep it if sales reached the number needed; otherwise revert. Change one thing at a time. |
| Example arithmetic (EXAMPLE, not a target) | Amounts in any currency. Price 400 and cost to deliver 150: gross profit per sale 400 - 150 = 250. Three purchases per customer: lifetime gross profit 250 × 3 = 750. Spent 1200 to win four customers: cost to win 1200 / 4 = 300. Lifetime gross profit over cost to win: 750 / 300 = 2.5. |
| Price change example (EXAMPLE, not a target) | In the test period before the change, 12 sales at 250 gross profit each: 12 × 250 = 3000. New price 450, so gross profit per sale 450 - 150 = 300. Sales needed in a test period at the new price: 3000 / 300 = 10. |
| Zero rule | A division has no result when the number you divide by is zero, and the sales needed at a new price also has none when the gross profit per sale at the new price is below zero. On this sheet that happens when there are no customers yet, no customers active at the start of a billing period, no customer lost in one, no new customer or nothing spent to win customers in the period you chose, no customer whose payback window has ended, or a new price at or below the cost to deliver. Never divide by zero, and never put an old result in its place. When the zero is in the share of customers who leave or in the cost to win a customer, work that number out again over a longer stretch: add the period just before (the billing period before, for the share; the period of the same length before, for the cost to win) to its top and bottom numbers, then the one before that, until the number you divide by is above zero, and write beside the result the periods it covers. In every other case, or when the number is still zero with every period so far added, write UNKNOWN and what was zero, such as UNKNOWN (no customers lost yet). Read that UNKNOWN as not known: it is left out when results are compared to pick one, any result worked out from it is UNKNOWN too, and a rule on this sheet that needs it to decide does not decide, so the owner decides and records the decision in C07. P11, P12 and P13 use this rule by name. |
| Safe default | Every number shows its source and date or reads UNKNOWN. Example arithmetic is marked as an example and is never a target. Spending money to win customers is a Stop act in C02. |

## Use now

1. Read the populated instance against its declared prerequisites.
2. Confirm which starter statements are true for the recipient.
3. Replace unsupported statements with `UNKNOWN`, then record the source or owner decision.
4. Run the row's completion or review check before depending on it.

## Adaptation notes

- Take price from P09 and delivery cost from real invoices or time records; turn recorded hours into money at the pay of whoever did the work, or at your hourly value from P13 for your own hours.
- Use the one-off or the recurring lifetime formula, whichever matches how customers buy; do not mix them.
- Record every price change in C07 and keep it in P05 as a risk until its test period at the new price has ended.
- Record the payback window and the test period, and why you chose each, in C07; if you change either, record the change there too.
- Delete the example rows once your own numbers are in.

## Completion check

- [ ] Every recipient-specific statement has a source or owner decision.
- [ ] Unknowns remain visible.
- [ ] Any consequential next action is inside the authority boundary.
- [ ] The payback window is the owner's own number or still reads UNKNOWN.
- [ ] Each price change has its test period, the sales needed, and a keep or revert decision.
- [ ] The example rows are deleted or still marked EXAMPLE.
- [ ] Every division whose bottom number is zero follows the zero rule: a longer stretch or UNKNOWN, never an old result.
