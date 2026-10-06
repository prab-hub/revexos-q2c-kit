---
description: Parse an invoice PDF or image into structured data and CSV, with the totals checked
argument-hint: "[path or public URL of the invoice file]"
---

Use the `revexos-invoice-parser` skill to parse this invoice: $ARGUMENTS

If it is a local file, run the skill's script. If it is a public https link and the RevExOS connector is available, use the `parse_invoice` tool. Show the header fields, the line items as a table, and whether the line items add up to the subtotal and the subtotal plus tax to the total. Offer to save a CSV.
