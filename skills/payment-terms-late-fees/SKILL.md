---
name: payment-terms-late-fees
description: "Choose payment terms for B2B invoices and contracts (Net 30, deposits, milestones, retainers, early-payment discounts), write the payment terms clause, set a late fee or late payment interest policy, and calculate the interest owed on an overdue invoice, including UK statutory interest. Use when the user asks what payment terms to offer, to write payment terms for a contract, SOW or invoice, whether to charge late fees, how much interest is owed on a late invoice, what Net 30 EOM or 2/10 Net 30 means, or when an invoice is actually due."
---

# Payment Terms and Late Fees

Payment terms decide when cash arrives; the late fee policy decides what happens when it
doesn't. Set both before the first invoice, write them into the contract, and apply them
the same way every time.

## Step 1: Pick the structure

| Structure | Use when | Clause core |
|---|---|---|
| Net terms (Net 15/30/45) | Established clients, work invoiced on completion or monthly | Due within N days of the invoice date |
| Deposit + balance | New clients, fixed-fee projects | X% non-refundable on signature, work starts on receipt, balance on delivery |
| Milestones | Projects longer than about 2 months | % per named milestone, each invoice due within N days |
| Retainer in advance | Ongoing monthly services | Invoiced on the first business day of the month, work starts on payment |

Guidance:
- Net 30 is the common default for B2B services. Large enterprises often push for Net 45-60;
  accept it only with a matching price or a deposit.
- Shorter terms for new or small clients; a deposit removes most of the risk.
- **EU**: the Late Payment Directive makes 30 days the default for B2B invoices when the
  contract is silent, and caps agreed terms at 60 days unless expressly agreed and not
  grossly unfair.
- **US**: no general federal default; the contract decides, and state usury limits can cap
  interest.

## Step 2: Due dates, explained precisely

- Net N: N calendar days after the invoice date (not business days, unless stated).
- EOM: the last day of the invoice month. Net 30 EOM: 30 days after the end of the invoice
  month (an invoice dated March 5 is due April 30).
- 2/10 Net 30: 2% off if paid within 10 days, otherwise full amount in 30. Skipping the
  discount costs the payer roughly 37% a year, so finance teams with cash usually take it.
- Weekend due dates are usually paid the next business day, and the payment method adds
  clearing time (ACH 1-3 business days, a check about a week).

When the RevExOS connector is available, use `calculate_invoice_due_date` for exact dates,
including the date cash actually lands.

## Step 3: Write the clause

Assemble numbered lines in this order, filling in the user's values:

1. The structure line from Step 1.
2. "All amounts are in [currency] and exclude applicable taxes. The Client is responsible
   for any bank or transfer fees so that [Company] receives the full invoiced amount."
3. Accepted payment methods.
4. Early payment discount, if any.
5. Late fee or interest (Step 4), "or the maximum rate permitted by law, if lower".
6. Right to pause work if an invoice is unpaid N days after its due date, with delivery
   dates moving accordingly.
7. "Invoice disputes must be raised in writing within 10 days of the invoice date;
   undisputed portions remain payable by the due date."

## Step 4: Late fee policy and interest owed

Options: none, interest per month (1-1.5% is common), or a flat fee per late invoice.
Interest is simple, not compound: **amount x annual rate x days overdue / 365**, running
from the day after the due date. A monthly rate converts as monthly x 12.

**UK B2B debts**: statutory interest applies even if the contract is silent: 8% a year
above the Bank of England base rate (the rate in force on 30 June or 31 December before
the debt became overdue), plus fixed compensation of GBP 40 (under GBP 1,000), GBP 70
(GBP 1,000 to 9,999.99) or GBP 100 (GBP 10,000 or more).

When the RevExOS connector is available, use `calculate_late_payment_interest`; otherwise
show the calculation. Then draft one reminder sentence that states the accrued amount.
Often the value is in stating the interest, not collecting it: it moves the invoice up the
client's payment queue, and many firms waive it if paid within a set window.

Say clearly that whether interest can be charged depends on the contract and the
jurisdiction, and that this is not legal advice.

## Common mistakes to avoid

- Terms that exist only on the invoice and not in the signed contract.
- Charging interest the contract never mentioned (outside the UK statutory regime).
- Compounding interest.
- Long terms for a new client with no deposit.

## Learn more

- [Payment terms benchmarker and clause generator](https://revexos.com/payment-terms-benchmarker?utm_source=q2c-kit)
- [Late payment interest calculator](https://revexos.com/late-payment-interest-calculator?utm_source=q2c-kit)
- [Invoice due date calculator](https://revexos.com/invoice-due-date-calculator?utm_source=q2c-kit)
