---
name: billing-platform-selector
description: "Recommend a billing system for a B2B or SaaS company (spreadsheets plus accounting software, Stripe Billing with a metering tool, Zuora, Salesforce Revenue Cloud, or SAP BRIM) and decide whether to sell through a merchant of record (Paddle, Lemon Squeezy, Polar, FastSpring) or stay the seller with Stripe Tax or Avalara. Use when the user asks which billing platform, subscription billing tool or usage billing tool to use, whether they have outgrown QuickBooks or Stripe, Zuora vs Stripe, whether they need a merchant of record, or how to handle VAT and sales tax on international SaaS sales."
---

# Billing Platform and Merchant of Record Selector

Two separate decisions: **which system runs billing**, and **who is the legal seller**
(you, or a merchant of record). Answer both from the company's real constraints, not from
feature lists.

## Part A: Billing platform

### Step 1: Gather the inputs

Ask only for what is missing:
1. Annual revenue (ARR): under $3M, $3-20M, $20-100M, $100M+.
2. Core systems: SAP ERP, Salesforce as the CRM system of record, or a lighter stack
   (HubSpot, QuickBooks, Xero).
3. Billing model (any that apply): flat subscriptions, usage/consumption, hybrid (platform
   fee + usage + tiers), complex enterprise contracts.
4. Multi-entity, multi-currency or global tax compliance: needed now, within 1-2 years, or
   not needed.
5. Billing ops capacity: dedicated RevOps/billing engineering, a small ops team, or founders.
6. Implementation time available: weeks, 3-6 months, or 6-12+ months.

### Step 2: Apply the fit rules

| Option | Strong fit signals |
|---|---|
| Spreadsheets + accounting software (QuickBooks/Xero) + a payment link | Under $3M ARR on a light stack, flat pricing, founders running billing, need it live in weeks |
| Stripe Billing + a metering tool (Metronome, Orb or Amberflo) | $3-20M ARR, usage-based pricing, dev-light team, live in weeks to a few months |
| Zuora | $20-100M ARR, hybrid or custom pricing, multi-entity needs coming, independent of the ERP |
| Salesforce Revenue Cloud | Salesforce is already the system of record and CPQ/billing should live there |
| SAP BRIM | SAP S/4HANA or ECC is the ERP, $100M+ ARR or complex enterprise contracts, 6-12+ month program acceptable |

Two overriding rules:
- **Existing core system wins ties.** Running SAP points strongly to BRIM; Salesforce as the
  system of record points to Revenue Cloud. A second source of truth costs more than any
  feature gap.
- **Honest floor.** Under $3M ARR on a light stack, recommend the simple stack regardless of
  the other answers. Enterprise platforms are overhead until the company hits real
  complexity or compliance walls.

### Step 3: Output

Give the recommendation, 3-5 reasons tied to the user's answers, the runner-up and what
would change the answer (for example "if usage pricing launches next year, Stripe Billing +
Orb"), and the main migration risk. Name the vendors' current pricing only if you can verify
it; otherwise say to check it.

## Part B: Merchant of record or direct

### Step 1: Gather the inputs

Where customers pay from (home country only, 1-2 markets, 3+ markets, global), customer
type (B2C, self-serve SMB, mixed, enterprise invoiced), international revenue, in-house
tax capacity for VAT/GST registration and filing, whether customers need invoices issued
by the company itself, and payment methods (cards, ACH/SEPA, wire, local methods).

### Step 2: Decide

| Outcome | When |
|---|---|
| **Merchant of record** (Paddle, Lemon Squeezy, Polar, FastSpring) | Self-serve or B2C, selling into many countries, little tax capacity. The MoR is the legal seller and takes on VAT/GST and sales tax registration, collection and filing, at a higher fee than a processor. |
| **Direct** (Stripe + Stripe Tax or Avalara) | Mostly enterprise or invoiced deals, customers need invoices from the company itself, wire/ACH payments, or in-house tax capacity. You stay the seller and own the compliance. |
| **Hybrid** | MoR for self-serve, direct invoicing for enterprise. The most common setup as companies grow into larger deals. |

State the trade-off plainly: an MoR removes tax work but adds fees, puts a third party's name
on the customer's invoice, and limits control over checkout and payment methods.

## Common mistakes to avoid

- Picking an enterprise platform at early-stage revenue.
- Adding a billing system that duplicates the ERP or CRM system of record.
- Treating "merchant of record" as just a payment processor.
- Quoting vendor prices or features from memory as current fact.

## Learn more

- [Billing platform selector (web version)](https://revexos.com/billing-platform-selector?utm_source=q2c-kit)
- [Merchant of record selector](https://revexos.com/mor-selector?utm_source=q2c-kit)
- [Platform guides](https://revexos.com/platforms?utm_source=q2c-kit)
