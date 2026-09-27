# Package manifest | Recipient agent: read this first

**Row ID:** `C11`

**Built tier:** `fully kitted`

**Copy status:** `PANEL-OWED`

## Start here

This folder is a kit for an AI agent to work from. If no agent has read it yet:

1. Open the AI agent you use.
2. Give it this folder, the one that holds this file and the `KIT` folder.
3. Paste this one line:

   `Read KIT-MANIFEST.md in this folder and follow its notice to the recipient's agent.`

**What your agent must be able to do:** read files in this folder, write files in this folder, and run a command and show you what it printed and its exit code. An agent that can only read can still answer questions from the kit, but it cannot run the kit's checks (`KIT/B07`) or its backup test (`KIT/B12`), and it must report those as UNAVAILABLE, never as passed.

## Use and sharing

Use this kit freely in your business, including with your team. You may pass it on to anyone, as long as you pass on the whole kit, unchanged, with this section and its credit line in place.

**Credit:** Foundations Kit by HaldenBuilds. Strategy before automation. Get the latest version free: @haldenbuilds on Instagram

## Notice to the recipient's agent

Read this manifest before any other package file. Then read `KIT/C09/AGENT-INSTRUCTIONS.md`.
C09 opens with three paths: Start the check (recommended), Just the kit, or Just the check. The advisor is The Operator Check. For the check path, load `KIT/A01/AGENT-INSTRUCTIONS.md`. For Just the check, the entire `KIT/A01/` folder can be copied out alone; its README carries its own use and sharing terms. Keep owner records separate.

You can answer the recipient's questions from this kit by locating the relevant row below, reading its prerequisites, and citing the file and section used. If the kit does not answer, say `UNKNOWN` and ask the smallest owner question.

Before your first task, tell the recipient which of these you can do in this folder: read files, write files, run a command. Running the B07 package check shows whether you can read and run a command; the first file you draft shows whether you can write. If you cannot run a command, every check in `KIT/B07` and `KIT/B12` is UNAVAILABLE to you: say so, and never report one as passed.

This inventory covers the recipient package: this manifest and every file under `KIT/`. Build evidence outside that boundary is not recipient-package content.

## Generated inventory

| File | Row ID | Tier | Purpose | Load condition |
|---|---|---|---|---|
| `KIT-MANIFEST.md` | C11 | fully kitted | Generated package inventory and recipient-agent entry notice. | First |
| `KIT/A01/AGENT-GUIDE.md` | A01 | fully kitted | Supporting surface for The Operator Check: agent guide. | When C09 routes to A01 |
| `KIT/A01/AGENT-INSTRUCTIONS.md` | A01 | fully kitted | Supporting surface for The Operator Check: agent instructions. | When C09 routes to A01 |
| `KIT/A01/KIT-GUIDE.md` | A01 | fully kitted | Supporting surface for The Operator Check: kit guide. | When C09 routes to A01 |
| `KIT/A01/ONBOARDING.md` | A01 | fully kitted | Supporting surface for The Operator Check: onboarding. | When C09 routes to A01 |
| `KIT/A01/ONGOING.md` | A01 | fully kitted | Supporting surface for The Operator Check: ongoing. | When C09 routes to A01 |
| `KIT/A01/OPERATOR-GUIDE.md` | A01 | fully kitted | Supporting surface for The Operator Check: operator guide. | When C09 routes to A01 |
| `KIT/A01/README.md` | A01 | fully kitted | Primary artifact for The Operator Check. | When C09 routes to A01 |
| `KIT/A01/SCALE-AUDIT-TEMPLATE.md` | A01 | fully kitted | Supporting surface for The Operator Check: scale audit template. | When C09 routes to A01 |
| `KIT/A01/WIZARD.md` | A01 | fully kitted | Supporting surface for The Operator Check: wizard. | When C09 routes to A01 |
| `KIT/A01/gate-check.py` | A01 | fully kitted | Supporting surface for The Operator Check: gate check. | When C09 routes to A01 |
| `KIT/A01/interview.schema.json` | A01 | fully kitted | Supporting surface for The Operator Check: interview.schema. | When C09 routes to A01 |
| `KIT/A01/wizard.manifest.json` | A01 | fully kitted | Supporting surface for The Operator Check: wizard.manifest. | When C09 routes to A01 |
| `KIT/B01/README.md` | B01 | fully kitted | Primary artifact for Command deck. | When C09 routes to B01 |
| `KIT/B02/README.md` | B02 | fully kitted | Primary artifact for Internal review and audit loop. | When C09 routes to B02 |
| `KIT/B03/README.md` | B03 | generic template | Primary artifact for Build and capability inventory. | When C09 routes to B03 |
| `KIT/B04/README.md` | B04 | fully kitted | Primary artifact for Intake and interview wizard. | When C09 routes to B04 |
| `KIT/B05/README.md` | B05 | fully kitted | Primary artifact for Dependency planner and recommended path. | When C09 routes to B05 |
| `KIT/B06/README.md` | B06 | generic template | Primary artifact for Template and component library. | When C09 routes to B06 |
| `KIT/B07/README.md` | B07 | fully kitted | Primary artifact for Verification and self-test gate. | When C09 routes to B07 |
| `KIT/B07/check-kit-mac-linux.sh` | B07 | fully kitted | Supporting surface for Verification and self-test gate: check kit mac linux. | When C09 routes to B07 |
| `KIT/B07/check-kit-windows.ps1` | B07 | fully kitted | Supporting surface for Verification and self-test gate: check kit windows. | When C09 routes to B07 |
| `KIT/B08/README.md` | B08 | fully kitted | Primary artifact for Change, install, and rollback record. | When C09 routes to B08 |
| `KIT/B09/README.md` | B09 | fully kitted | Primary artifact for Operator runbook and help guide. | When C09 routes to B09 |
| `KIT/B10/README.md` | B10 | generic template | Primary artifact for Health, freshness, and drift check. | When C09 routes to B10 |
| `KIT/B11/README.md` | B11 | generic template | Primary artifact for Rule-to-carrier map. | When C09 routes to B11 |
| `KIT/B12/README.md` | B12 | fully kitted | Primary artifact for Backup and restore routine. | When C09 routes to B12 |
| `KIT/B12/backup-restore-mac-linux.sh` | B12 | fully kitted | Supporting surface for Backup and restore routine: backup restore mac linux. | When C09 routes to B12 |
| `KIT/B12/backup-restore-windows.ps1` | B12 | fully kitted | Supporting surface for Backup and restore routine: backup restore windows. | When C09 routes to B12 |
| `KIT/C01/README.md` | C01 | fully kitted | Primary artifact for Outcome and success brief. | When C09 routes to C01 |
| `KIT/C02/README.md` | C02 | fully kitted | Primary artifact for Working agreement and authority boundary. | When C09 routes to C02 |
| `KIT/C03/README.md` | C03 | generic template | Primary artifact for Context and source-of-truth map. | When C09 routes to C03 |
| `KIT/C04/README.md` | C04 | generic template | Primary artifact for Prompt and task-brief card. | When C09 routes to C04 |
| `KIT/C05/README.md` | C05 | fully kitted | Primary artifact for Evidence and completion contract. | When C09 routes to C05 |
| `KIT/C06/README.md` | C06 | generic template | Primary artifact for Data, privacy, and security check. | When C09 routes to C06 |
| `KIT/C07/README.md` | C07 | generic template | Primary artifact for Decision and assumption log. | When C09 routes to C07 |
| `KIT/C08/README.md` | C08 | generic template | Primary artifact for Session handoff and continuity note. | When C09 routes to C08 |
| `KIT/C09/AGENT-INSTRUCTIONS.md` | C09 | fully kitted | Primary artifact for Agent instruction file. | Second |
| `KIT/C10/FACT-NOTE-TEMPLATE.md` | C10 | generic template | Supporting surface for Memory architecture: fact note template. | When C09 routes to C10 |
| `KIT/C10/MEMORY-ARCHITECTURE.md` | C10 | generic template | Primary artifact for Memory architecture. | When C09 routes to C10 |
| `KIT/C10/MEMORY-INDEX.md` | C10 | generic template | Supporting surface for Memory architecture: memory index. | When C09 routes to C10 |
| `KIT/C11/MANIFEST-NOTE.md` | C11 | fully kitted | Primary artifact for Kit manifest and agent notice. | When C09 routes to C11 |
| `KIT/C12/README.md` | C12 | generic template | Primary artifact for Usage budget and pacing plan. | When C09 routes to C12 |
| `KIT/C13/README.md` | C13 | generic template | Primary artifact for Correction and disagreement protocol. | When C09 routes to C13 |
| `KIT/C14/README.md` | C14 | generic template | Primary artifact for Vendor and tool decision block. | When C09 routes to C14 |
| `KIT/F01/README.md` | F01 | generic template | Primary artifact for Root folder map. | When C09 routes to F01 |
| `KIT/F02/README.md` | F02 | generic template | Primary artifact for Project map and context router. | When C09 routes to F02 |
| `KIT/F03/README.md` | F03 | fully kitted | Primary artifact for Work-stage folders. | When C09 routes to F03 |
| `KIT/F03/stages/archive/README.md` | F03 | fully kitted | Supporting surface for Work-stage folders: readme. | When C09 routes to F03 |
| `KIT/F03/stages/delivered/README.md` | F03 | fully kitted | Supporting surface for Work-stage folders: readme. | When C09 routes to F03 |
| `KIT/F03/stages/intake/README.md` | F03 | fully kitted | Supporting surface for Work-stage folders: readme. | When C09 routes to F03 |
| `KIT/F03/stages/review/README.md` | F03 | fully kitted | Supporting surface for Work-stage folders: readme. | When C09 routes to F03 |
| `KIT/F03/stages/work/README.md` | F03 | fully kitted | Supporting surface for Work-stage folders: readme. | When C09 routes to F03 |
| `KIT/F04/README.md` | F04 | generic template | Primary artifact for Source and reference library with provenance. | When C09 routes to F04 |
| `KIT/F05/LAST-SESSION.md` | F05 | fully kitted | Supporting surface for Status and memory surfaces: last session. | When C09 routes to F05 |
| `KIT/F05/NEXT.md` | F05 | fully kitted | Supporting surface for Status and memory surfaces: next. | When C09 routes to F05 |
| `KIT/F05/NOW.md` | F05 | fully kitted | Supporting surface for Status and memory surfaces: now. | When C09 routes to F05 |
| `KIT/F05/PARKED.md` | F05 | fully kitted | Supporting surface for Status and memory surfaces: parked. | When C09 routes to F05 |
| `KIT/F05/README.md` | F05 | fully kitted | Primary artifact for Status and memory surfaces. | When C09 routes to F05 |
| `KIT/F06/README.md` | F06 | generic template | Primary artifact for Naming, version, and archive rules. | When C09 routes to F06 |
| `KIT/F07/README.md` | F07 | fully kitted | Primary artifact for Reusable project scaffold. | When C09 routes to F07 |
| `KIT/F07/starter/PROJECT-BRIEF.md` | F07 | fully kitted | Supporting surface for Reusable project scaffold: project brief. | When C09 routes to F07 |
| `KIT/F07/starter/README.md` | F07 | fully kitted | Supporting surface for Reusable project scaffold: readme. | When C09 routes to F07 |
| `KIT/F07/starter/STATUS.md` | F07 | fully kitted | Supporting surface for Reusable project scaffold: status. | When C09 routes to F07 |
| `KIT/F07/starter/review/README.md` | F07 | fully kitted | Supporting surface for Reusable project scaffold: readme. | When C09 routes to F07 |
| `KIT/F07/starter/sources/README.md` | F07 | fully kitted | Supporting surface for Reusable project scaffold: readme. | When C09 routes to F07 |
| `KIT/P01/README.md` | P01 | fully kitted | Primary artifact for Business one-pager. | When C09 routes to P01 |
| `KIT/P02/README.md` | P02 | fully kitted | Primary artifact for Goal and outcome scoreboard. | When C09 routes to P02 |
| `KIT/P03/README.md` | P03 | fully kitted | Primary artifact for Project brief and scope. | When C09 routes to P03 |
| `KIT/P04/README.md` | P04 | fully kitted | Primary artifact for Prioritized backlog and next-action board. | When C09 routes to P04 |
| `KIT/P05/README.md` | P05 | generic template | Primary artifact for Decision, risk, and issue register. | When C09 routes to P05 |
| `KIT/P06/README.md` | P06 | generic template | Primary artifact for Cadence and status review. | When C09 routes to P06 |
| `KIT/P07/README.md` | P07 | generic template | Primary artifact for SOP and playbook capture. | When C09 routes to P07 |
| `KIT/P08/README.md` | P08 | fully kitted | Primary artifact for Roles, approvals, and escalation map. | When C09 routes to P08 |
| `KIT/P09/README.md` | P09 | fully kitted | Primary artifact for Offer and best-customer sheet. | When C09 routes to P09 |
| `KIT/P10/README.md` | P10 | fully kitted | Primary artifact for Pricing and profit per customer sheet. | When C09 routes to P10 |
| `KIT/P11/README.md` | P11 | fully kitted | Primary artifact for Leads and sales conversation board. | When C09 routes to P11 |
| `KIT/P12/README.md` | P12 | fully kitted | Primary artifact for Weekly numbers and cash sheet. | When C09 routes to P12 |
| `KIT/P13/README.md` | P13 | fully kitted | Primary artifact for Bottleneck finder: sales, time, and money. | When C09 routes to P13 |
| `KIT/P14/README.md` | P14 | generic template | Primary artifact for Delegation card. | When C09 routes to P14 |

Generated package file count: **80**.
