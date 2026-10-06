# Entitlement & Provisioning Checklists

Detailed by-deal-type checklists backing the `contract-handoff` skill.

## Accounting/bookkeeping retainer

1. Create client entity in practice management / accounting system (~~accounting)
2. Collect engagement-required documents (prior filings, chart of accounts, bank feed
   access) - owner: onboarding specialist, target T+3 business days
3. Set up bank/card feed connections and access permissions
4. Assign staff (preparer + reviewer) per the engagement letter's scope
5. Schedule recurring close calendar (monthly close date, quarterly review, annual filing
   deadlines)
6. Confirm signed engagement letter references the correct scope band (e.g., "up to
   quarterly filings" vs. "full-service bookkeeping + advisory")

## Marketing agency retainer

1. Create client workspace in project tracker (~~project tracker) and shared asset
   library
2. Set up ad account access (whoever owns billing - agency or client) and confirm media
   spend markup/handling terms from the quote
3. Assign account lead + specialists per scope (SEO, paid, content, etc.)
4. Schedule kickoff call and first 30/60/90-day plan
5. Confirm reporting cadence and the dashboard/tool the client will see (analytics
   connector)
6. Flag if the deal includes a value-based/outcome fee component - set up the tracking
   needed to measure that outcome before month 1 closes

## Dev/software agency project or T&M engagement

1. Provision repo access, environment access, and any required credentials
2. Assign engineering staff against the SOW's role mix and confirm capacity
3. Set up time tracking against the T&M rate card if applicable, or milestone tracking
   for fixed-fee
4. Schedule kickoff and confirm the change-order process for scope changes (should be
   referenced in the SOW, not improvised later)
5. Confirm invoicing trigger: milestone completion, hours billed, or monthly retainer
   date

## SaaS subscription

1. Create tenant/account, allocate seats per the order (~~crm or product admin)
2. Apply feature flags matching the purchased plan tier and any add-ons
3. Set up SSO/SCIM or key integrations if the plan/contract includes them
4. Trigger welcome/onboarding sequence (~~email or in-app)
5. Confirm usage metering is active before the first usage-based invoice would be
   generated, if applicable
6. Record the auto-renewal date and notice period in the system of record so it surfaces
   ahead of renewal, not after

## Hybrid (implementation + subscription)

1. Sequence: implementation/onboarding checklist (above) should substantially complete
   before or align with the subscription billing start date
2. Keep the one-time implementation fee and recurring subscription fee as separate order
   lines all the way through - do not let them merge into a single "go-live" billing
   event
3. Confirm with the customer, in writing, what "live" means (the trigger for subscription
   billing to start) to avoid disputes

## Renewal terms cheat sheet

| Clause | What to check | Why it matters |
|---|---|---|
| Auto-renewal | Does the contract auto-renew, and what's the notice period to opt out? | Missing this causes surprise renewals or missed non-renewal windows |
| Price uplift | Is there a stated annual increase (e.g., CPI + 2%) on renewal? | Needs to be reflected in the next billing cycle without a manual re-quote |
| Term length mismatch | Does the SOW/Order Form term match the MSA term (if separate)? | A common reconciliation gap between legal and billing systems |
| Early termination | What penalty or notice applies if the customer exits early? | Needed for correct revenue recognition if a contract terminates early |

## Redline/approval routing (typical default)

1. Sales rep drafts from the reconciled order
2. Deal desk / RevOps reviews for pricing and terms consistency with the quote
3. Legal reviews only if non-standard terms are requested (flag which terms are
   non-standard when routing)
4. Customer signs, then internal countersignature
5. Fully executed contract synced to CRM and triggers the provisioning checklist
