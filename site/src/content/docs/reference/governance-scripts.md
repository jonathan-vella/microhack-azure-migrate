---
title: Governance Scripts
description: "PowerShell scripts for workshop scoring, leaderboard, and cleanup"
sidebar:
  order: 3
---


# MicroHack Scripts

PowerShell scripts for workshop automation. These are located in the `scripts/` directory at the repository root.

:::note
These scripts are for **facilitators only**. Participants do not need to run them.
:::

---

## Script Reference

| Script | Purpose | When to Use |
|---|---|---|
| `Score-Team.ps1` | Record team scores | During workshop |
| `Get-Leaderboard.ps1` | Display team rankings | During workshop |
| `Cleanup-Resources.ps1` | Delete all workshop resources | After workshop |

---

## During the MicroHack

### Score a Team

```powershell
.\scripts\Score-Team.ps1 -TeamName "team1" -Challenge "C1" -Score 20
```

Parameters:

| Parameter | Required | Description |
|---|---|---|
| `-TeamName` | Yes | Team identifier |
| `-Challenge` | Yes | Challenge code (C0–C7 or Bonus) |
| `-Score` | Yes | Points awarded (0–30) |
| `-Notes` | No | Optional scoring notes |
| `-ScoreFile` | No | Path to JSON score file (defaults to `scores.json`) |

Scores are capped at the maximum for each challenge.

### Display Leaderboard

```powershell
.\scripts\Get-Leaderboard.ps1
```

Shows real-time rankings with medals for top 3 teams. Use `-Detailed` for breakdown by challenge.

---

## After the MicroHack

### Cleanup Resources

```powershell
.\scripts\Cleanup-Resources.ps1
```

Deletes ArcBox and Azure Migrate resource groups for all teams. Supports `-WhatIf` to preview deletions before committing.

:::warning
Always run with `-WhatIf` first to preview what will be deleted.
:::

---

## Troubleshooting

| Issue | Solution |
|---|---|
| `command not found: pwsh` | PowerShell not installed — install PowerShell 7+ |
| `az: command not found` | Azure CLI not installed — install via `brew install azure-cli` or equivalent |
| Permission errors | Ensure Owner or Contributor role on the subscription |
