# Connectors

## Bundled: the RevExOS connector

Installing the plugin in Claude Code also adds the free RevExOS MCP server
(`https://revexos.com/api/mcp`, see `.mcp.json`). No sign-in. Tools today:

| Tool | Used by |
|---|---|
| `parse_invoice` | revexos-invoice-parser, three-way-match |
| `parse_purchase_order` | po-to-invoice, three-way-match |
| `match_po_to_invoice` | three-way-match |
| `generate_ar_collection_email` | collections-revrec |
| `calculate_proration` | billing-setup |
| `build_revrec_schedule` | collections-revrec |
| `calculate_late_payment_interest` | payment-terms-late-fees |
| `calculate_invoice_due_date` | payment-terms-late-fees, po-to-invoice |

The document tools need your email address and allow 5 uses per email per day. The calculators
need nothing and have no limit.

In claude.ai or Claude Desktop, add it by hand: **Settings > Connectors > Add custom connector**,
URL `https://revexos.com/api/mcp` ([setup steps](https://revexos.com/mcp)).

## Official connectors for your own systems

This kit does not ship its own QuickBooks, Xero or Stripe connector, and never holds your
credentials. Connect the vendors' official servers and the skills will use them:

| System | Official server | Placeholder |
|---|---|---|
| Xero | [XeroAPI/xero-mcp-server](https://github.com/XeroAPI/xero-mcp-server); also in the claude.ai connector directory | `~~accounting` |
| QuickBooks Online | [intuit/quickbooks-online-mcp-server](https://github.com/intuit/quickbooks-online-mcp-server) (runs locally, early preview) | `~~accounting` |
| Stripe | [Stripe MCP](https://docs.stripe.com/mcp) | `~~payments` |
| PayPal | [PayPal MCP server](https://developer.paypal.com/tools/mcp-server/) | `~~payments` |
| HubSpot | [HubSpot MCP](https://developers.hubspot.com/mcp) | `~~crm` |


## How tool references work

Skill files in this plugin use `~~category` as a placeholder for whatever tool the
company connects in that category (for example, `~~accounting` might mean Xero,
QuickBooks, or another accounting platform with an MCP connector). The skills are
tool-agnostic by design - they describe the quote-to-cash workflow in terms of
categories rather than one specific vendor, so the plugin works whether a company runs
Xero or QuickBooks, HubSpot or Salesforce, Stripe or another payment processor.

When a placeholder is mentioned, it means "if a connector for this category is
available, use it - otherwise, produce the same output as a document/checklist and note
that connecting a tool in this category would let it happen automatically."

## All placeholders

| Category | Placeholder | Common options | Used by |
|---|---|---|---|
| CRM | `~~crm` | HubSpot, Salesforce, Pipedrive | quote-builder, contract-handoff, collections-revrec |
| Accounting | `~~accounting` | Xero, QuickBooks | quote-builder, billing-setup, collections-revrec, po-to-invoice, three-way-match |
| Payments | `~~payments` | Stripe, Paddle, Braintree | billing-setup, collections-revrec |
| E-signature | `~~e-signature` | DocuSign, PandaDoc, HelloSign | contract-handoff |
| Project tracker | `~~project tracker` | Asana, Linear, Jira, Monday | contract-handoff, collections-revrec |
| Workflow automation | `~~workflow automation` | n8n, Make, Zapier | billing-setup |
| Chat/notifications | `~~chat` | Slack, Microsoft Teams | collections-revrec |

None of these connectors are required for the skills to be useful - every skill produces
a complete, structured output (a quote, an order/checklist, an invoice, a dunning
sequence, an audit report) on its own. Connecting tools in these categories lets the
output be pushed directly into the company's systems instead of handled as a document.
