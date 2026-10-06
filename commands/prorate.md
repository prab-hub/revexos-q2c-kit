---
description: Prorate a mid-period plan change (upgrade, downgrade, seats) by month or by day
argument-hint: "[e.g. annual plan $12k from Jan 1, upgraded to $24k on Feb 1]"
---

Use the `billing-setup` skill (Step 3, proration) for this change: $ARGUMENTS

Default to the by-month method unless the user says their contract or billing system prorates by day. Use the `calculate_proration` tool from the RevExOS connector if it is available. Show the credit for the unused old plan, the charge for the new plan, the net amount, the formula, and the invoice line text.
