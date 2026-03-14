---
title: "Challenge 5: Curveball"
description: "Adapt your migration plan to a surprise mid-project requirement"
sidebar:
  order: 6
---


# Challenge 5: Curveball

## Challenge Snapshot

| Field | Value |
|---|---|
| Duration | 30 minutes |
| Type | Whiteboard Design Session |
| Points | 10 |
| Deliverable | Updated migration architecture and GDPR compliance approach |

## Objective

Adapt your migration design to a late-stage compliance requirement and document a defensible GDPR approach.

---

## The Business Challenge

Late-breaking business constraints can change migration plans mid-stream. Your team must rapidly assess impact,
update architecture choices, and justify decisions with compliance-first reasoning.

---

## Prerequisites

Before starting this challenge, ensure:

- [ ] Challenge 4 outputs are complete and available
- [ ] Team has access to current architecture and migration plan
- [ ] Facilitator has announced the curveball at 14:45

---

### ⚠️ STOP — Wait for Facilitator Announcement

Do not read beyond this point until your facilitator announces the curveball at **14:45**.

---

<details>
<summary>🔒 CLICK TO REVEAL CURVEBALL (Only after facilitator announcement)</summary>

---

### 📢 BREAKING NEWS FROM CONTOSO

> **From**: IT Manager, Contoso Bakery
> **To**: Migration Team
> **Subject**: URGENT — Data Compliance Requirement
> **Priority**: High
>
> Team,
>
> I've just concluded a meeting with our Legal and Compliance departments regarding our upcoming Azure migration.
>
> **Effective immediately**, all customer data, financial records, and personally identifiable information (PII) must remain within the **European Union** to comply with GDPR requirements.
>
> This includes:
>
> - Customer database records
> - Transaction logs
> - User authentication data
> - Any backups or replicas of the above
>
> Please update your migration plans accordingly. I need confirmation that our architecture addresses this requirement before we can proceed.
>
> Regards,
> Chief Information Security Officer
> Contoso Bakery

---

### Curveball Details

Your migration plan just got more complicated. You need to:

1. **Identify impacted workloads** — Which servers handle GDPR-covered data?
2. **Update target regions** — Ensure EU data residency
3. **Review your architecture** — Any changes needed?
4. **Document compliance approach** — How will you demonstrate compliance?

---

## Your Tasks

### Part A: Impact Analysis (10 min)

Review your servers and identify which ones handle GDPR-covered data:

| Server | Handles Customer Data? | Handles PII? | GDPR Impact |
|--------|----------------------|--------------|-------------|
| ArcBox-Win2K22 (App Server) | Yes/No | Yes/No | High/Medium/Low |
| ArcBox-Win2K25 (File Server) | Yes/No | Yes/No | High/Medium/Low |
| ArcBox-SQL (Database) | Yes/No | Yes/No | High/Medium/Low |
| ArcBox-Ubuntu-01 (Web Server) | Yes/No | Yes/No | High/Medium/Low |
| ArcBox-Ubuntu-02 (Monitoring) | Yes/No | Yes/No | High/Medium/Low |

**Guiding Questions**:

- Which servers definitely need to be in an EU region?
- Which servers could potentially remain in a non-EU region?
- Are there any data flows between servers you need to consider?

---

### Part B: Architecture Updates (10 min)

Update your migration plan to address GDPR:

#### Target Region Changes

| Server | Original Target | New Target | Reason |
|--------|-----------------|------------|--------|
| ArcBox-SQL | [your original choice] | EU region (e.g., West Europe) | Customer data |
| ... | | | |

#### Additional Considerations

**Data Replication**:

- If you planned for multi-region, does replication cross EU boundaries?
- Azure Site Recovery — where are secondary replicas?

**Backup Storage**:

- Where will backups be stored?
- Are geo-redundant storage (GRS) targets in EU?

**Network Traffic**:

- Does data flow through non-EU regions?
- Any third-party services outside EU?

**Deliverable**: Updated architecture diagram on whiteboard

---

### Part C: Compliance Documentation (10 min)

Document how you'll address GDPR requirements:

#### Compliance Checklist

| Requirement | How Addressed |
|-------------|---------------|
| Data residency in EU | All PII stored in [region] |
| Data encryption at rest | Azure Storage encryption / SQL TDE |
| Data encryption in transit | TLS 1.2+ for all connections |
| Access controls | Azure RBAC, JIT access, PIM |
| Audit logging | Azure Monitor, Log Analytics |
| Data subject rights (DSAR) | [Your approach] |
| Breach notification | Microsoft Defender for Cloud alerts |

#### Azure Services for Compliance

| Service | Purpose |
|---------|---------|
| **Azure Policy** | Enforce allowed regions |
| **Microsoft Defender for Cloud** | Compliance dashboard |
| **Microsoft Purview** | Data discovery and classification |
| **Azure Key Vault** | Key management (EU region) |
| **Private Endpoints** | Keep data off public internet |

**Deliverable**: Compliance approach documented on whiteboard

---

## Expected Deliverables

Add to your existing whiteboard:

1. ✅ **GDPR Impact Analysis**
   - Servers identified by data sensitivity
   - Data flows documented

2. ✅ **Updated Target Architecture**
   - New target regions (EU)
   - Backup/DR considerations

3. ✅ **Compliance Approach**
   - How each requirement is addressed
   - Azure services to use

📸 **Update your whiteboard photo!**

---

## Success Criteria (10 Points)

| Criterion | Points | Description |
|-----------|--------|-------------|
| GDPR impact identified | 3 | Correctly assessed which servers handle PII |
| Plan adapted | 4 | Target regions updated, architecture adjusted |
| Data residency addressed | 3 | Clear approach to keeping data in EU |
| **Total** | **10** | |

---

## 💡 Tip

💡 **SQL database is the obvious one** — But don't forget logs and backups!

💡 **Check your monitoring server** — Does it collect PII in logs?

💡 **Azure Policy can help** — Deny deployments outside allowed regions

💡 **Consider Azure Arc** — For workloads that must stay on-premises

💡 **Document your decisions** — Auditors will ask "why" later

---

### Reference: EU Azure Regions

| Region Name | Region Code | Notes |
|-------------|-------------|-------|
| West Europe | westeurope | Netherlands |
| North Europe | northeurope | Ireland |
| France Central | francecentral | Paris |
| France South | francesouth | Marseille |
| Germany West Central | germanywestcentral | Frankfurt |
| Switzerland North | switzerlandnorth | Zurich |
| Norway East | norwayeast | Oslo |
| Sweden Central | swedencentral | Gävle |
| UK South | uksouth | London |
| UK West | ukwest | Cardiff |

> ⚠️ Note: UK regions may have different considerations post-Brexit depending on your specific requirements.

---

### Reflection Questions

- How did this surprise change your perception of migration complexity?
- What would you have done differently in Challenge 1 if you knew this was coming?
- How common are mid-project compliance surprises in real migrations?

---

### What Just Happened?

Welcome to the real world! Migration projects frequently encounter:

- New compliance requirements discovered mid-project
- Changes in the legal or regulatory landscape
- Stakeholders who remember requirements late
- Audit findings that force architecture changes

The ability to adapt your plan is just as important as creating it!

---

## ⚠️ Watch out

- Do not assume EU compliance is only about primary data stores; include logs, backups, and replicas.
- Revalidate DR and cross-region settings after architecture updates.

---

## Next Step

Proceed immediately to [Challenge 6: Optimise](../challenge-6-optimize/) to finalise your design with cost optimisation and governance.

</details>
