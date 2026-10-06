# Pricing & Packaging Reference

Detailed frameworks backing the `quote-builder` skill. Load this when actually
constructing a quote, not just discussing quoting in the abstract.

## 1. Packaging models by deal type

### B2B digital service agencies (accounting, marketing, dev/software)

| Model | How it works | Best for | Watch-outs |
|---|---|---|---|
| Fixed project fee | Single price for a defined scope and deliverable set | Well-scoped, bounded projects (a website build, a tax filing engagement, a migration) | Scope creep erodes margin; needs a change-order process baked into the contract |
| Time & materials (T&M) | Hourly/day rate card by role, billed against actuals | Open-ended or discovery-heavy work | Customer risk-aversion to open-ended cost; needs a not-to-exceed cap in many deals |
| Monthly retainer | Flat fee for a defined capacity band (e.g., "up to 40 hours" or "2 campaigns/month") | Ongoing services - bookkeeping, SEO, dev support | Ambiguous "up to" bands cause disputes; define overage handling explicitly |
| Value-based / outcome fee | Price tied to a business outcome (% of ad spend managed, % of revenue recovered) | Marketing media management, revenue-recovery/collections services | Requires trustworthy outcome measurement; align incentives carefully |

### B2B SaaS

| Model | How it works | Best for | Watch-outs |
|---|---|---|---|
| Good-Better-Best tiers | 3 fixed feature/limit bundles at increasing price points | Broad market, self-serve-to-mid-market | Feature gating must map to real willingness-to-pay, not arbitrary limits |
| Per-seat | Price scales with number of users | Collaboration tools, tools with clear per-user value | Seat-count gaming (shared logins); doesn't capture usage-driven value |
| Usage/metered | Price scales with a usage driver (API calls, GB processed, transactions) | Infrastructure, data, and API products | Needs reliable metering and clear overage/true-up rules; unpredictable customer bills |
| Hybrid (platform + usage) | Flat platform/access fee plus a usage component | Products with both a fixed cost floor and variable consumption | Two things to explain in the quote; keep the platform fee and usage line separate |

### Hybrid service + SaaS

Implementation/onboarding fee (one-time) plus ongoing subscription or retainer. Always
split into a separate one-time line item - bundling it into the recurring fee causes
revenue recognition problems (the one-time fee is typically recognized differently than
the ratable subscription revenue).

## 2. Discount governance matrix

Use as a default; the user's own approval matrix always overrides this if stated.

| Discount off list price | Approval needed | Notes |
|---|---|---|
| 0–10% | Rep can apply directly | Standard "close it" range |
| 11–20% | Manager/team-lead sign-off | Should be justified by deal size, competitive situation, or multi-year term |
| 21–35% | Finance/RevOps sign-off | Usually reserved for annual prepay or strategic logos |
| >35% | Leadership approval | Flag as exceptional; ask whether there's a non-price lever instead (extended term, reduced scope) |

**Prepay/multi-year discount ladder** (typical default, adjust to the user's own numbers
if given):

- Monthly billing: list price, no discount
- Annual prepay: 10–15% off monthly-equivalent price
- 2-year prepay: 15–20% off
- 3-year prepay: 20–25% off

Never combine the prepay ladder with a separately negotiated discretionary discount
without flagging the combined effective discount - stacking is the single most common
cause of unintended margin erosion.

## 3. Line-item templates

### Service quote template

```
LINE ITEMS
1. [One-time] Implementation / onboarding fee - $X - due on signature
2. [Recurring] Monthly retainer (up to N hours / M deliverables) - $Y/month - billed monthly in advance
3. [Recurring] Additional hours beyond retainer band - $Z/hour - billed monthly in arrears
DISCOUNT: -$D (reason: ___, approved by: ___)
TAX: estimated, confirm via accounting system
TOTAL DUE AT SIGNING: [one-time + first period]
PAYMENT TERMS: Net 30 / due on receipt
QUOTE VALID UNTIL: [date, default 30 days]
```

### SaaS quote template

```
LINE ITEMS
1. [Recurring] [Plan name] subscription - $X/seat/month × N seats - billed [monthly/annual]
2. [Recurring] Usage overage beyond included [driver] - $Y per unit - billed monthly in arrears
3. [One-time] Onboarding/implementation fee (if applicable) - $Z - due on signature
DISCOUNT: -$D (reason: ___, approved by: ___)
TAX: estimated, confirm via accounting system
TOTAL DUE AT SIGNING: [one-time + first period, or $0 if monthly-only]
BILLING START DATE: [date, or "on provisioning"]
AUTO-RENEWAL: [yes/no, notice period if yes]
QUOTE VALID UNTIL: [date, default 30 days]
```

## 4. Signals that a deal needs escalation before quoting

- Non-standard payment terms requested (e.g., Net 90, payment on delivery of a future
  milestone).
- Multi-entity or multi-currency billing.
- Customer wants unusual contract exit terms (early termination without penalty).
- Deal involves a reseller, partner margin, or revenue share - pricing math changes.
