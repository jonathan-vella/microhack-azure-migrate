---
description: "Standards for Copilot custom agent definition files"
applyTo: "**/*.agent.md"
---

# Agent Definition Standards

Use these rules when this repository introduces `.agent.md` files.

## Repository Alignment

- Define agents for workshop operations only.
- Include explicit boundaries for participant-facing vs facilitator-only outputs.
- Require references to existing folders (`docs/challenges/`, `docs/audiences/participant/`, `docs/audiences/facilitator/`, `scripts/`).

## Minimal Schema

Each agent definition should include:

- Mission and supported tasks
- Required context files
- Non-goals and constraints
- Output expectations and validation checks

Avoid broad platform-engineering or infrastructure-delivery assumptions.
