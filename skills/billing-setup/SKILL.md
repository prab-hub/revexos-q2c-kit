---
name: billing-setup
description: "Configure billing for a B2B retainer or SaaS subscription (flat, seat-based, usage, milestone, or hybrid), handle upgrades, downgrades and mid-cycle proration with the math shown, and generate a correctly structured invoice. Use when the user asks to set up billing for a customer, generate an invoice, configure recurring or usage-based billing, handle a plan change, or prorate a mid-cycle change."
---

# Billing & Invoicing Setup

Turn a reconciled order (from `contract-handoff`) into a working billing
configuration and correct invoices. Read `references/billing-models.md` for proration
math, usage-metering patterns, and the invoice line-item schema this skill assumes.

## Step 1: Confirm the billing inputs

Before configuring anything, confirm these came from the order, not assumptions:

- Billing start date and whether it falls mid-cycle (requires proration - see Step 3)
- Billing frequency (monthly, quarterly, annual) and in-advance vs. in-arrears timing
- One-time vs. recurring line items, kept separate
- Payment terms (Net 30, due on receipt) and accepted payment method(s)
- Currency and tax treatment
- For usage-based components: the metering driver, included allowance, and overage rate

If any of these weren't explicitly set during contract handoff, say so and ask rather
than defaulting silently - a wrong billing start date is one of the most common causes
of customer disputes and involuntary churn.

## Step 2: Choose the billing model configuration

Match the deal to a configuration pattern from `references/billing-models.md`:

- **Flat recurring** (retainers, flat SaaS plans): fixed amount per billing period, no
  metering needed.
- **Seat-based**: recompute the seat count at each billing cycle (or on change) and bill
  the current count - decide and state whether seat changes bill immediately or at the
  next cycle.
- **Usage/metered**: billed in arrears against actual usage; define the aggregation
  window (daily/monthly) and the source of truth for usage data.
- **Milestone/project billing**: invoice triggered by milestone completion, not a
  calendar date - confirm the milestone acceptance criteria before invoicing.
- **Hybrid**: flat platform fee billed in advance, usage component billed in arrears the
  following period - keep these as separate invoice lines or separate invoices
  entirely, and state which approach was chosen.

## Step 3: Handle subscription changes and proration

For any upgrade, downgrade, add-on, or mid-cycle start:

1. State the proration method and show the calculation, don't just state the result.
   Default to **by month**: every whole month of the billing period is worth the same
   (period amount / months in the period), and only a partial month is split by the
   days in that month. Use **by day** (period amount / days in the period, Stripe's
   default) only when the contract or the user's billing system uses it, and say so. For
   monthly plans the two give the same answer. See `references/billing-models.md`.
   When the RevExOS connector is available, run `calculate_proration` to get exact
   figures, and still show the formula.
2. Decide and state whether the change is effective immediately (with a prorated credit
   or charge) or at the next billing cycle - this should follow the customer's contract
   terms if specified, otherwise ask.
3. For downgrades or cancellations, confirm the effective date and whether any refund or
   credit applies per the contract's terms - never assume a refund is owed without
   checking.
4. Downstream, an upgrade/downgrade may need to be reflected in the entitlement/feature
   flags (from `contract-handoff`) - flag that provisioning needs to be updated
   alongside the billing change, not after.

## Step 4: Generate the invoice

Structure every invoice explicitly:

- Invoice number, issue date, due date (from payment terms)
- Billing period covered (start–end dates), stated even for flat-fee recurring charges
- Line items matching the order (one-time vs. recurring kept distinct), with quantity,
  unit price, and subtotal per line
- Usage/overage lines showing the included allowance, actual usage, and the overage
  calculation
- Tax line (confirm rate via an accounting connector, ~~accounting, rather than
  guessing)
- Total due, payment terms, and accepted payment methods
- PO number if the customer's order requires one

If an accounting or payments connector is available (~~accounting, ~~payments), note
that the invoice should be created/synced there as the system of record rather than
existing only as a document, and that payment status should be tracked there. If a
workflow automation connector is available (~~workflow automation), note that recurring
invoice generation is a good candidate to automate on a schedule rather than done
manually each cycle.

## Step 5: Hand off to collections

State explicitly, for use by `collections-revrec`:

- The invoice's due date and what happens if it isn't paid by then (grace period, if any)
- Whether this customer/invoice has any special payment arrangement that should change
  standard dunning behavior

## Common mistakes to avoid

- Billing a mid-cycle change at the full-period rate instead of prorating.
- Merging one-time and recurring charges into a single invoice line, which breaks
  revenue recognition later.
- Guessing a tax rate instead of flagging it as estimated.
- Not stating whether a plan change is immediate or deferred to next cycle.

## Learn more

Free guides and tools on revexos.com that go deeper on this stage:

- [Proration calculator (by month or by day)](https://revexos.com/proration-calculator?utm_source=q2c-kit)
- [Billing platform selector](https://revexos.com/billing-platform-selector?utm_source=q2c-kit)
- [Invoice automation guide](https://revexos.com/invoice-automation?utm_source=q2c-kit)
- [Invoice generator](https://revexos.com/invoice-generator?utm_source=q2c-kit)
