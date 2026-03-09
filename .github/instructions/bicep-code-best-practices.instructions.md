---
description: "Infrastructure as Code best practices for optional Azure Bicep snippets in workshop materials"
applyTo: "**/*.bicep"
---

# Bicep Guidance for Workshop Context

This repository is workshop-first. Bicep files are optional supporting material.

## Rules

- Keep templates minimal and readable for learning scenarios.
- Use `@description` on parameters, variables, and outputs.
- Prefer secure defaults and avoid embedding credentials or secrets.
- Include only resources relevant to migration workshop exercises.
- Add comments only for non-obvious decisions.

## Validation

- Ensure parameter names are explicit and learner-friendly.
- Ensure examples align with challenge objectives and timing.
