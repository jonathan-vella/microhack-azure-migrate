---
description: "Guidelines for creating high-quality Agent Skills for this workshop repository"
applyTo: "**/.github/skills/**/SKILL.md, **/.claude/skills/**/SKILL.md"
---

# Skill Authoring Standards

Skills in this repository must support workshop outcomes, not generic infra delivery.

## Scope Rules

- Focus on workshop content operations: challenge authoring, facilitator guidance, participant materials,
  scoring workflows, and documentation consistency.
- Keep utility skills (`git-commit`, `github-operations`, `make-skill-template`) optional and generic.
- Avoid assumptions about AVM-first, Bicep pipelines, or multi-step artifact factories.

## Required Sections in `SKILL.md`

- Purpose and trigger conditions
- Inputs required from repository context
- Output format and quality criteria
- Safety and audience-separation constraints
- Examples grounded in existing repo folders

## Quality Gate

A skill is valid only if examples reference real paths in this repository and preserve audience separation
between `docs/audiences/participant/` and `docs/audiences/facilitator/`.
