# Find the right kit part

Every row below is optional. If you have the Foundations Kit, open its manifest, then the named row and its prerequisites. If you only have this A01 folder, use the fallback in the final column or the matching A01 guide. A missing kit part never blocks the advisor's own interview, audit, or continuing plan.

| Row | What it is for and when to recommend it | Without the kit |
|---|---|---|
| A01 | The Operator Check: begin a business diagnosis or resume a plan. | This folder is complete on its own. |
| B01 | Command deck: see current work and blockers together. | Read SCALE-PLAN.md and SESSION.md. |
| B02 | Review loop: have a separate reader check a candidate. | Ask the owner or another reviewer to check evidence. |
| B03 | Capability inventory: find tools and workflows already available. | List them in ASSETS.md. |
| B04 | Interview wizard: specify a new project before building. | Use ONBOARDING.md and WIZARD.md. |
| B05 | Dependency planner: sequence selected kit parts. | Follow this guide's setup paths. |
| B06 | Component library: retain a reviewed reusable part. | Link the proven example in ASSETS.md. |
| B07 | Package verification: check a full kit's manifest and planted breach. | A01's gate-check.py checks its structural carriers; neither check judges a strategy. |
| B08 | Change and rollback record: prepare a file or system change. | Record target, prior version, checks, rollback, and exact approval in DECISIONS.md. |
| B09 | Operator runbook: find kit operation and recovery. | Read OPERATOR-GUIDE.md. |
| B10 | Freshness check: inspect stale records or broken routes. | Re-read source dates before a recommendation. |
| B11 | Rule map: find where a requirement is enforced. | Link each decision rule to its plan check. |
| B12 | Backup and restore: test recovery before a change. | Ask the owner to make and verify a separate backup; do not claim an untested backup works. |
| C01 | Outcome brief: define the result and evidence of success. | Write SCALE-BRIEF.md. |
| C02 | Authority boundary: decide where drafting and approval stop. | Use AGENT-INSTRUCTIONS.md, Authority. |
| C03 | Source map: resolve authority and freshness. | Write ASSETS.md with source roles and conflicts. |
| C04 | Task brief: define one bounded job. | Use ONGOING.md, Task breakdown. |
| C05 | Evidence contract: support a completion claim. | Record the check and result beside its done-check. |
| C06 | Data check: handle sensitive or personal records. | Use aggregate counts; ask the owner before storing sensitive data. |
| C07 | Decision log: preserve choices and assumptions. | Append to DECISIONS.md. |
| C08 | Session handoff: stop and resume without guessing. | Write SESSION.md. |
| C09 | Agent instructions: route kit work and preserve duties. | Start with AGENT-INSTRUCTIONS.md. |
| C10 | Memory files: recall sourced facts without duplicating them. | Point from SCALE-PLAN.md to the current source. |
| C11 | Manifest: locate every package file and entry notice. | Use README.md's file map. |
| C12 | Session budget: stop before context or time runs out. | Save SESSION.md and the current plan first. |
| C13 | Correction protocol: recheck a disputed claim. | Append the correction and affected outputs to DECISIONS.md. |
| C14 | Tool decision: compare fit, evidence, and access conditions. | Compare against current tools; unavailable facts remain UNKNOWN. |
| F01 | Root folder map: locate the owner's current folders. | Record permitted roots in ASSETS.md. |
| F02 | Project router: load only the current project's sources. | Put stable pointers in SCALE-PLAN.md. |
| F03 | Work stages: distinguish intake, draft, review, delivered, and archive. | Label file state and preserve prior versions. |
| F04 | Source library: retain origin, rights, and freshness. | Use ASSETS.md. |
| F05 | Status files: preserve now, next, parked, and last session. | Use SCALE-PLAN.md, SCOPE.md, and SESSION.md. |
| F06 | Version rules: make a changed decision traceable. | Save a dated prior version and record supersession. |
| F07 | Project starter: give one selected project a folder. | Create a brief, sources, draft, and review record in the owner's folder. |
| P01 | Business one-pager: confirm buyer, problem, and delivery. | Use Q1 and SCALE-BRIEF.md. |
| P02 | Scoreboard: compare observed progress with owner targets. | Use audit section 5. |
| P03 | Project brief: bound the single chosen move. | Use the approved move in SCALE-PLAN.md. |
| P04 | Task board: order next actions and dependencies. | Write TASKS.md using ONGOING.md. |
| P05 | Risk register: track decisions, risks, and dated obligations. | Write RISKS.md linked to DECISIONS.md. |
| P06 | Review cadence: revisit blocked work and numbers. | Use ONGOING.md, Weekly review and rolling plan. |
| P07 | Procedure: write steps after observing repeat work. | Save a task's inputs, steps, checks, and exceptions beside the plan. |
| P08 | Roles: separate proposal, review, and approval. | Record owners and escalation in SCALE-BRIEF.md. |
| P09 | Offer sheet: clarify buyer, deliverables, proof, and friction. | Use audit section 4 and the offer choice rule. |
| P10 | Pricing sheet: calculate profit, acquisition cost, and payback. | Use audit section 4, including its zero rule. |
| P11 | Sales board: measure steps and select one change. | Use the sales step rule in AGENT-INSTRUCTIONS.md. |
| P12 | Weekly numbers: record cash and pipeline actuals once. | Append observations to NUMBERS.md using audit section 4. |
| P13 | Bottleneck finder: select the sales, time, or money limit. | Use Diagnose before planning and Keep the kit's choice rules. |
| P14 | Delegation card: hand off a task with a readiness check. | Write steps, owner, boundaries, owner-set readiness evidence, and a review date before handoff. |

## Setup by situation

Business is unclear: use the interview and brief first, then gather offer and buyer evidence. If you have the Foundations Kit, use C01, C02, C03, P01, then P09 with their prerequisites.

Orders are inconsistent: check cash and delivery first, then the offer and sales path. If you have the Foundations Kit, start with P13 and follow its sales route through P09 and P11. Carry its result to P12 and the plan.

Orders exceed delivery: measure the hours, owner tasks, and quality problem before proposing people or automation. If you have the Foundations Kit, follow P13's time audit and choice rule, then P03 and the selected route to P07 or P14.

Cash blocks work: put obligations and collections on dates before new commitments. If you have the Foundations Kit, follow P13's money route through P12, P10, the cost audit, and its choice rule. Keep dated risks in P05.

Already have a working system: map existing fields and source locations first. Keep that system unless a specific gap prevents the next move. If you have the Foundations Kit, C03 and F01 map the sources, then load only selected parts through B05.

## Adapt to the owner's tools

For a spreadsheet, map each measure to a column, unit, period, source, and owner. For a board, map task ID, action, owner, dependency, date, done-check, and state. For a notes tool, map plan, decisions, sources, and parked work to stable pages. Put the mapping in ASSETS.md and link it from SCALE-PLAN.md. Keep one authoritative place for each value. Copy a template to a new owner document before filling it; leave shipped instructions intact. Preserve history and unknowns when translating fields. Do not infer an integration from a tool name. The owner approves any import, connector, live edit, or send. If access is unavailable, use an owner-supplied export and say when it was captured.
