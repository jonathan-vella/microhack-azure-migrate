---
description: "Code review guidelines with priority tiers, security checks, and structured comment formats"
applyTo: "**/*.{js,mjs,cjs,ts,tsx,jsx,py,ps1,sh,bicep,tf}"
---

# Review Priorities

## P0 - Must Fix

- Security risks, destructive script behavior without confirmation, or credential leakage
- Broken links or invalid references in participant/facilitator guidance under `docs/audiences/`
- Scoring logic errors that affect fairness or totals

## P1 - Should Fix

- Ambiguous challenge instructions or missing acceptance criteria
- Timing and sequencing inconsistencies across `AGENDA.md` and challenge docs
- Poor error handling or unsafe defaults in scripts

## P2 - Nice to Improve

- Clarity improvements and readability enhancements
- Better consistency in terminology across workshop materials

## Review Comment Format

Use: `Priority | File | Issue | Impact | Suggested fix`.

Always verify audience separation: facilitator-only content must not appear in participant docs (`docs/audiences/participant/`).
