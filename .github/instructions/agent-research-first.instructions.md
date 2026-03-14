---
description: "Mandatory research-before-implementation requirements for all agents"
applyTo: "*"
---

# Agent Research Requirements

All agents must research this MicroHack repo before implementation.

## Required Checklist

- Confirm MicroHack intent in `README.md` and `AGENDA.md`.
- Confirm audience split in `site/src/content/docs/` (participant) and `facilitator/` (facilitator).
- Confirm challenge flow and dependencies in `site/src/content/docs/challenges/`.
- Confirm script impact in `scripts/` before changing automation.
- Confirm all referenced links and paths exist.

## Validation Gate

Before editing files, verify:

1. Target files exist and belong to the intended audience context.
2. Timing and scoring remain internally consistent across docs.
3. Facilitator-only content is not copied into participant docs.
4. Script changes keep safe defaults and clear usage guidance.

Proceed only when confidence is at least 80%.
If confidence is lower, gather more context or ask precise questions.
