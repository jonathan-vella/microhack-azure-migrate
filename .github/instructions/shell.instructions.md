---
description: "Shell scripting best practices and conventions"
applyTo: "**/*.sh"
---

# Shell Standards

- Use `set -euo pipefail` for robust scripts where appropriate.
- Quote variable expansions to avoid word-splitting bugs.
- Validate required tools and inputs before execution.
- Provide clear usage/help text for workshop operators.
- Avoid destructive defaults.
