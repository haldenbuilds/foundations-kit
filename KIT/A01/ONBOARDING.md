# Onboarding

Schema version: 1. Ask these ten questions one at a time. Reuse a sourced answer the owner already supplied; show it for correction. The owner may say `UNKNOWN`. Do not turn this into a larger questionnaire. A missing answer can be revisited under the same question number. Approval choices in `WIZARD.md` follow the interview and remain separate from fact questions.

Write the answers verbatim in `SCALE-INTAKE.md` in the owner's named folder. Each answer has its question ID, source, date, period, and unit where relevant. Keep unmapped details in an extra-notes field. If no folder or write permission exists, give the owner the text to save. Derive `SCALE-BRIEF.md` from the answers, with intended user, desired result, constraints, unknowns, and evidence of success. Map Q1 to intended_user and general_idea, Q2 to defined_result and success_evidence, Q3 to operator_constraints; preserve unknowns from all answers in known_unknowns. Q1 through Q10 belong once in domain_answers if using `interview.schema.json`.

| ID | Ask | Used for | Saved field |
|---|---|---|---|
| Q1 | What does your business sell, and who buys it? | Define the business and buyer without assuming fit. | business_and_buyer |
| Q2 | What would you like to be different four weeks from now? | Set the owner's aim and observable evidence of progress. | desired_change |
| Q3 | What limits must this plan respect? | Capture time, budget, owner, permitted folder, sensitive data, and actions needing approval. | boundaries |
| Q4 | Which records may we use to understand the business? | Declare roots, tools, document types, and gaps before a bounded sweep. | permitted_sources |
| Q5 | What do your records show about the steps from first contact to a paid customer? | Find reach, buyer fit, conversion, sample size, and running tests over a named period. | sales_path |
| Q6 | What do customers receive, pay, and cost you to serve? | Test the offer, gross profit, repeat buying, acquisition cost, and payment timing from records. | offer_and_costs |
| Q7 | What could your team deliver if more orders arrived now? | Compare committed work, available hours, repeat tasks, quality evidence, and roles over that period. | delivery |
| Q8 | What cash is available and what money is due in or out? | Capture dated cash, weekly history, commitments, and missing payment evidence. | cash |
| Q9 | Where does work get stuck today? | Compare the owner's account with evidence and choose a tentative constraint. | owner_observation |
| Q10 | What would make you keep, change, or stop a test? | Set the owner's thresholds, minimum counts, measurement windows, and review date with reasons. | decision_rules |

Show the resulting brief and exact saved version for the owner's ratify or revise decision. Record their words, actor, subject version or digest, and time in `DECISIONS.md`. Keep the plan as a draft until this decision is recorded. Missing numbers are never filled from a sample business.
