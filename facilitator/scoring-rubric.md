# Scoring Rubric

100-point scoring system aligned with Cloud Adoption Framework phases.

---

## Scoring Overview

| Challenge | Points | CAF Phase |
|-----------|--------|-----------|
| C1: Plan | 25 | Plan |
| C2: Appliance | 25 | Prepare |
| C3: Assessment | 20 | Execute |
| C4: Execute | 15 | Execute |
| C5: Curveball | 10 | Execute |
| C7: Presentation | 5 | All |
| **Total** | **100** | |
| Bonus | +15 | Excellence |

---

## Challenge 1: Plan (25 points)

**Deliverable**: Photographed whiteboard with assessment strategy and wave plan

| Criterion | Points | 0 (Missing) | 1-2 (Partial) | 3-4 (Good) | 5 (Excellent) |
|-----------|--------|-------------|---------------|------------|---------------|
| **Assessment approach defined** | 5 | No approach | Vague methodology | Clear method identified | Comprehensive with discovery + dependency + assessment |
| **Dependencies identified** | 5 | Not mentioned | Some awareness | Key dependencies noted | Detailed mapping with mitigation |
| **Wave prioritization complete** | 10 | No waves | Random grouping | Logical waves with some rationale | Well-justified waves using value/complexity matrix |
| **Rationale quality** | 5 | No explanation | Basic reasoning | Good justification | Business + technical reasons clearly articulated |

**Scoring Notes**:
- Look for the value/complexity matrix
- SQL database should have special consideration
- Monitoring can go early or late (either is valid if justified)
- Dependencies should influence wave groupings

---

## Challenge 2: Deploy Appliance (25 points)

**Deliverable**: Working Azure Migrate appliance with discovery started

| Criterion | Points | How to Verify |
|-----------|--------|---------------|
| Azure Migrate project created | 5 | Check Azure portal for project |
| Appliance registered | 5 | Appliance shows "Registered" status |
| Credentials configured | 5 | Hyper-V + Windows + Linux credentials visible |
| Discovery started | 5 | No errors, discovery status "Running" |
| 5 VMs discovered | 5 | All 5 ArcBox VMs appear in portal |

**Scoring Notes**:
- If VHD download was slow, score based on progress
- Partial credit for 3-4 VMs discovered
- If discovery running but VMs not yet visible, check appliance status

---

## Challenge 3: Assessment (20 points)

**Deliverable**: Assessment results documented/exported

| Criterion | Points | How to Verify |
|-----------|--------|---------------|
| VM assessment created | 5 | Assessment visible in Azure Migrate |
| SQL assessment created | 5 | SQL assessment visible |
| Readiness interpreted correctly | 5 | Team can explain ready/not ready status |
| Findings documented | 5 | Export file or notes captured |

**Scoring Notes**:
- Performance-based assessment preferred over as-is
- Team should understand confidence rating
- Cost estimates don't need to be perfect
- SQL discovery may be incomplete — that's OK

---

## Challenge 4: Execute (15 points)

**Deliverable**: Photographed whiteboard with migration strategy

| Criterion | Points | 0 (Missing) | 3 (Partial) | 5 (Excellent) |
|-----------|--------|-------------|-------------|---------------|
| **Tool selection justified** | 5 | Wrong tools or no justification | Correct tools, basic reasoning | Optimal tools with clear rationale |
| **Sequencing logical** | 5 | Random order | Mostly logical, minor issues | Dependencies respected, risk managed |
| **Rollback defined** | 5 | No rollback plan | Basic rollback mentioned | Clear triggers, procedures, authority |

**Scoring Notes**:
- Look for: Azure Migrate, ASR, DMS references
- SQL should have specific tool consideration
- Rollback should include: triggers, steps, timeline

---

## Challenge 5: Curveball (10 points)

**Deliverable**: Updated plan addressing GDPR requirement

| Criterion | Points | 0 (Missing) | 1-2 (Partial) | 3 (Excellent) |
|-----------|--------|-------------|---------------|---------------|
| **GDPR impact identified** | 3 | Not identified | Some servers flagged | All PII-handling servers correctly identified |
| **Plan adapted** | 4 | No changes | Partial updates | Comprehensive adaptation |
| **Data residency addressed** | 3 | Not mentioned | Region mentioned | Clear approach: region + backup + DR + monitoring |

**Scoring Notes**:
- SQL and Web servers definitely have PII
- Bonus thinking: logs, backups, monitoring data
- EU region selection should be specific

---

## Challenge 7: Presentation (5 points)

**Deliverable**: 8-minute chalk-talk with objection handling

| Criterion | Points | 0 (Poor) | 1 (Adequate) | 2 (Good) |
|-----------|--------|----------|--------------|----------|
| **Clear delivery** | 2 | Disorganized, over time | Mostly clear, minor issues | Well-organized, within time |
| **Objections handled** | 3 | Unable to address | Addressed with some gaps | Convincingly answered all 3 |

**Objection Scoring Guide**:

| Objection | 0 (Weak) | 1 (Acceptable) |
|-----------|----------|----------------|
| PaaS vs IaaS | No rationale | Clear reasoning for choice |
| Rollback | Vague steps | Specific procedure described |
| GDPR | Generic answer | Specific controls mentioned |

---

## Bonus Points (+15 max)

Award bonus points for exceptional work:

| Bonus | Points | Criteria |
|-------|--------|----------|
| Azure Arc integration | +5 | Detailed hybrid management strategy with Arc |
| Cost optimization insight | +5 | Specific savings identified (Hybrid Benefit, RIs, right-sizing) |
| Security hardening | +5 | Security controls beyond minimum (Private Endpoints, Defender, etc.) |

**Bonus Notes**:
- Bonus should be rare — truly exceptional work
- Maximum +5 per category
- Document why bonus was awarded

---

## Score Sheet Template

```
TEAM: _______________________

Challenge 1: Plan                          /25
  Assessment approach:      /5
  Dependencies:            /5
  Wave prioritization:     /10
  Rationale:               /5

Challenge 2: Appliance                     /25
  Project created:         /5
  Appliance registered:    /5
  Credentials configured:  /5
  Discovery started:       /5
  VMs discovered:          /5

Challenge 3: Assessment                    /20
  VM assessment:           /5
  SQL assessment:          /5
  Readiness interpreted:   /5
  Findings documented:     /5

Challenge 4: Execute                       /15
  Tool selection:          /5
  Sequencing:              /5
  Rollback:                /5

Challenge 5: Curveball                     /10
  Impact identified:       /3
  Plan adapted:            /4
  Data residency:          /3

Challenge 7: Presentation                  /5
  Clear delivery:          /2
  Objections:              /3

SUBTOTAL:                                  /100

Bonus:
  Arc integration:         /5
  Cost optimization:       /5
  Security hardening:      /5

BONUS TOTAL:                               /15

GRAND TOTAL:                               /115

Notes:
_________________________________
_________________________________
_________________________________
```

---

## Leaderboard Template

| Rank | Team | C1 | C2 | C3 | C4 | C5 | C7 | Bonus | Total |
|------|------|----|----|----|----|----|----|-------|-------|
| 🥇 | | | | | | | | | |
| 🥈 | | | | | | | | | |
| 🥉 | | | | | | | | | |
| 4 | | | | | | | | | |

---

## Scoring Tips

1. **Be consistent** — Use the same standards across teams
2. **Score during breaks** — Don't fall behind
3. **Partial credit is OK** — Most work deserves some points
4. **Document notes** — For debrief and disputes
5. **Celebrate creativity** — Novel approaches can earn bonus
