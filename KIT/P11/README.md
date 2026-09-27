# P11 | Leads and sales conversation board

**Row ID:** `P11`

**Built tier:** `fully kitted`

**Copy status:** `PANEL-OWED`

**Purpose:** Leads and sales conversation board

**Use after:** P09,C02,C06

## Populated first instance

**What it does:** Track how strangers become buyers, step by step, and run each sales conversation from the same short structure.

**Starter scenario:** Lead board for the neutral document-preparation service. The structure is filled in; counts read UNKNOWN.

This first instance is populated with neutral, explicit starter content. Recipient-specific facts not supplied to the package remain `UNKNOWN` and must be confirmed before they are treated as authority.

| Surface | Populated content |
|---|---|
| Who to reach | People who match the buyer in P09. Once P09 names the traits your best customers share, reach people with those traits first. |
| Ways in | There are four ways to reach buyers. People who know you, one at a time. People who know you, many at once, such as posts or a newsletter. People who do not know you yet, one at a time. People who do not know you yet, many at once, such as paid ads. Starter: which ones you use, the daily volume for each, and who does it are UNKNOWN. |
| Daily volume | For each way in you use, the number of outreach actions per day you commit to, set by the owner: UNKNOWN. Write what counts as one action, such as one message sent or one post published. Keep the volume steady until every step in the step table has reached the owner's minimum count. |
| Step table | One row per step from first contact to paid, such as reached, replied, talked, bought. At each weekly read (P12), write for the week since the last read the number who reached each step and the number who moved on to the next step. Starter counts: UNKNOWN. Conversion rate at a step: add up the weeks since you started counting, or since the last change to that step if there was one, then divide the number who moved on to the next step by the number who reached this step. If nobody reached the step in those weeks, its rate is UNKNOWN by P10's zero rule and the step is left out when rates are compared. Minimum count: how many people must reach a step, in those same weeks, before you trust its rate; set by the owner: UNKNOWN until set. Which step to work on: while a change is running (below), its step, and no other. Otherwise, among the steps that have reached the minimum count, the one with the lowest conversion rate, not the one that loses the most people (an early step can lose the most people and still convert well). If steps tie, work on the one nearer to paid. If no step has reached the minimum count, change nothing yet. Which change to make at a newly picked step: list the changes you could make to it, such as a different message, a different offer, or a different question in the conversation, each with what it would cost to make, in money, counting your own hours at your hourly value from P13 (set it there first if it reads UNKNOWN). Make the change with the lowest cost; if costs tie, make the one higher on your list. The change is running from when you make it until its step reaches the minimum count again: keep it that long, and record the rate before and after. At each weekly read this table gives P12 exactly one answer: the running change and its step, a new change and its step, or no change yet. |
| Conversation structure | Where are they now? Where do they want to be? What is in the way? What does staying where they are cost them? Does our offer close that gap? Say so honestly if it does not. Then ask for a decision. |
| Objection log | The objection in the buyer's words, how many times you have heard it, and what you changed because of it: the offer, the content, or the conversation. Starter: no entries yet. |
| Contact data | Names, contact details, and notes about people are personal data. Check C06 before storing them. |
| Safe default | The agent may draft outreach and notes. Sending any message outside the workspace needs the owner's exact approval: it is a Stop act in C02. |

## Use now

1. Read the populated instance against its declared prerequisites.
2. Confirm which starter statements are true for the recipient.
3. Replace unsupported statements with `UNKNOWN`, then record the source or owner decision.
4. Run the row's completion or review check before depending on it.

## Adaptation notes

- Rename the steps to match how buyers actually move through your business.
- Keep the weekly counts here and copy the weekly totals into P12.
- Every outreach message is an external send: the agent drafts, the owner sends.
- Change one step at a time so you can tell what made the difference.
- Record the minimum count and why you chose it in C07.

## Completion check

- [ ] Every recipient-specific statement has a source or owner decision.
- [ ] Unknowns remain visible.
- [ ] Any consequential next action is inside the authority boundary.
- [ ] Each step shows its conversion rate, or UNKNOWN by the zero rule, and the step being worked on is the one the step table picks: the running change's step, or else the lowest rate among the steps at the minimum count.
- [ ] A new change is the one with the lowest cost on your list for its step.
- [ ] No message leaves the workspace without the owner's exact approval.
