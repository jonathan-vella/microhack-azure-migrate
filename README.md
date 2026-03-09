# Azure Migration Workshop

> 1-Day Workshop: Discover, assess, and plan Azure migrations using hands-on
> labs and whiteboard design sessions, aligned to the Cloud Adoption Framework.

## Overview

This repository contains workshop documentation, facilitator guides, and
governance scripts. End-user guidance is published at
[jonathan-vella.github.io/microhack-azure-migrate](https://jonathan-vella.github.io/microhack-azure-migrate/).

| | |
|---|---|
| This repo (microhack-azure-migrate) | Workshop docs, facilitator guides, scoring rubric, governance scripts |

Teams work through 7 challenges covering the full Azure migration lifecycle —
from discovery and assessment through to cost optimisation and a final
chalk-talk presentation — all using Azure Migrate and
[ArcBox for IT Pros](https://jumpstart.azure.com/azure_jumpstart_arcbox/ITPro)
as the simulated on-premises environment.

What you'll experience:

- Azure Migrate appliance deployment and discovery
- VM and SQL readiness assessments
- Migration wave planning with dependency mapping
- A mid-event "curveball" that tests your adaptability
- Cost optimisation, governance design, and Azure Arc
- A competitive team presentation with live objection handling

## Learning Objectives

1. Discover on-premises workloads using Azure Migrate appliance
2. Assess migration readiness for VMs and SQL databases
3. Design a migration strategy using CAF Migrate methodology
4. Plan migration waves with proper sequencing and dependencies
5. Optimise for cost, governance, and hybrid scenarios

## The Scenario: Contoso Bakery

A Dublin-based artisan bakery (65 employees, €10M revenue) needs to migrate
its aging 5-server estate to Azure. Your team will assess the environment,
design a CAF-aligned migration strategy, and present a complete plan — all
within a single day.

## Hackathon Day Schedule

| Time | Block | Duration | Description |
|---|---|---|---|
| 10:00–10:30 | Intro | 30 min | Welcome, setup, scenario intro |
| 10:30–11:15 | Challenge 1 | 45 min | Plan & Design (WDS) |
| 11:15–12:30 | Challenge 2 | 75 min | Deploy Appliance (Hands-on) |
| 12:30–13:15 | Lunch | 45 min | Break (discovery runs) |
| 13:15–14:00 | Challenge 3 | 45 min | Assessment (Hands-on) |
| 14:00–14:30 | Challenge 4 | 30 min | Execute (WDS) |
| 14:30–14:45 | Break | 15 min | Rest & recharge |
| 14:45–15:15 | Challenge 5 | 30 min | Curveball (WDS) |
| 15:15–16:00 | Challenge 6 | 45 min | Optimise (WDS) |
| 16:00–16:45 | Challenge 7 | 45 min | Presentation |
| 16:45–17:00 | Wrap-up | 15 min | Leaderboard, cleanup, close |

## Repository Structure

```
docs/                   # GitHub Pages site (just-the-docs theme)
facilitator/            # Facilitator guide, scoring rubric, solution reference
scripts/                # Workshop PowerShell scripts
```

## Markdown Checks

This repository uses `markdownlint-cli2` for Markdown linting and `lefthook`
for Git hooks.

- Run `npm install` once after cloning to install dependencies and register the
  `pre-commit` hook.
- Run `npm run lint:md` to lint all Markdown files in the repository.

## Sensitive-Content Review Checklist

Before merging changes that involve permissions, policies, costs, cleanup, or
real Azure actions, apply this checklist:

- **Azure roles and permissions**: Are stated role requirements accurate?
- **Subscription model**: Does the change maintain one-subscription-per-team?
- **Cost and quota**: Are budget figures, SKU recommendations, and quota
  guidance still accurate?
- **Cleanup and post-event**: Are verification steps included?
- **Secret handling**: Does the change avoid embedding real secrets?
- **Script safety**: Do script changes preserve `-WhatIf` support and
  idempotent behaviour?
- **Scoring accuracy**: Does the change keep scoring language consistent with
  the rubric?
- **Terminology**: Does the change follow the
  [glossary](docs/reference/glossary.md)?

## Getting Started

1. Read [Getting Started](https://jonathan-vella.github.io/microhack-azure-migrate/getting-started/)
   for pre-work, setup, and ArcBox environment details.
2. Review [Workshop Prep](https://jonathan-vella.github.io/microhack-azure-migrate/getting-started/workshop-prep/)
   for the Contoso Bakery scenario brief and team roles.
3. Follow the challenges in order starting from
   [Challenge 1](https://jonathan-vella.github.io/microhack-azure-migrate/challenges/challenge-1-plan/).

## Quick Links

| Resource | Description |
|---|---|
| [Workshop Docs](https://jonathan-vella.github.io/microhack-azure-migrate/) | Published setup and guidance for participants |
| [Agenda](https://jonathan-vella.github.io/microhack-azure-migrate/about/agenda/) | Full schedule with timing |
| [Quick Reference Card](https://jonathan-vella.github.io/microhack-azure-migrate/guides/quick-reference-card/) | Printable one-page cheat sheet |
| [Scoring Rubric](facilitator/scoring-rubric.md) | WAF-aligned evaluation criteria |
| [Troubleshooting](https://jonathan-vella.github.io/microhack-azure-migrate/reference/troubleshooting/) | Common issues and fixes |

## License

This project is provided for educational and workshop use. See the repository
for license details.

**Ready to begin?** Complete the [Pre-work: Azure 101](docs/challenges/00-azure-101.md), then head to the [Agenda](AGENDA.md) for the detailed schedule.
