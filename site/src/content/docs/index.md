---
title: Azure Migration MicroHack
description: "1-day hands-on MicroHack: Discover, assess, and plan Azure migrations using Azure Migrate and the Cloud Adoption Framework"
template: splash
hero:
  tagline: "A 1-day team challenge — discover, assess, and plan Azure migrations using Azure Migrate, the Cloud Adoption Framework, and Azure Arc."
  actions:
    - text: Get Started
      link: getting-started/
      icon: right-arrow
    - text: View Challenges
      link: challenges/
      icon: open-book
      variant: minimal
banner:
  content: "7 challenges &middot; 100 points &middot; 1 day &middot; Who will top the leaderboard?"
---

## What You'll Do

<div class="feature-grid">
<div class="feature">
<strong>🔍 Discover</strong>
<p>Deploy the Azure Migrate appliance and discover on-premises VMs and SQL databases running in ArcBox.</p>
</div>
<div class="feature">
<strong>📋 Assess</strong>
<p>Evaluate migration readiness, analyse dependencies, and generate Azure suitability assessments.</p>
</div>
<div class="feature">
<strong>🧩 Design</strong>
<p>Plan migration waves, map dependencies, and align your strategy to the Cloud Adoption Framework.</p>
</div>
<div class="feature">
<strong>⚡ Adapt</strong>
<p>Respond to a mid-event curveball — new compliance requirements that change your plan.</p>
</div>
</div>

## Schedule Overview

```mermaid
gantt
  title MicroHack Day (10:00 – 17:00)
  dateFormat HH:mm
  axisFormat %H:%M
  section Morning
      Welcome & Azure 101       :active, 10:00, 30m
      C1 Plan & Design          :10:30, 45m
      C2 Deploy Appliance       :11:15, 75m
      Lunch                     :crit, 12:30, 45m
  section Afternoon
      C3 Assessment             :13:15, 45m
      C4 Execute                :14:00, 30m
      Break                     :crit, 14:30, 15m
      C5 Curveball              :14:45, 30m
      C6 Optimize               :15:15, 45m
  section Presentations
      C7 Presentations          :16:00, 45m
      Wrap-up                   :16:45, 15m
```

<details>
<summary>Text alternative: Schedule overview</summary>

**Morning**: Welcome & Azure 101 (10:00–10:30) → C1 Plan & Design
(10:30–11:15) → C2 Deploy Appliance (11:15–12:30) → Lunch
(12:30–13:15)

**Afternoon**: C3 Assessment (13:15–14:00) → C4 Execute (14:00–14:30) → Break
(14:30–14:45) → C5 Curveball (14:45–15:15) → C6 Optimize (15:15–16:00)

**Presentations**: C7 Presentations (16:00–16:45) → Wrap-up (16:45–17:00)

</details>

## Key Facts

| Aspect | Details |
|---|---|
| **Duration** | 1 day (7 hours: 10:00–17:00) |
| **Challenges** | 7 challenges + pre-work across the full migration lifecycle |
| **Scoring** | 100 base points + up to 15 bonus points |
| **Teams** | 4 members per team (self-organising) |
| **Format** | Hands-on labs + whiteboard design sessions |
| **Lab Environment** | [Azure Jumpstart ArcBox for IT Pros](https://jumpstart.azure.com/azure_jumpstart_arcbox/ITPro) |

## The Scenario: Contoso Bakery

A Dublin-based food & beverage company (65 employees, €10M revenue) needs to
migrate its ageing on-premises infrastructure to Azure. Their IT team of 3 is
stretched thin, hardware refresh is overdue, and they need to hit GDPR
compliance along the way.

Your team will assess Contoso's 5-server estate running in ArcBox, design a
migration strategy, and present a complete plan — all within a single day.

| Phase | Points | Focus |
|---|---|---|
| Challenges 1–2 | 50 | Plan & Prepare (CAF) |
| Challenges 3–5 | 45 | Execute & Adapt (CAF) |
| Challenge 6 | — | Optimise (CAF) |
| Challenge 7 | 5 | Present & Synthesise |

## Quick Entry Points

| I need to... | Go to |
|---|---|
| **Check if I'm ready** | [Setup & Pre-work](getting-started/setup/) |
| **Read the scenario** | [Workshop Prep](getting-started/workshop-prep/) |
| **Start the challenges** | [Challenge 1: Plan](challenges/challenge-1-plan/) |
| **Fix something broken** | [Troubleshooting](reference/troubleshooting/) |

## MicroHack Sections

- **[Getting Started](getting-started/)** — Set up your environment, check prerequisites, and learn the scenario
- **[Challenges](challenges/)** — 7 challenges — from planning through to final presentations
- **[Guides](guides/)** — Hints & tips and a printable quick-reference card
- **[Reference](reference/)** — Glossary, troubleshooting, and governance scripts
- **[About](about/)** — Agenda, event details, and feedback
