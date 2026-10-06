---
name: collections-revrec
description: "Run collections and revenue recognition: staged dunning cadence, AR aging and prioritization, promise-to-pay and dispute tracking, cash forecasts, payment-to-invoice reconciliation, and ASC 606 / IFRS 15 aligned revenue schedules with deferred revenue. Use when a customer has not paid, or the user asks for a dunning sequence, AR follow-up flow or collection email, payment reconciliation, revenue recognition for a contract, or a deferred revenue schedule."
---

# Collections & Revenue Recognition

Cover the back half of quote-to-cash: getting paid on time, reconciling payments, and
recognizing revenue correctly once cash and contracts diverge (which they almost always
do). Read `references/asc606-revrec-primer.md` before building a revenue recognition
schedule - do not improvise the accounting treatment.

## Part A - Collections & AR follow-up

### Step 1: Design the dunning cadence

Build an explicit, staged cadence rather than a single "send a reminder" step:

| Stage | Timing | Action |
|---|---|---|
| Pre-due reminder | 3–5 days before due date | Friendly email reminder |
| Due date | Day 0 | Payment attempt (if on autopay/card) or invoice reminder |
| First follow-up | Day +3–5 | Email + payment retry if card-based |
| Second follow-up | Day +14 | Email + task to account owner/CSM for a personal check-in |
| Escalation | Day +30 | Finance/collections involvement; consider service restriction per contract terms |
| Final notice | Day +60–90 | Formal notice per contract; evaluate write-off or legal escalation path |

State which stage a given overdue invoice is at and the next action, rather than treating
every overdue invoice the same way. Adjust timing to the customer's specific payment
terms and any negotiated grace period from the order.

To draft the email for a stage, use the `generate_ar_collection_email` tool from the
RevExOS connector (bundled with this plugin) when it is available. Map the invoice to its
`stage` (1 = 3 days before due, 2 = due today, 3 = 1-7 days late, 4 = 8-14, 5 = 15-30,
6 = 31+ final notice) and set `relationship` to `vip` for long-term or high-value
customers so the tone stays softer. The tool needs the user's email address; ask for it
rather than inventing one. Without the connector, write the email yourself following the
same stage and tone.

### Step 2: AR aging and prioritization

Bucket outstanding invoices by age (0–30, 31–60, 61–90, 90+ days) and prioritize
follow-up by a combination of age and dollar amount - a large 31-day invoice usually
warrants attention before a small 60-day one. If a CRM connector (~~crm) is available,
note that aging invoices should generate tasks for the account owner, not just sit in a
finance report no one else sees.

### Step 3: Payment reconciliation

- Match payments from a payments connector (~~payments) against open invoices in the
  accounting system (~~accounting) by amount and reference/invoice number.
- Handle partial payments explicitly: state whether the remaining balance stays open on
  the same invoice or generates a new one, per the user's process.
- Flag unmatched payments (wrong amount, missing reference) for manual review rather than
  guessing which invoice they apply to.

### Step 4: Service impact of non-payment

State, based on the contract, what happens if an invoice goes unpaid past the escalation
threshold - service suspension, feature restriction, or continued service with
collections handled separately. Never assume suspension is automatic; confirm it's in the
contract terms surfaced during `contract-handoff`.

### Step 5: Promises to pay, disputes and stalling

- Log every **promise to pay** (date and amount) from calls and replies, and check it the
  day after it falls due. A missed promise moves the invoice up one stage immediately.
- Track each customer's **honor rate** (promises kept / promises made). Use it to weight
  follow-up and the cash forecast below.
- Separate a **dispute** (a specific problem with the invoice: wrong amount, missing PO,
  service issue) from **stalling** (vague delays, "in the system", repeated new contacts).
  Disputes pause dunning on the disputed part only and go to whoever can fix the invoice;
  undisputed amounts stay due. Stalling escalates on schedule.
- Before any pre-legal or final notice, write a one-paragraph brief for the account owner:
  amount, age, contact history, promises and whether they were kept, and the recommended
  next step.

### Step 6: Cash forecast from AR

Forecast collections per week from open invoices: expected date = due date + the customer's
usual days late, weighted by their honor rate for invoices already promised. Report the
forecast next to last week's actual collections, so the forecast's accuracy is visible.

## Part B - Revenue recognition

### Step 1: Determine the recognition pattern

Using the ASC 606 / IFRS 15 five-step framework detailed in
`references/asc606-revrec-primer.md`, classify each contract's performance obligations:

- **Point-in-time**: recognized when a deliverable is completed/accepted (e.g., a fixed
  project milestone).
- **Over-time, ratable**: recognized evenly across the contract term (the standard
  treatment for SaaS subscriptions).
- **Over-time, percentage-of-completion**: recognized as work progresses, based on
  effort or cost incurred relative to total estimated effort/cost (common for larger
  services engagements).

### Step 2: Handle multi-element arrangements

For hybrid deals (one-time implementation fee + recurring subscription, or a bundled
service + software deal), do not recognize the one-time fee entirely on receipt if it
represents setup work with no standalone value to the customer - in many cases it should
be recognized over the expected customer relationship period alongside the subscription.
Flag this as a judgment call requiring the user's accountant/auditor's sign-off; this
skill provides the standard framework, not a substitute for professional accounting
judgment on a specific contract.

### Step 3: Build the deferred revenue schedule

For any contract billed in advance of the period it covers (annual prepay SaaS, retainer
paid upfront), construct a month-by-month recognition schedule so billed cash and
recognized revenue are tracked separately. See the worked example in
`references/asc606-revrec-primer.md`.

Recognize equal amounts per full month (contract value / term in months); a partial first
or last month gets that amount times the share of its own days covered. When the RevExOS
connector is available, `build_revrec_schedule` produces the full table (subscription,
milestone, or prepaid usage with overage and breakage).

### Step 4: Handle contract changes

- **Upgrades/downgrades mid-term**: adjust the remaining recognition schedule
  prospectively from the change date, not retroactively, unless the change qualifies as a
  contract modification requiring a full re-assessment (flag this distinction rather than
  picking one silently).
- **Early termination**: stop recognizing future periods as of the termination date, and
  flag any deferred revenue that must be reversed or any earned-but-unbilled revenue that
  must be recognized.

## Common mistakes to avoid

- Treating every overdue invoice identically regardless of age or amount.
- Guessing which invoice an unmatched payment applies to instead of flagging it.
- Recognizing a bundled one-time fee entirely upfront without checking whether it has
  standalone value.
- Recognizing annual-prepay revenue as a lump sum instead of ratably over the term.
- Making a revenue recognition call without noting it should be confirmed with the
  user's accountant, especially for judgment-heavy cases (modifications, bundling).

## Learn more

Free guides and tools on revexos.com that go deeper on this stage:

- [AR automation guide](https://revexos.com/ar-automation?utm_source=q2c-kit)
- [AR prompt playbook (15 prompts for running AR in Claude)](https://revexos.com/ar-prompt-playbook?utm_source=q2c-kit)
- [AR collection email generator](https://revexos.com/ar-collections-email-generator?utm_source=q2c-kit)
- [Revenue recognition calculator](https://revexos.com/revenue-recognition-calculator?utm_source=q2c-kit)
- [Late payment interest calculator](https://revexos.com/late-payment-interest-calculator?utm_source=q2c-kit)
- [Payment reconciliation guide](https://revexos.com/payment-reconciliation?utm_source=q2c-kit)
