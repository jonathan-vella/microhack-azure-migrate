# Facilitator Materials

> **CONFIDENTIAL** — For microhack coaches and facilitators only.

| File | Description |
|---|---|
| [facilitator-guide.md](facilitator-guide.md) | Detailed schedule, block-by-block coaching notes, emergency procedures |
| [scoring-rubric.md](scoring-rubric.md) | 100-point WAF-aligned scoring criteria with rubric |
| [solution-reference.md](solution-reference.md) | Expected outputs, coaching tips, common mistakes |
| [curveball-script.md](curveball-script.md) | GDPR announcement script — do NOT reveal until 14:45! |
| [pre-deployment-guide.md](pre-deployment-guide.md) | Day-before setup: ArcBox deployment, RBAC, cost controls |
| [target-architecture.md](target-architecture.md) | Recommended post-migration Azure architecture |

## Quick Reference

### Scoring Workflow

Use [scoring-rubric.md](scoring-rubric.md) as the source of truth for all points and grading decisions.

1. Review each team's whiteboard photos and Azure portal artifacts.
2. Record scores using `scripts/Score-Team.ps1`.
3. Display the leaderboard using `scripts/Get-Leaderboard.ps1`.

### Curveball Timing

**14:45** — Announce the GDPR compliance requirement (see [curveball-script.md](curveball-script.md) for the full script).

### Emergency Contacts

| Issue | Action |
|---|---|
| Portal down | Use offline materials, extend time |
| ArcBox failure | Check Azure status; try restarting VMs |
| Team stuck | Direct help; skip design artefacts if needed |
| Running behind | Cut Challenge 6 short; preserve presentation time |
