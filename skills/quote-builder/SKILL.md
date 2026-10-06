---
name: quote-builder
description: "Build a structured, defensible B2B quote or proposal: classify the deal (service project, retainer, T&M, SaaS seat/usage/tiered, or hybrid), pick a packaging model, apply discount guardrails with an approval path, and lay out one-time vs recurring line items. Use when the user asks to build a quote, create a proposal, price a deal, quote a retainer, put together a SOW and quote, set up SaaS pricing tiers, design CPQ logic or discount approval thresholds, or asks what to charge."
---

# Quote & CPQ Builder

Help the user turn a deal (service engagement or SaaS subscription) into a structured,
defensible quote - the first step of quote-to-cash. Read `references/pricing-and-packaging.md`
before building a quote for the first time in a session; it holds the packaging models,
discount governance matrix, and line-item templates this skill assumes.

## Step 1: Classify the deal

Before pricing anything, establish:

1. **Deal type** - service engagement (project, retainer, T&M), SaaS subscription
   (seat-based, usage-based, tiered), or hybrid (platform fee + usage, or implementation
   fee + subscription).
2. **Customer context** - new logo vs. expansion/renewal, deal size, industry, any
   negotiated precedent (existing customer already on a plan or rate card).
3. **Term & billing cadence** - contract length, billing frequency (monthly, quarterly,
   annual prepay), auto-renewal expectations.
4. **Scope or plan definition** - for services: deliverables, hours, staffing level; for
   SaaS: which plan tier, seats, add-ons, usage drivers (API calls, GB, transactions).
5. **Currency and tax jurisdiction** - affects rounding, tax line items, and whether a
   tax connector (~~accounting) needs to be consulted.

Ask only for what's missing - do not re-ask for information already given. If the user
is vague about deal type, ask one clarifying question rather than guessing, since pricing
structure differs materially between a retainer and a subscription.

## Step 2: Choose a packaging model

Match the deal type to a packaging model from `references/pricing-and-packaging.md`:

- **Agency/service deals**: value-based project fee, time & materials (T&M) with a rate
  card, or a monthly retainer with a defined scope band (e.g., "up to 40 hours/month").
- **SaaS deals**: good-better-best tiering, per-seat, usage/metered, or a hybrid
  platform-fee-plus-usage model.
- **Hybrid**: an implementation/onboarding fee (one-time) bundled with a recurring
  subscription or retainer - flag this explicitly, since it affects revenue recognition
  later (see the `collections-revrec` skill) and needs separate line items.

State which model was chosen and why in one line, so the user can correct it before the
quote is built out.

## Step 3: Apply discount governance

Never apply a discount silently. Use the discount guardrail table in
`references/pricing-and-packaging.md`:

- Flag when a requested discount exceeds the standard threshold for the deal size and
  say explicitly that it would need manager/finance approval before sending.
- For multi-year or annual-prepay deals, apply the standard prepay discount ladder rather
  than an ad hoc number, and say which ladder step was used.
- Never stack multiple discount types without calling that out as unusual - it's a common
  source of margin leakage.

## Step 4: Build the quote line items

Structure the quote as explicit line items, not a single lump sum:

- One-time items (setup/implementation fees, one-off project deliverables) separated from
  recurring items (subscription fees, retainer fees).
- Each recurring line item should show unit price, quantity/basis (seats, hours, %), and
  billing frequency.
- A discount line item (not baked into the unit price) so the discount is auditable.
- Tax as a separate line, marked as estimated unless a tax connector (~~accounting)
  confirms the rate.
- Payment terms (e.g., Net 30, due on receipt for setup fees) and quote validity period
  (typically 30 days) stated explicitly at the bottom.

Use the docx, xlsx, or pptx skill (whichever fits the deliverable the user wants - a
proposal document, a pricing sheet, or a sales deck) to produce the actual output file.
This skill supplies the pricing logic and structure; it does not replace the document
formatting skill.

## Step 5: Hand off

Once a quote is accepted:

- Note that the quote's line items, term, and billing cadence are the direct inputs to
  the `contract-handoff` skill - say this explicitly so the user knows the next step.
- If a CRM connector (~~crm) is available, note that the deal stage and quote should be
  synced there rather than left only in the document.
- If an e-signature connector (~~e-signature) is available, note the quote can be routed
  for signature directly rather than emailed as a static file.

## Common mistakes to avoid

- Treating a SaaS quote and a service quote with the same template - they have different
  risk points (usage forecasting vs. scope creep).
- Quoting a discount without naming the approval path.
- Omitting the one-time/recurring split, which causes downstream billing and revenue
  recognition errors.
- Leaving the quote's expiration/validity date implicit.

## Learn more

Free guides and tools on revexos.com that go deeper on this stage:

- [Quote automation guide](https://revexos.com/quote-automation?utm_source=q2c-kit)
- [Free quote generator](https://revexos.com/quote-generator?utm_source=q2c-kit)
- [Proposal generator](https://revexos.com/proposal-generator?utm_source=q2c-kit)
- [Rate card calculator](https://revexos.com/rate-card-calculator?utm_source=q2c-kit)
