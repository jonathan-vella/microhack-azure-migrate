---
title: "Challenge 1: Plan"
description: "Design assessment strategy and migration wave plan"
sidebar:
  order: 2
---


# Challenge 1: Plan

## Challenge Snapshot

| Field | Value |
|---|---|
| Duration | 45 minutes |
| Type | Whiteboard Design Session |
| Points | 25 |
| Deliverable | Whiteboard assessment strategy and migration wave plan |

## Objective

Design a comprehensive assessment and migration planning strategy for Contoso Bakery using the Cloud Adoption Framework methodology.

---

## The Business Challenge

Contoso Bakery has engaged your team to plan their migration from on-premises infrastructure to Azure. Before any migration can begin, you need to:

1. **Understand the current environment** — What workloads exist and how are they connected?
2. **Assess readiness** — Which workloads are ready for Azure?
3. **Prioritize the migration** — What moves first, and why?

Your simulated on-premises environment (ArcBox) contains:

| Server | OS | Role | Notes |
|--------|-----|------|-------|
| ArcBox-Win2K22 | Windows Server 2022 | Application Server | Hosts internal LOB app |
| ArcBox-Win2K25 | Windows Server 2025 | File Server | Department file shares |
| ArcBox-SQL | Windows + SQL Server | Database Server | Critical ERP database |
| ArcBox-Ubuntu-01 | Ubuntu 22.04 | Web Server | Customer-facing portal |
| ArcBox-Ubuntu-02 | Ubuntu 22.04 | Monitoring | Nagios/Grafana stack |

---

## Prerequisites

Before starting this challenge, ensure:

- [ ] Azure 101 pre-work is complete
- [ ] Team roles are assigned (facilitator, scribe, presenter, reviewer)
- [ ] Whiteboard or flip chart is available

---

## Your Tasks

Work with your team to design the **assessment and wave planning strategy** on your whiteboard.

### Part A: Assessment Strategy (20 min)

**Guiding Questions:**

1. **Discovery Approach**
   - How will you discover all workloads in the environment?
   - What tools and methods will you use?
   - What information do you need to collect?

2. **Dependency Mapping**
   - How will you identify dependencies between servers?
   - What happens if you miss a critical dependency?
   - Agent-based vs. agentless analysis — which approach and why?

3. **Assessment Criteria**
   - What factors determine if a workload is "ready" for Azure?
   - How will you categorize workloads (ready, ready with conditions, not ready)?
   - What blockers might you encounter?

**Deliverable**: Whiteboard diagram showing your assessment approach

---

### Part B: Migration Wave Planning (25 min)

Use the **Value vs. Complexity Matrix** to prioritize workloads:

```text
                    HIGH COMPLEXITY
                          │
    Strategic             │           Challenging
    Investments           │           (Plan Carefully)
                          │
    ──────────────────────┼──────────────────────
                          │
    Quick Wins            │           Fill-ins
    (Migrate First)       │           (Low Priority)
                          │
                    LOW COMPLEXITY
    LOW VALUE ────────────┼──────────────── HIGH VALUE
```

**Guiding Questions:**

1. **Prioritization**
   - Which workloads are quick wins (high value, low complexity)?
   - Which require more planning (high complexity)?
   - What order makes the most sense?

2. **Wave Design**
   - How will you group workloads into migration waves?
   - What dependencies force workloads into the same wave?
   - How long should each wave take?

3. **Risk Mitigation**
   - What's your approach for the SQL database (typically highest risk)?
   - How do you handle the customer-facing web server?
   - What if a wave fails — what's your fallback?

**Deliverable**: Whiteboard showing migration waves with workload assignments

---

### Part C: Success Criteria Definition (15 min)

**Guiding Questions:**

1. **Migration Success**
   - How will you know the migration succeeded?
   - What metrics will you track?
   - Who signs off on completion?

2. **Validation Approach**
   - How will you test workloads post-migration?
   - What's your rollback trigger?
   - How long is the validation period?

**Deliverable**: List of success criteria for migration validation

---

## Expected Deliverables

By the end of this challenge, your whiteboard should show:

1. ✅ **Assessment Approach Diagram**
   - Discovery method
   - Dependency mapping approach
   - Assessment criteria

2. ✅ **Migration Wave Plan**
   - Value/Complexity matrix with workloads placed
   - Wave groupings with rationale
   - Timeline estimate

3. ✅ **Success Criteria**
   - Validation checklist
   - Rollback triggers
   - Sign-off process

📸 **Take a photo of your whiteboard** — You'll need it for your presentation!

---

### 📝 Fill-in-the-Blanks Template

Use this template to capture your team's decisions:

```markdown
### Team: ________________

### Assessment Strategy
- Discovery tool: _______________________________
- Dependency mapping approach: ☐ Agent-based  ☐ Agentless
- Data collection duration: ____________________

### Value vs. Complexity Matrix Placement

| Workload | Value (1-5) | Complexity (1-5) | Quadrant |
|----------|-------------|------------------|----------|
| ArcBox-Win2K22 | ___ | ___ | ________________ |
| ArcBox-Win2K25 | ___ | ___ | ________________ |
| ArcBox-SQL | ___ | ___ | ________________ |
| ArcBox-Ubuntu-01 | ___ | ___ | ________________ |
| ArcBox-Ubuntu-02 | ___ | ___ | ________________ |

### Migration Waves

| Wave | Workloads | Duration | Business Justification |
|------|-----------|----------|------------------------|
| 1 | ________________________ | _______ | ________________________ |
| 2 | ________________________ | _______ | ________________________ |
| 3 | ________________________ | _______ | ________________________ |

### Key Dependencies Identified
1. ________________________________________________
2. ________________________________________________
3. ________________________________________________

### Success Criteria
- ☐ ____________________________________________
- ☐ ____________________________________________
- ☐ ____________________________________________

### Rollback Triggers
- ________________________________________________
- ________________________________________________
```

---

## Success Criteria (25 Points)

| Criterion | Points | Description |
|-----------|--------|-------------|
| Assessment approach defined | 5 | Clear discovery and assessment methodology |
| Dependencies identified | 5 | Method for mapping workload dependencies |
| Wave prioritization complete | 10 | Logical grouping with clear rationale |
| Rationale quality | 5 | Decisions are justified with business/technical reasons |
| **Total** | **25** | |

---

## 💡 Tip

💡 **Start with business impact** — Which workloads matter most to Contoso?

💡 **Think about dependencies** — The SQL database likely has apps that depend on it

💡 **Non-production first** — Consider migrating monitoring/dev environments before production

💡 **Include one complex workload early** — Learn lessons before migrating everything

---

### Reference: CAF Migrate Phases

```text
┌─────────┐   ┌─────────┐   ┌─────────┐   ┌──────────┐   ┌─────────────┐
│  PLAN   │ → │ PREPARE │ → │ EXECUTE │ → │ OPTIMIZE │ → │ DECOMMISSION│
└─────────┘   └─────────┘   └─────────┘   └──────────┘   └─────────────┘
     ↑
  YOU ARE HERE
```

---

## ⚠️ Watch out

- Avoid over-optimising wave design without validating dependencies.
- Keep migration rationale evidence-based, not assumption-only.

---

### Reflection Questions

After completing this challenge, consider:

- How did your team's discussion reveal different perspectives?
- What assumptions did you have to make due to limited information?
- How would real dependency data from Azure Migrate change your plan?

---

## Next Step

After your wave plan is complete and photographed, proceed to [Challenge 2: Deploy Appliance](../challenge-2-appliance/) to start discovering the actual environment.
