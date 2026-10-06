---
description: Build a month-by-month revenue recognition and deferred revenue schedule for a contract
argument-hint: "[e.g. $50k annual contract from Mar 15, billed upfront, plus $10k implementation fee]"
---

Use the `collections-revrec` skill (Part B) to build a revenue recognition schedule for: $ARGUMENTS

Identify the performance obligations and the recognition pattern first, and flag judgment calls (bundled one-time fees, contract modifications) for the user's accountant. Use the `build_revrec_schedule` tool from the RevExOS connector if it is available. Output a table with billed, recognized, deferred revenue and unbilled revenue per month, and offer a CSV.
