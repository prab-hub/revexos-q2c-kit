# RevExOS Q2C Kit for Claude

Quote-to-cash skills for Claude: price a deal, turn it into a contract and an order, set up
billing and proration, collect the cash, recognize the revenue, and audit the whole process.
Each skill works on its own and produces a complete output (a quote, an order checklist, an
invoice, a dunning plan, a revenue schedule, an audit). Connect your accounting, payments or
CRM system and the same skills work against your real data.

Built by [RevExOS](https://revexos.com), a free learning hub for quote-to-cash.

## What's inside

| Skill | What it does |
|---|---|
| `quote-builder` | Quotes and proposals for services and SaaS: packaging, discount guardrails, one-time vs recurring lines |
| `contract-handoff` | Accepted quote to reconciled order, MSA/SOW or Order Form, and an owned provisioning checklist |
| `po-to-invoice` | Customer PO to an invoice their AP team will accept: PO number, exact lines, partial deliveries |
| `three-way-match` | PO, goods receipt and invoice matched line by line with tolerances, and the amount safe to approve |
| `billing-setup` | Flat, seat, usage, milestone and hybrid billing; upgrades, downgrades and proration with the math shown |
| `payment-terms-late-fees` | Payment terms, the contract clause, late fee policy, and interest owed (incl. UK statutory interest) |
| `collections-revrec` | Dunning cadence, AR aging, promises to pay, cash forecast, reconciliation, ASC 606 / IFRS 15 schedules |
| `billing-platform-selector` | Which billing system to use, and whether to sell through a merchant of record |
| `revexos-invoice-parser` | Invoice PDF or image to structured data and CSV, with the totals checked |

Slash commands in Claude Code: `/quote`, `/parse-invoice`, `/dunning`, `/prorate`, `/revrec-schedule`.

The free **RevExOS MCP connector** is added automatically in Claude Code. Its tools:
`parse_invoice`, `parse_purchase_order`, `match_po_to_invoice`, `generate_ar_collection_email`,
`calculate_proration`, `build_revrec_schedule`, `calculate_late_payment_interest` and
`calculate_invoice_due_date`. The calculators use the same code as the
[revexos.com tools](https://revexos.com/tools), so the numbers match. See
[CONNECTORS.md](CONNECTORS.md) for how the skills use them and for the official Xero, QuickBooks,
Stripe, PayPal and HubSpot servers.

## Install

### Claude Code

```
/plugin marketplace add prab-hub/revexos-q2c-kit
/plugin install revexos-q2c-kit@revexos-q2c-kit
```

Then just ask, for example:

- "Build a quote for a $4k/month marketing retainer, annual prepay, with a 10% discount."
- "We upgraded a customer from $12k/year to $24k/year after one month. What do we invoice?"
- "This customer is 20 days late on INV-1042 for $4,500. Draft the next email."
- "Set up revenue recognition for a $50k annual contract with a $10k implementation fee."
- "Check this supplier invoice against PO-4500123 and the delivery note."
- "What payment terms and late fee should we put in our MSA?"

If you already have the standalone `revexos-invoice-parser` plugin, you can uninstall it: the
kit includes the same skill.

### claude.ai or Claude Desktop

1. Download the skill zips you want from the [latest release](https://github.com/prab-hub/revexos-q2c-kit/releases/latest) (one zip per skill).
2. Go to **Settings > Capabilities > Skills**, click **Upload skill**, and choose a zip. Repeat for each skill.
3. Optional: add the RevExOS connector under **Settings > Connectors > Add custom connector** with the URL `https://revexos.com/api/mcp` ([setup steps](https://revexos.com/mcp)).
4. The invoice parser skill calls revexos.com from Claude's code sandbox: allow network access for code execution (all domains, or add `revexos.com`).

## Notes

- Revenue recognition and tax output follow the standard frameworks but are not a substitute for
  your accountant's sign-off on judgment calls (bundled fees, contract modifications).
- Proration defaults to **by month** (whole months equal, a partial month split by its own days).
  The skills switch to **by day** (Stripe's default) when your contract or billing system uses it.
- Free and open source under the MIT license. Issues and pull requests welcome.

## Maintainers

- `scripts/sync-invoice-parser.sh` copies the invoice-parser skill from
  [prab-hub/revexos-invoice-parser](https://github.com/prab-hub/revexos-invoice-parser), so both
  plugins ship the same files. Run it before each release.
- `scripts/build-zips.sh` builds one zip per skill in `dist/` for the release.
