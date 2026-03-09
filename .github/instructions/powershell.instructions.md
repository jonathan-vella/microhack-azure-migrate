---
description: "PowerShell cmdlet and scripting best practices for workshop automation"
applyTo: "**/*.ps1,**/*.psm1"
---

# PowerShell Standards

- Use approved verbs for function names and clear parameter names.
- Add validation for user inputs and file paths.
- Fail safely with clear error messages.
- Require confirmation for destructive operations.
- Keep output human-readable for workshop facilitators.

## Script Safety

- Avoid hardcoded credentials, tenant IDs, and subscription secrets.
- Use idempotent behavior where practical.
- Preserve scoring data integrity in leaderboard and scoring scripts.
