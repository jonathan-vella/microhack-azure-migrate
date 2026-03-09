---
description: "Trigger conditions for updating documentation when code changes"
applyTo: "**/*.{js,mjs,cjs,ts,tsx,jsx,py,ps1,sh,bicep,tf}"
---

# Documentation Update Triggers

When changing code or scripts, update docs if any of the following are affected:

- Workshop flow, challenge sequence, or timing
- Scoring behavior or rubric interpretation
- Facilitator setup, execution, or cleanup process
- Participant prerequisites, troubleshooting, or expected outputs
- Commands, parameters, or safety warnings

## Minimum Docs to Check

- `README.md`
- `AGENDA.md`
- `docs/challenges/` files related to the changed behavior
- `docs/audiences/facilitator/` and `docs/audiences/participant/` files impacted by the change
- `scripts/README.md`
