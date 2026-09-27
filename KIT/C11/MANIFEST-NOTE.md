# C11 | Kit manifest and agent notice

**Row ID:** `C11`

**Built tier:** `fully kitted`

**Purpose:** Kit manifest and agent notice

**Use after:** NONE

## Populated first instance

The package manifest is generated at `../../KIT-MANIFEST.md`. It opens with a start block for the person who received the kit (open your agent, give it this folder, paste one line), the capability line (what the agent must be able to do), and the use-and-sharing block. Its notice then tells the recipient's agent to read the manifest first, then load C09. The manifest inventories itself and every file under `KIT/` with row, tier, purpose, and load condition.

## Drift rule

Do not edit the manifest by hand. Re-run the package generator after an authorized package-file change, then run the manifest existence and completeness checks.

## Adaptation notes

- Keep the start block, the capability line, and the use-and-sharing block first, the agent notice next, and the inventory last.
- Keep paths relative to the package root.
- Add no file without a row, tier, purpose, and load condition.

## Completion check

- [ ] Every listed path exists.
- [ ] Every package file is listed.
- [ ] The notice routes the agent to C09.
- [ ] The start block names the one line to paste and what the agent must be able to do.
