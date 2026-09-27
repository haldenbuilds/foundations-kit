# B05 | Dependency planner and recommended path

**Row ID:** `B05`

**Built tier:** `fully kitted`

**Purpose:** Dependency planner and recommended path

**Use after:** B03,P03,F07

## Populated first instance

**Starter scenario:** Working dependency planner seeded with this package's forty-eight rows.

This first instance is populated with neutral, explicit starter content. Recipient-specific facts not supplied to the package remain `UNKNOWN` and must be confirmed before they are treated as authority.

| Surface | Populated content |
|---|---|
| Graph | Forty-eight declared rows include the optional standalone advisor and the kit's required-before edges. |
| Roots | A01 begins the advisor route. C01 and C11 begin the kit setup route. |
| Planning rule | Select the desired row, include all ancestors, reject cycles, then present the rows level by level. A row's level is one more than the highest level among the rows it depends on, so lower levels come first. |
| Starter path | C11, C01, C02, C03, C09 gives the recipient agent a manifest, outcome, authority boundary, source map, and load path. |
| First build | The starter path is the first build: a confirmed C01 outcome, C02 authority boundary, and C03 source map. The F07 project starter is level 6 and comes later; the NOW line inside it belongs to a copied project, not to this kit. |
| Next slice | After the starter path, choose one to three rows from the earliest available level. |
| Business path | Business work starts at P13's start question. It names the limit and the next sheet: sales goes to P09 then P11, time goes to P13's time audit then its Pick one row, money goes to P12 then P10 then P13's cost audit and its Pick one row. |
| Failure behavior | A cycle, missing dependency, or isolated undeclared row blocks a recommended path. |

## Use now

1. Read the populated instance against its declared prerequisites.
2. Confirm which starter statements are true for the recipient.
3. Replace unsupported statements with `UNKNOWN`, then record the source or owner decision.
4. Run the row's completion or review check before depending on it.

## Adaptation notes

- Add recipient-specific components only with declared dependencies.
- Recompute levels after each graph change.
- Present a small next slice rather than loading the whole graph into one session.

## Completion check

- [ ] Every recipient-specific statement has a source or owner decision.
- [ ] Unknowns remain visible.
- [ ] Any consequential next action is inside the authority boundary.
