---
description: Next collection step and a ready-to-send email for an overdue (or soon due) invoice
argument-hint: "[invoice number, amount, due date, customer, anything known about the relationship]"
---

Use the `collections-revrec` skill (Part A) for this invoice: $ARGUMENTS

Work out how many days overdue it is from today's date, which dunning stage it is at, and the next action. Then draft the email: use the `generate_ar_collection_email` tool from the RevExOS connector if it is available (ask for the user's email address if needed), otherwise write it yourself in the same stage and tone. If the customer is long-term or high-value, keep the tone softer.
