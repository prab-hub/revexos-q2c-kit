# ASC 606 / IFRS 15 Revenue Recognition Primer

Reference detail backing the `collections-revrec` skill. This is a working primer for
structuring revenue recognition schedules, not a substitute for the user's accountant or
auditor on judgment calls - say so whenever a genuinely ambiguous case comes up.

## The five-step model

1. **Identify the contract** - a legally enforceable agreement with commercial substance
   (the signed order/SOW from `contract-handoff`).
2. **Identify performance obligations** - the distinct promises in the contract (e.g.,
   "SaaS access for 12 months" and "implementation services" may be one or two
   obligations depending on whether the implementation has standalone value).
3. **Determine the transaction price** - the total consideration expected, including any
   variable consideration (usage-based fees, expected refunds/credits).
4. **Allocate the transaction price** - split the price across performance obligations
   based on their standalone selling prices.
5. **Recognize revenue** - as (or when) each performance obligation is satisfied: at a
   point in time, or over time.

## Worked example 1 - Pure SaaS annual contract

Contract: $36,000/year SaaS subscription, paid annually in advance, no separate
implementation fee.

- Single performance obligation: access to the software over the 12-month term.
- Recognition: ratable, $3,000/month for 12 months.
- Billing vs. recognition: $36,000 is billed and collected in month 1, but only
  $3,000/month is recognized as revenue. The remaining balance sits on the balance sheet
  as **deferred revenue**, decreasing by $3,000 each month as it's earned.

| Month | Cash billed | Revenue recognized | Deferred revenue balance (end of month) |
|---|---|---|---|
| 1 | $36,000 | $3,000 | $33,000 |
| 2 | $0 | $3,000 | $30,000 |
| 3 | $0 | $3,000 | $27,000 |
| ... | ... | ... | ... |
| 12 | $0 | $3,000 | $0 |

## Worked example 2 - Hybrid implementation + subscription

Contract: $10,000 one-time implementation fee + $2,000/month subscription over 12
months, implementation has no standalone value to the customer separate from the
subscription (a common determination for SaaS onboarding work).

- Because the implementation has no standalone value, it is typically **not** recognized
  upfront. Instead, the $10,000 is added to the total transaction price ($10,000 +
  $24,000 = $34,000) and recognized ratably over the expected customer relationship
  period (often the contract term, or longer if renewal is highly likely).
- Over a 12-month term: $34,000 / 12 = $2,833.33/month recognized, even though the cash
  timing is $10,000 + first month's $2,000 = $12,000 billed upfront, then $2,000/month
  thereafter.
- If the implementation clearly has standalone value (e.g., the customer could have hired
  a third party to do it, and it's priced at fair market rate), it may instead be treated
  as a separate performance obligation recognized at completion (point-in-time). This is
  a judgment call - flag it for the user's accountant rather than assuming.

## Worked example 3 - Services engagement, percentage-of-completion

Contract: Fixed-fee $120,000 dev project, no defined milestones, estimated at 1,200
hours of effort.

- Single performance obligation, satisfied over time as the customer receives and
  controls the benefit of the work (typical for bespoke development where the customer
  couldn't easily redirect the work to another vendor).
- Recognition method: percentage-of-completion based on effort incurred.

```
recognized_to_date = (hours_incurred_to_date / total_estimated_hours) × total_contract_value
```

- If 300 hours have been incurred against the 1,200-hour estimate:
  `(300 / 1200) × $120,000 = $30,000` recognized to date.
- Re-forecast the total estimated hours periodically - if the estimate changes (e.g., now
  expected to take 1,500 hours), recompute recognized-to-date on the revised total
  prospectively; do not restate prior periods for a routine re-estimate.

## Worked example 4 - Milestone-based services

Contract: $90,000 project with three defined, customer-accepted milestones of $30,000
each.

- If each milestone represents a distinct performance obligation with standalone value,
  recognize $30,000 at each milestone's acceptance (point-in-time per milestone) rather
  than ratably across the whole project.
- Do not recognize on milestone *invoicing* - recognize on milestone *acceptance* per the
  contract's acceptance criteria; invoicing and recognition timing can differ.

## Deferred revenue vs. unbilled (accrued) revenue

- **Deferred revenue** (a liability): cash collected (or invoiced) ahead of the revenue
  being earned - common with annual prepay.
- **Unbilled/accrued revenue** (an asset): revenue earned ahead of when it's invoiced -
  common with percentage-of-completion services billed monthly in arrears while work
  happens continuously.

Track both directions; a contract can have deferred revenue for its subscription
component and unbilled revenue for a concurrent T&M component.

## Contract modifications

When a contract changes mid-term (upgrade, downgrade, scope change, extension):

1. Determine whether the modification adds **distinct** goods/services at their
   standalone selling price - if so, treat it as a separate contract (no change to
   existing recognition).
2. Otherwise, treat it as a modification of the existing contract - reallocate the
   remaining transaction price across the remaining performance obligations
   prospectively from the modification date.
3. Never retroactively restate revenue already recognized for a routine modification;
   only restate for the correction of an error.

## When to tell the user to loop in their accountant

- Any determination of whether a fee has "standalone value" (drives point-in-time vs.
  ratable treatment).
- Contract modifications that might qualify as a new contract vs. a modification.
- Variable consideration that's genuinely hard to estimate (e.g., usage-based revenue
  with high volatility) - ASC 606 requires constraining variable consideration estimates.
- Multi-year contracts with embedded price changes or renewal options that may need to be
  evaluated as material rights.
