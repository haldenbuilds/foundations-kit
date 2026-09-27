# C14 | Vendor and tool decision block (DRAFT)

**Row ID:** `C14`

**Built tier:** `generic template`

**Copy status:** `DRAFT - wording not yet approved by the kit's maker`

**Purpose:** Give the recipient's agent a source-backed answer path for vendor and tool questions without turning a mention or conditional route into availability.

**Use after:** C02, C03, C05, C06, C07, C11

## Notice to the recipient's agent

Use this block only when the recipient asks which vendor or tool to use, whether a named vendor is available, or what conditions govern a vendor relationship. Read the package manifest and C09 first, then load the authority, context, evidence, data/privacy/security, and decision rows named above.

If no current source supports a recommendation, say `UNKNOWN` and ask the smallest owner question. Do not infer availability from an installed binary, a connected account, a prior mention, a shortlist, a marketing page, a subprocessor list, or an expired evaluation.

## How to use

1. Define the job before naming a vendor.
2. Read the current vendor inventory and the cited source lines for the relevant row.
3. Separate operating use, shortlist status, rejection, and mention-only status.
4. Apply every condition in the availability boundary. If a required condition is unresolved, report the vendor as unavailable for the proposed act.
5. When sources disagree, show both readings and ask the named owner to resolve them. Do not choose silently.
6. Check evidence freshness for terms, pricing, regions, model IDs, commands, integrations, and account state at the time of the decision.
7. Compare the candidate against the incumbent and the `UNKNOWN` / do-nothing option using the same criteria.
8. Cite the package file and section used in the answer.

## Fields

| Field | What belongs here |
|---|---|
| Job | The recipient outcome the vendor or tool would perform. |
| Vendor and product | The vendor identity and the specific product or service. |
| Relationship | Direct vendor, subprocessor, connector, infrastructure provider, or external mention. |
| Status | `IN USE`, `SHORTLISTED`, `REJECTED, with the reason`, `MENTIONED ONLY`, or `UNKNOWN`. |
| Availability boundary | Required plan, account, region, contract, human approval, data class, cadence, API route, or other condition. |
| What it solves | The mechanism by which it performs the job. |
| What it does not solve | Residual work, dependencies, transfer path, migration, lock-in, or evidence burden. |
| Evidence | Package-relative source file and section or line. A row without evidence is invalid. |
| Freshness | Retrieval or verification date plus the event that forces an earlier recheck. |
| Conflict | Both source readings and the owner who may resolve them. |
| Decision owner | Who may approve use, spend, contract, install, migration, or live access. |
| Next safe action | The smallest reversible action inside the current authority boundary. |

## Safe defaults

- A conditional vendor is **unavailable until its conditions are satisfied and evidenced**.
- `IN USE` does not mean approved for a new purpose, new data class, new account, or automated cadence.
- `SHORTLISTED` does not authorize signup, trial, spend, contact, install, data transfer, migration, or live configuration.
- `MENTIONED ONLY` is not a recommendation.
- A vendor's statement about its own compliance, region, performance, or transfer mechanism remains a vendor claim until the required evidence is checked.
- Prefer a mechanism comparison over a brand list. Compare evidence burden, data path, exit cost, current fit, and what remains unsolved.
- Keep `UNKNOWN` visible when the source is absent, stale, conflicting, restricted, or outside the package.

## Reusable stub

| Job | Vendor and product | Relationship | Status | Availability boundary | Solves | Does not solve | Evidence | Freshness | Conflict / owner | Next safe action |
|---|---|---|---|---|---|---|---|---|---|---|
| [recipient job] | `UNKNOWN` | `UNKNOWN` | `UNKNOWN` | `UNAVAILABLE until source-backed conditions are recorded` | `UNKNOWN` | `UNKNOWN` | [package source or owner decision] | `UNKNOWN` | [both readings; owner] | Ask the smallest owner question |

## Neutral worked example

The example shows shape, not a recipient fact or recommendation.

| Job | Vendor and product | Relationship | Status | Availability boundary | Evidence | Next safe action |
|---|---|---|---|---|---|---|
| Send appointment reminders to existing customers | Tool A | Direct vendor | SHORTLISTED | Paid plan required; customer phone numbers are personal data, so the data check (C06) and owner approval come before any upload; reminders go out only after the owner approves their wording; recheck price and terms on the day of any signup | Example decision record, current line | Ask the owner whether Tool A is approved for a trial using test contacts only |

## Answer shape for the recipient's agent

Use this order:

1. `Recommendation:` name the source-backed option, or `UNKNOWN`.
2. `Why:` state the mechanism and comparison basis.
3. `Availability:` state `AVAILABLE`, `CONDITIONAL`, or `UNAVAILABLE`; list every unmet condition.
4. `Limits:` state what the option does not solve.
5. `Evidence:` cite the package file and section.
6. `Owner question:` ask only the smallest unresolved decision.

The word `AVAILABLE` may appear only when every recorded condition is satisfied by current evidence. If evidence is missing or conflicting, use `CONDITIONAL` or `UNAVAILABLE`.

## Adaptation notes

- Populate the full inventory first, then derive smaller recipient-specific views. Do not start with a cut-down list that hides a boundary or rejected alternative.
- Replace the neutral example only with recipient facts backed by package sources or an explicit owner decision.
- Add the block to the manifest and the C09 routing table only after the kit's maker assigns its row ID and approves a vendor layer for the kit.
- Keep the full evidence and conflict fields even if a later cut-down view presents fewer columns.
- After any approved change to this block, ask again every question you rely on the kit to answer, including the vendor and tool question. The vendor answer may move off `UNKNOWN` only when the installed package itself contains a citable answer.

## Completion check

- [ ] Every vendor row has a source file and section or line.
- [ ] Every condition is stated beside the vendor, not in a detached footnote.
- [ ] No restricted, conditional, stale, or conflicted vendor is presented as available.
- [ ] Direct vendors and subprocessors are distinguished.
- [ ] Source disagreements show both readings and name the resolution owner.
- [ ] The incumbent, candidate, and `UNKNOWN` / do-nothing option were compared on the same criteria.
- [ ] Terms, pricing, region, command, model, integration, and account-state claims have a freshness date or an explicit recheck requirement.
- [ ] The proposed act stays inside the recipient's authority boundary.

