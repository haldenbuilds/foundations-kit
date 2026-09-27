# B02 | Internal review and audit loop

**Row ID:** `B02`

**Built tier:** `fully kitted`

**Copy status:** `PANEL-OWED`

**Purpose:** Internal review and audit loop

**Use after:** C05,C06,P05,P08

## Populated first instance

**Starter scenario:** Independent review packet for the starter project brief.

This first instance is populated with neutral, explicit starter content. Recipient-specific facts not supplied to the package remain `UNKNOWN` and must be confirmed before they are treated as authority.

| Surface | Populated content |
|---|---|
| Artifact | The starter project brief in P03. |
| Reviewer rule | The reviewer is not the author agent; use a fresh session, second agent, human reviewer, or deterministic re-derivation. |
| Checklist | Scope is bounded; sources are named; approvals and rollback exist; unknowns are explicit. |
| Sample result | REVISE until recipient-specific sources and owner are confirmed. |
| Decision options | PASS, REVISE, or REFUSE. |
| Receipt | Record artifact identity, reviewer identity class, checks, result, and date. |

## Use now

1. Read the populated instance against its declared prerequisites.
2. Confirm which starter statements are true for the recipient.
3. Replace unsupported statements with `UNKNOWN`, then record the source or owner decision.
4. Run the row's completion or review check before depending on it.

## Adaptation notes

- Bind the packet to the exact candidate reviewed.
- Add domain checks without removing the independent-review rule.
- A revised candidate receives a new review receipt.

## Completion check

- [ ] Every recipient-specific statement has a source or owner decision.
- [ ] Unknowns remain visible.
- [ ] Any consequential next action is inside the authority boundary.
