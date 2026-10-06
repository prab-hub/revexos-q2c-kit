---
name: contract-handoff
description: "Turn an accepted quote into a reconciled order, a contract package (MSA + SOW or Order Form), and an owned, dated provisioning checklist, then hand clean billing inputs to billing setup. Use when the user asks to turn a quote into a contract, set up the order, provision a new customer, send a deal for signature, convert a quote to a SOW or MSA, or asks what happens after a deal closes."
---

# Contract & Order Handoff

Bridge the gap between "quote accepted" and "customer is live and billable." This is
where deals most often stall or get provisioned incorrectly, because the quote's intent
doesn't automatically become a clean order record. Read
`references/entitlement-provisioning-checklist.md` for the by-deal-type checklists this
skill assumes.

## Step 1: Reconcile the quote into an order

Before generating any contract paperwork, build an order record from the accepted quote
and check it line-by-line against the original quote:

- Every quote line item (one-time and recurring) must appear on the order with the same
  price, quantity, and billing frequency - flag any discrepancy instead of silently
  carrying it forward.
- Capture: legal entity name and billing address, primary and billing contacts, contract
  start date, term length, auto-renewal clause (and notice period), payment terms, PO
  number if the customer requires one.
- If the deal was hybrid (one-time + recurring), keep those as distinct order lines -
  this distinction feeds both billing setup and revenue recognition later.

## Step 2: Package the contract

Assemble the contract/order form appropriate to the deal:

- Service deals typically need a Master Services Agreement (MSA) plus a Statement of
  Work (SOW) or Order Form referencing it - check whether an MSA already exists for this
  customer (renewal/expansion) before drafting a new one.
- SaaS deals typically need an Order Form referencing a standard Terms of Service /
  Subscription Agreement.
- Include the renewal terms explicitly in plain language (auto-renews unless cancelled
  with N days' notice; price uplift clause if any) - this is a frequent source of
  disputes if left implicit.

If an e-signature connector (~~e-signature) is available, note that the contract should
be routed there for signature tracking rather than emailed as a static PDF, and specify
the signing order (customer signer, then internal countersignature) and any redline/legal
review step before it goes out.

## Step 3: Build the entitlement & provisioning checklist

Translate the order's line items into what must actually be provisioned. This differs
sharply by deal type - use `references/entitlement-provisioning-checklist.md` for the
full checklists. At minimum, produce:

- **SaaS**: account/tenant creation, seat allocation, feature flags per plan tier, SSO or
  integration setup if applicable, welcome/onboarding email trigger.
- **Service engagements**: internal staffing assignment, kickoff call scheduling, access
  provisioning (shared drives, tools, credentials), delivery calendar aligned to the
  retainer/project scope.
- **Hybrid**: both of the above, sequenced so the one-time implementation work completes
  before or alongside the subscription's billing start date.

State an owner and a target completion date (relative to signature, e.g., "T+2 business
days") for each checklist item - an unowned checklist item is the single most common
cause of a customer being billed before they're actually live.

## Step 4: Sync systems of record

- If a CRM connector (~~crm) is available, move the deal to Closed-Won, link the signed
  contract, and create/update the account and order records there rather than leaving
  them only in a document.
- If a project tracker connector (~~project tracker) is available, note that the
  provisioning checklist should become tracked tasks assigned to the delivery/ops team,
  not just a static list.
- Confirm the billing start date and cadence that will be handed to the
  `billing-setup` skill - this must match what was promised in the order, not
  default to "today."

## Step 5: Hand off to billing

Explicitly state the following before closing out this skill's work, since they are the
required inputs to `billing-setup`:

- Billing start date
- Billing frequency and payment terms
- One-time vs. recurring line items and their amounts
- Any proration needed if the start date falls mid-cycle

## Common mistakes to avoid

- Generating a contract that doesn't match the quote's numbers (a reconciliation gap).
- Leaving renewal/auto-renewal terms unstated or buried in boilerplate.
- Treating provisioning as "someone else's problem" instead of producing an owned,
  dated checklist.
- Setting a billing start date without confirming it against actual provisioning
  readiness.

## Learn more

Free guides and tools on revexos.com that go deeper on this stage:

- [Q2C integration guide](https://revexos.com/q2c-integration?utm_source=q2c-kit)
- [Lead-to-cash stages](https://revexos.com/lead-to-cash?utm_source=q2c-kit)
