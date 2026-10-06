# Billing Models Reference

Detailed math and patterns backing the `billing-setup` skill.

## 1. Proration: by month (default) or by day

Both methods are defensible. Pick one, write it into the contract, and use it every time.

**By month (default).** Every whole month of the billing period is worth the same amount.
Only a partial month is split by the days in that month (28, 29, 30 or 31).

```
monthly_value   = period_amount / months_in_period
prorated_amount = monthly_value × whole_months
                + (monthly_value / days_in_partial_month) × days_used_or_left_in_that_month
```

**By day (Stripe's default).** The price is spread over every day of the period, so
31-day months count slightly more than 28-day ones. Use it only when the contract or the
billing system works this way.

```
prorated_amount = (period_amount / days_in_period) × days_remaining_or_used
```

For monthly plans the two methods give the same answer. They differ on annual and
quarterly plans.

**Worked example - annual plan upgraded after exactly one month:**
$12,000/year plan started Jan 1, upgraded to $24,000/year on Feb 1.

```
By month: 11 of 12 months left
  credit for unused old plan = $12,000 × 11/12 = $11,000.00
  charge for new plan        = $24,000 × 11/12 = $22,000.00
  net charge                 = $11,000.00

By day: 31 of 365 days used, 334 left
  credit for unused old plan = $12,000 × 334/365 = $10,980.82
  charge for new plan        = $24,000 × 334/365 = $21,961.64
  net charge                 = $10,980.82
```

**Worked example - mid-cycle start (both methods agree):**
Monthly plan = $3,000/month. Customer starts on day 10 of a 30-day billing period (21
days remaining, including the start day).

```
daily_rate = $3,000 / 30 = $100/day
prorated_first_invoice = $100 × 21 = $2,100
```

**Worked example - mid-cycle upgrade:**
Customer upgrades from a $1,000/month plan to a $2,500/month plan on day 15 of a 30-day
period (15 days remaining).

```
credit_for_unused_old_plan = ($1,000 / 30) × 15 = $500
charge_for_new_plan_remainder = ($2,500 / 30) × 15 = $1,250
net_prorated_charge = $1,250 - $500 = $750
```

State both the credit and the new charge, not just the net - customers reconcile against
both.

## 2. Seat-based billing patterns

| Approach | How it works | Trade-off |
|---|---|---|
| Bill current seat count each cycle | Recompute seats at the start of each billing period | Simple; slight lag between adding a seat and being billed for it |
| Bill immediately on seat addition (prorated) | Add a prorated charge the moment a seat is added, true-up at renewal | More accurate revenue capture; more invoicing events |
| True-up at renewal only | Track seat additions through the term, bill the delta at renewal | Simplest for the customer; delays revenue recognition of the additional seats |

State which approach applies before generating any seat-change invoice.

## 3. Usage/metered billing patterns

- **Source of truth**: usage must come from a single authoritative system (product
  telemetry, API gateway logs) - never estimate usage for an invoice.
- **Aggregation window**: typically daily rollups aggregated to a monthly invoice;
  confirm which window applies before calculating overage.
- **Included allowance**: state the plan's included usage explicitly on the invoice
  (e.g., "10,000 API calls included") even when usage was under the limit, so the
  customer can see headroom.
- **Overage calculation**:

```
overage_units = max(0, actual_usage - included_allowance)
overage_charge = overage_units × overage_rate_per_unit
```

- **True-up invoices**: when usage data isn't available until after the period closes
  (common with annual-prepay-plus-overage contracts), issue a separate true-up invoice
  rather than delaying the main recurring invoice.

## 4. Invoice line-item schema (structural reference)

Use this shape when producing an invoice as structured data (e.g., for a spreadsheet
export or to hand to a ~~workflow automation or ~~accounting integration):

```json
{
  "invoice_number": "",
  "customer": "",
  "issue_date": "",
  "due_date": "",
  "billing_period": { "start": "", "end": "" },
  "line_items": [
    {
      "description": "",
      "type": "one_time | recurring | usage",
      "quantity": 0,
      "unit_price": 0,
      "subtotal": 0
    }
  ],
  "tax": { "rate": 0, "amount": 0, "estimated": true },
  "total_due": 0,
  "payment_terms": "",
  "po_number": ""
}
```

## 5. Billing cadence timing conventions

| Cadence | Typical timing | Note |
|---|---|---|
| Monthly recurring | Billed in advance | Standard for SaaS and retainers |
| Usage/overage | Billed in arrears | Can't bill for usage that hasn't happened yet |
| Milestone/project | Billed on acceptance | Confirm acceptance criteria before invoicing, not just delivery |
| Annual prepay | Billed in advance for the full term | Confirm whether a mid-term true-up for usage overage still applies |

## 6. When to escalate instead of auto-generating an invoice

- Customer disputes a prior invoice - resolve before issuing a new one that compounds
  the disagreement.
- Contract has non-standard terms not captured in the standard schema above.
- Usage data is missing, delayed, or looks anomalous (a sudden 10x spike) - verify before
  billing it.
