---
name: challenge-guide-styler
description: Applies the workshop challenge template and visual polish consistently across challenge guides.
---

# Challenge Guide Styler

## Purpose and Trigger Conditions

Use this skill when creating or revising files in `site/src/content/docs/challenges/` that need consistent structure,
clear timeboxing, and polished participant-facing readability.

## Inputs Required From Repository Context

- `.github/skills/challenge-guide-styler/references/challenge-template.md`
- `README.md`
- `AGENDA.md`
- `site/src/content/docs/challenges/index.md`
- `site/src/content/docs/`
- `facilitator/scoring-rubric.md`

## Output Format and Quality Criteria

- Challenge documents include the required sections from the canonical template.
- Time, points, and progression remain consistent with workshop schedule and scoring.
- Language is concise, action-oriented, and deliverable-driven.
- Mermaid content (if present) is parser-safe and readable.

## Safety and Audience-Separation Constraints

- Do not copy facilitator-only content into participant challenge files.
- Do not reveal curveball details before intended challenge timing outside the challenge itself.
- Preserve fairness and scoring neutrality across teams.

## Examples

- Refresh challenge structure in `site/src/content/docs/challenges/challenge-1-plan.md` using
  `.github/skills/challenge-guide-styler/references/challenge-template.md`.
- Align challenge output expectations in `site/src/content/docs/challenges/challenge-4-execute.md` with
  `facilitator/scoring-rubric.md`.
- Normalize a challenge timeline in `site/src/content/docs/challenges/index.md` while keeping sequence and points intact.
