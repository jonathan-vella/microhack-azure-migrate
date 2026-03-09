---
description: "Guidelines for creating high-quality custom instruction files for GitHub Copilot"
applyTo: "**/*.instructions.md"
---

# Instruction Authoring Rules

- Keep each instruction file narrowly scoped and testable.
- Reference real paths and workflows that exist in this repository.
- Use clear `applyTo` patterns and avoid overbroad targeting when possible.
- Prefer constraints that improve safety, consistency, and workshop clarity.
- Remove stale assumptions whenever repository structure changes.
