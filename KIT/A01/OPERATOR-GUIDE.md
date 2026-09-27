# Owner guide

## Start here

Give your agent the A01 folder and say `Read AGENT-INSTRUCTIONS.md and help me start.` You need your business facts and a place to save them. File reading and writing make continuation possible. A conversation-only agent can give you text to save; it cannot claim to have saved or checked it. No command, account link, or paid tool is required for a draft audit.

## What the wizard asks

ONBOARDING.md contains ten questions about your buyer, goal, limits, sources, sales, offer, delivery, cash, current difficulty, and test rules. It asks one at a time. You may answer UNKNOWN. Keep figures tied to a period and source; do not borrow the kit's sample numbers.

## Approval points

WIZARD.md records five choices: G1 the brief; G2 which existing sources to use; G3 current versus parked scope; G4 research recommendations; G5 the exact plan. Decisions stay in DECISIONS.md with your words and the version you decided on. The agent prepares each choice and carries out work already covered by your recorded permission. A plan does not permit a purchase, message, deletion, install, or live change.

## Stage-by-stage operation

Follow WIZARD.md in order: confirm the brief, inspect permitted assets, choose current scope, decide on research, then review the audit and its guides. Refusing research is allowed. An unreadable source remains unavailable. An unsupported number remains UNKNOWN. The diagnostic runs before planning and the audit has the template's five sections.

## Outputs and ownership

Your named folder holds the runtime records listed in WIZARD.md, Receipts. SCALE-PLAN.md is the current audit and four-week plan. DECISIONS.md keeps your choices. NUMBERS.md keeps append-only actuals. TASKS.md and RISKS.md hold work and risks unless you map an existing board and register. You own these records. Keep their history and backups separate from the instruction folder; choose retention rules before removing anything.

## Resume and recover

Say `Resume from my plan` and name your folder. The agent reads the plan, decisions, latest numbers, and session note. Save a dated prior plan before replacement. If a write stopped halfway, preserve the partial draft and return to the last complete version. If files are lost, restore a verified backup to a new folder before deciding what to replace. Without a backup, re-enter missing facts as UNKNOWN until sourced; do not reconstruct approvals from memory.

## Troubleshooting

Missing number: identify the needed record and leave dependent calculations UNKNOWN. Conflicting records: show both and decide which is authoritative. No file access: save the supplied text yourself and confirm its location. Failed check: keep the actual failure reading and stop that completion claim. A Python structural check can return 0 for clean structure, 1 for violations, or 3 when it could not measure; none of these approves a business decision. Run it only with command permission: `python3 gate-check.py --root . --mode cut --self-test --result-dir PATH-IN-YOUR-OWNER-FOLDER`. Choose an actual writable result path first. Keep scratch and results outside the instruction folder.

## Maintenance

Use `Weekly review` with fresh records. Revisit definitions and thresholds when the offer, team, or measurement method changes. Keep the old plan and decision IDs so changes can be explained. Review PARK wake conditions each weekly read; your explicit choice moves an item into scope. If you change instructions, re-run structure checks and review the changed behavior before use.

## Ask for help

Say `Help: how do I resume?`, `Help me decide`, `Break this down`, or `Show parked work`. Help answers cite the shipped guide and section. An unsupported question returns UNKNOWN-IN-GUIDES with the missing topic and next owner decision.

## Question coverage map

| Question | Answer location |
|---|---|
| Purpose and prerequisites | This guide, Start here; README.md, What you get |
| Inputs and unknowns | ONBOARDING.md; audit template, Offer and money check |
| Stages and approvals | WIZARD.md, WB-1 through WB-5 and Operator approval boundary |
| Outputs and ownership | This guide, Outputs and ownership |
| Resume and recovery | This guide, Resume and recover; ONGOING.md, Resume from files |
| Failure and maintenance | This guide, Troubleshooting and Maintenance |
| Decisions and tasks | ONGOING.md, Decision helper and Task breakdown |
| Kit setup and adaptation | KIT-GUIDE.md, Setup by situation and Adapt to the owner's tools |
| Limits and unsupported help | This guide, Limits; AGENT-GUIDE.md, Any-question help contract |

## Limits

The advisor supports decisions and drafting. It cannot supply missing evidence, set your targets, promise growth, or act outside your permission. It does not monitor between sessions. It does not provide regulated professional advice. Bring a qualified person into consequential legal, tax, financial, or employment decisions. It has no private knowledge service or required kit dependency.
