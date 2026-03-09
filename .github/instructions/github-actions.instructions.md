---
description: "Project-specific standards for GitHub Actions workflows in this repository"
applyTo: ".github/workflows/*.yml,.github/workflows/*.yaml"
---

# GitHub Actions Standards

- Keep workflows minimal and tied to repository needs.
- Use least-privilege permissions for jobs and tokens.
- Validate markdown links and script syntax where practical.
- Avoid adding deployment workflows unless explicitly required by workshop operations.
- Document purpose and trigger conditions at the top of each workflow.
