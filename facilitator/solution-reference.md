# Solution Reference

Expected outputs and coaching talking points for facilitators.

> ⚠️ **CONFIDENTIAL** — Do not share with participants.

---

## Challenge 1: Plan — Expected Outputs

### Assessment Strategy

**Good Answer**:
- Use Azure Migrate appliance for agentless discovery
- Enable agentless dependency mapping
- Add server credentials for software inventory
- Run for at least 1 day before creating performance-based assessments

**Great Answer** (bonus-worthy):
- Combine Azure Migrate with manual interviews
- Document applications running on each server
- Identify business owners for validation
- Plan for dependency visualization workshop

### Wave Plan

**Recommended Wave Structure**:

| Wave | Servers | Duration | Rationale |
|------|---------|----------|-----------|
| **Wave 1: Pilot** | Ubuntu-02 (Monitoring) | Week 1 | Low risk, learn process |
| **Wave 2: Data Tier** | ArcBox-SQL | Week 2-3 | Critical, needs extra testing |
| **Wave 3: App Tier** | Win2K22 (App), Win2K25 (Files) | Week 3-4 | Depends on SQL |
| **Wave 4: Web Tier** | Ubuntu-01 (Web) | Week 4-5 | Customer-facing, last |

**Why Monitoring First?**:
- Low business impact if issues occur
- Team learns the process
- Validates connectivity and procedures

**Why SQL Before App?**:
- App servers depend on database
- SQL migration is most complex
- Better to discover issues early

### Dependency Map

```
Ubuntu-01 (Web) ──→ Win2K22 (App) ──→ ArcBox-SQL (Database)
                         ↑
                    Win2K25 (Files)?  (may be independent)
                         
Ubuntu-02 (Monitoring) ──→ All servers (collects metrics)
```

---

## Challenge 2: Appliance — Key Steps

### Quick Reference

| Step | Expected Time | Common Issues |
|------|---------------|---------------|
| Create Migrate project | 5 min | Subscription filter wrong |
| Generate key | 2 min | Forgot to copy key |
| Download VHD | 10-15 min | Slow network |
| Import to Hyper-V | 5 min | Wrong virtual switch |
| Configure appliance | 5 min | Can't access config manager |
| Register with Azure | 5 min | Pop-up blocked, wrong key |
| Add credentials | 10 min | Wrong password |
| Start discovery | 5 min | Host validation fails |

### Troubleshooting Quick Fixes

| Issue | Fix |
|-------|-----|
| Config manager inaccessible | Use IP from Hyper-V console, check port 44368 |
| Registration fails | Regenerate key, check Application Developer role |
| Host validation fails | Run WinRM prep script, verify credentials |
| VMs not discovered | Wait longer, check nested VMs are running |

---

## Challenge 3: Assessment — Expected Results

### Azure VM Assessment

**Expected Readiness**:

| Server | Expected Status | Notes |
|--------|-----------------|-------|
| ArcBox-Win2K22 | ✅ Ready | Standard Windows VM |
| ArcBox-Win2K25 | ✅ Ready | Windows Server 2025 supported |
| ArcBox-SQL | ✅ Ready (with conditions) | May show SQL-specific considerations |
| ArcBox-Ubuntu-01 | ✅ Ready | Standard Ubuntu |
| ArcBox-Ubuntu-02 | ✅ Ready | Standard Ubuntu |

### Recommended Azure VM Sizes

| Server | Likely Recommendation | Reasoning |
|--------|----------------------|-----------|
| ArcBox-Win2K22 | D2s_v5 or D4s_v5 | App server, moderate load |
| ArcBox-Win2K25 | D2s_v5 | File server, storage-focused |
| ArcBox-SQL | D4s_v5 or D8s_v5 | Database, memory important |
| ArcBox-Ubuntu-01 | D2s_v5 | Web server |
| ArcBox-Ubuntu-02 | B2s or D2s_v5 | Monitoring, less demanding |

### Azure SQL Assessment

**Expected Recommendation**:
- **Azure SQL MI** — If workload is compatible
- **SQL on Azure VM** — If MI has limitations
- Check for compatibility issues, deprecated features

---

## Challenge 4: Execute — Expected Outputs

### Tool Selection

| Server | Recommended Tool | Migration Type | Downtime |
|--------|------------------|----------------|----------|
| ArcBox-Win2K22 | Azure Migrate: Server Migration | Agentless | 1-2 hours |
| ArcBox-Win2K25 | Azure Migrate: Server Migration | Agentless | 1-2 hours |
| ArcBox-SQL | Azure Migrate: Database Migration | Online | Near-zero |
| ArcBox-Ubuntu-01 | Azure Migrate: Server Migration | Agentless | 1-2 hours |
| ArcBox-Ubuntu-02 | Azure Migrate: Server Migration | Agentless | 1-2 hours |

### Rollback Strategy

**Good Answer**:
```
Rollback Triggers:
- Application error rate > 5%
- Response time > 3x baseline
- Data integrity issue detected

Rollback Procedure:
1. Stop application in Azure
2. Update DNS to point to on-prem
3. Verify on-prem functionality
4. Communicate to stakeholders
5. Post-mortem analysis

Timeline:
- Keep source running for 7 days post-migration
- After 7 days, rollback no longer available
```

---

## Challenge 5: Curveball — Expected Response

### Impact Analysis

| Server | PII? | Customer Data? | GDPR Impact |
|--------|------|----------------|-------------|
| ArcBox-Win2K22 | Yes | Likely (app logic) | High |
| ArcBox-Win2K25 | Maybe | Possible (files) | Medium |
| ArcBox-SQL | Yes | Yes (database) | **Critical** |
| ArcBox-Ubuntu-01 | Yes | Yes (sessions) | High |
| ArcBox-Ubuntu-02 | Maybe | Logs may contain | Medium |

### Required Changes

1. **Target Region**: All EU (West Europe or North Europe)
2. **Backup Storage**: LRS or ZRS in EU (not GRS if it crosses boundaries)
3. **Disaster Recovery**: Secondary site in EU
4. **Log Analytics**: Workspace in EU region
5. **Azure Policies**: Deny non-EU deployments

### Compliance Controls

| Control | Azure Service |
|---------|---------------|
| Data encryption at rest | Azure Storage encryption, SQL TDE |
| Data encryption in transit | TLS 1.2+ enforced |
| Access control | Azure RBAC, Conditional Access |
| Audit logging | Azure Monitor, Activity Log |
| Data classification | Microsoft Purview |
| Breach detection | Microsoft Defender for Cloud |

---

## Challenge 6: Optimize — Expected Outputs

### Cost Estimate (Rough)

| Category | Monthly Estimate |
|----------|------------------|
| Compute (5 VMs) | €800-1,200 |
| Storage | €100-200 |
| Networking | €50-100 |
| Monitoring | €100-150 |
| Backup | €50-100 |
| **Total** | **€1,100-1,750** |

### Optimization Opportunities

| Strategy | Potential Savings |
|----------|-------------------|
| Azure Hybrid Benefit (Windows) | 20-40% on Windows VMs |
| Azure Hybrid Benefit (SQL) | 30-55% on SQL |
| 1-year Reserved Instance | 20-30% |
| 3-year Reserved Instance | 40-60% |
| Right-sizing | 10-30% |
| Auto-shutdown (dev/test) | 50-70% |

### Governance Structure

**Good Answer**:
```
Management Groups:
├── Contoso Bakery Root
    ├── Platform
    │   ├── Identity
    │   └── Management
    └── Landing Zones
        ├── Production
        └── Non-Production

Key Policies:
- Allowed locations: EU only
- Required tags: CostCenter, Environment
- Allowed VM SKUs: Exclude expensive series
- Require HTTPS for storage
- Enable Defender for Cloud
```

---

## Challenge 7: Presentation — Objection Responses

### Objection 1: PaaS vs IaaS

**Strong IaaS Answer**:
> "We recommend SQL on Azure VM for this initial migration because:
> 1. It's the lowest-risk approach — exact feature parity with on-prem
> 2. Contoso Bakery's IT team is familiar with SQL Server management
> 3. We identified [specific feature] that's not yet in SQL MI
> 
> However, we've documented SQL MI as a future optimization target once the migration is stable."

**Strong PaaS Answer**:
> "We recommend Azure SQL Managed Instance because:
> 1. Reduced operational overhead — no patching, HA built-in
> 2. Better long-term TCO — ~30% savings over 3 years
> 3. Assessment showed 100% compatibility
> 
> The migration path using DMS supports near-zero downtime."

### Objection 2: Rollback Procedure

**Strong Answer**:
> "If the web server migration fails during peak hours:
> 1. **Immediate** (< 5 min): We detect via Azure Monitor alerts
> 2. **Assessment** (5-10 min): Team evaluates if it's a transient issue
> 3. **Decision** (10 min): Migration lead decides rollback vs. fix forward
> 4. **Rollback** (15-20 min):
>    - Update DNS to point back to on-prem
>    - DNS TTL is 5 minutes, so propagation is fast
>    - Verify on-prem is serving traffic
> 5. **Communication** (30 min): Stakeholder notification
> 
> Source environment remains running for 7 days post-migration."

### Objection 3: GDPR Compliance

**Strong Answer**:
> "We guarantee EU data residency through:
> 1. **Primary region**: West Europe for all resources
> 2. **Backups**: Locally redundant storage (LRS) — no geo-replication
> 3. **DR site**: North Europe (still EU)
> 4. **Azure Policy**: Deny deployments outside approved regions
> 5. **Monitoring**: Log Analytics workspace in West Europe
> 6. **Encryption**: Azure Storage encryption + SQL TDE
> 7. **Access**: RBAC + Conditional Access policies
> 
> We'll use Microsoft Defender for Cloud's compliance dashboard to demonstrate ongoing adherence."

---

## Bonus Points Indicators

### Arc Integration (+5)

Look for:
- Discussion of servers that can't migrate
- Azure Arc for unified management
- Arc-enabled SQL Server for assessment
- Policies applied across hybrid estate

### Cost Optimization (+5)

Look for:
- Specific Hybrid Benefit calculation
- Reserved Instance recommendation with justification
- Right-sizing analysis from assessment
- Tagging strategy for chargeback

### Security Hardening (+5)

Look for:
- Private Endpoints for storage/SQL
- Network Security Groups with specific rules
- Microsoft Defender for Cloud plans
- Key Vault for secrets management
- Just-in-time VM access

---

## Common Mistakes to Watch For

| Mistake | Why It's Wrong | Coaching |
|---------|----------------|----------|
| Migrating web before SQL | Web depends on database | "What happens when web can't reach SQL?" |
| No rollback plan | Risk is unmanaged | "What's your safety net?" |
| GRS backup for GDPR | May replicate outside EU | "Where exactly is the secondary copy?" |
| Migrating everything at once | Too risky | "What if something fails?" |
| Ignoring monitoring | Lose visibility | "How will you know if it's working?" |
| No dependency consideration | Migration will break things | "What talks to what?" |

---

## Wrap-Up Talking Points

1. **Azure Migrate is the starting point** — Discovery → Assessment → Migration
2. **CAF provides the methodology** — Plan → Prepare → Execute → Optimize
3. **Rollback planning is essential** — Hope for the best, plan for the worst
4. **Compliance surprises are real** — Build flexibility into your plans
5. **Optimization is ongoing** — Migration is just the beginning
6. **Hybrid is the reality** — Azure Arc bridges on-prem and cloud
