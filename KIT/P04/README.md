# P04 | Prioritized backlog and next-action board

**Row ID:** `P04`

**Built tier:** `fully kitted`

**Purpose:** Prioritized backlog and next-action board

**Use after:** P03,F05

## Populated first instance

**Starter scenario:** Starter next-action board for the source-linked update project.

This first instance is populated with neutral, explicit starter content. Recipient-specific facts not supplied to the package remain `UNKNOWN` and must be confirmed before they are treated as authority.

| Surface | Populated content |
|---|---|
| NOW-1 | Confirm source authority | Priority: first | Dependency: approved project brief | Owner: project owner |
| NOW-2 | Inspect current status note | Priority: second | Dependency: source authority | Owner: agent |
| NEXT-1 | Draft update | Dependency: NOW-1 and NOW-2 | Owner: agent |
| NEXT-2 | Independent evidence review | Dependency: draft | Owner: reviewer |
| PARKED-1 | Automated publishing | Wake: owner grants live-action scope | Owner: project owner |
| BLOCKED | External send | Reason: exact draft not approved | Owner: project owner |

## Use now

1. Read the populated instance against its declared prerequisites.
2. Confirm which starter statements are true for the recipient.
3. Replace unsupported statements with `UNKNOWN`, then record the source or owner decision.
4. Run the row's completion or review check before depending on it.

## Adaptation notes

- Replace cards from the approved project brief.
- Keep blocked reasons visible.
- Limit NOW to work that can begin with current dependencies.

## Completion check

- [ ] Every recipient-specific statement has a source or owner decision.
- [ ] Unknowns remain visible.
- [ ] Any consequential next action is inside the authority boundary.
