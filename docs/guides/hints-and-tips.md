---
layout: default
title: Hints & Tips
parent: Guides
nav_order: 1
description: "Expandable hints for each challenge — try first, then reveal!"
---

# Hints and Tips

Stuck on a challenge? Check these hints before asking for help.

> **Try first, then reveal!** Click to expand each hint.
{: .tip }

---

## Pre-work: Azure 101

<details>
<summary>Can't find Azure Migrate?</summary>

1. Use the search bar at the top of the Azure portal
2. Type "migrate" and select **Azure Migrate**
3. Or navigate: **All services** → **Migration** → **Azure Migrate**

</details>

<details>
<summary>Subscription not visible?</summary>

1. Check the subscription filter (funnel icon near the top)
2. Ensure "Show only subscriptions selected in the global subscriptions filter" is unchecked
3. Click **Directories + subscriptions** in the top bar

</details>

---

## Challenge 1: Plan

<details>
<summary>How do I prioritise workloads?</summary>

Use the Value vs. Complexity matrix:

- **High Value + Low Complexity** = Quick wins (migrate first)
- **High Value + High Complexity** = Strategic investments (plan carefully)
- **Low Value + Low Complexity** = Fill-ins (low priority)
- **Low Value + High Complexity** = Avoid or defer

For Contoso:
- Monitoring server → Low complexity, good for pilot
- SQL database → High value, high complexity → Plan carefully

</details>

<details>
<summary>What dependencies should I consider?</summary>

Think about:
- **Database dependencies**: App servers typically depend on SQL
- **Web tier**: Web servers call app servers and/or databases
- **Monitoring**: Needs access to all servers (migrate last or use Arc)
- **File shares**: May have AD dependencies

</details>

<details>
<summary>How many waves should I plan?</summary>

Typically 3–5 waves for an environment this size:
1. **Pilot**: Lowest-risk workload (monitoring or dev)
2. **Data tier**: Databases (need extra testing)
3. **App tier**: Application servers
4. **Web tier**: Customer-facing (last, most visible)
5. **Cleanup**: Decommission source

</details>

---

## Challenge 2: Deploy Appliance

<details>
<summary>VHD download is slow?</summary>

- Check with your facilitator — they may have a local copy
- The VHD is ~8–10 GB compressed
- Use a wired connection if available
- Start download and work on other tasks in parallel

</details>

<details>
<summary>Appliance won't start in Hyper-V?</summary>

1. Verify ArcBox-Client has enough free memory (16 GB for appliance)
2. Check that the VM imported correctly
3. Verify the virtual switch is connected
4. Try starting VM from PowerShell: `Start-VM -Name "appliance-name"`

</details>

<details>
<summary>Can't access appliance configuration manager?</summary>

1. Get the appliance IP: In Hyper-V, connect to VM and run `ipconfig`
2. Ensure you're using HTTPS: `https://<IP>:44368`
3. Accept the self-signed certificate warning
4. Try from a browser on ArcBox-Client first

</details>

<details>
<summary>Registration fails?</summary>

Common issues:
- **Wrong key**: Double-check you copied the complete project key
- **Expired key**: Keys expire after a while — generate a new one
- **Permissions**: Your Azure account needs Application Developer role
- **Pop-up blocked**: The authentication window may be blocked

</details>

<details>
<summary>Host validation fails?</summary>

Verify:
1. WinRM is enabled on the Hyper-V host
2. Port 5985 is open
3. Credentials are correct (local admin or domain admin)
4. Run the Hyper-V prep script if not done

</details>

<details>
<summary>Discovery not finding VMs?</summary>

1. Check Hyper-V host credentials are correct
2. Verify nested VMs are running in Hyper-V Manager
3. Wait a few minutes — initial discovery takes time
4. Check appliance logs: `C:\ProgramData\Microsoft Azure\Logs`

</details>

---

## Challenge 3: Assessment

<details>
<summary>No servers showing in assessment?</summary>

1. Wait longer — discovery can take several minutes
2. Check the appliance status in Azure portal
3. Verify discovery is running (no errors)
4. Refresh the Azure Migrate dashboard

</details>

<details>
<summary>Assessment shows "Unknown" readiness?</summary>

This usually means:
- Discovery just started — wait for metadata
- Server credentials not added — add Windows/Linux credentials
- Server not responding — check VM is running

</details>

<details>
<summary>SQL not discovered?</summary>

1. Add SQL Server credentials to the appliance
2. Verify SQL Server service is running on ArcBox-SQL
3. SQL discovery can take up to 24 hours — you may only see partial results
4. Check firewall allows SQL connections

</details>

<details>
<summary>Cost estimate seems wrong?</summary>

Check assessment settings:
- Region affects pricing
- VM series selection (exclude expensive series)
- Sizing criteria (performance-based vs as-is)
- Reserved instances vs pay-as-you-go

</details>

---

## Challenge 4: Execute

<details>
<summary>Which migration tool should I use?</summary>

| Workload | Recommended Tool |
|---|---|
| Windows/Linux VMs | Azure Migrate: Server Migration |
| SQL to Azure SQL MI | Azure Migrate: Database Migration |
| SQL to SQL on VM | Azure Migrate: Server Migration |
| File shares | Azure File Sync or Storage Migration Service |
| Web apps | Azure App Service Migration Assistant |

</details>

<details>
<summary>How do I design a rollback?</summary>

Key elements:
1. **Keep source running** — Don't decommission until validated
2. **DNS-based cutover** — Easy to revert
3. **Define triggers** — What error rate means "rollback"?
4. **Time limit** — "After 7 days, no rollback possible"
5. **Data sync plan** — How to handle changes made in Azure

</details>

<details>
<summary>What order should servers migrate?</summary>

General pattern:
1. Independent workloads first (monitoring, dev)
2. Data tier before app tier (SQL first)
3. App tier before web tier
4. Customer-facing last (most visible)

</details>

---

## Challenge 5: Curveball

<details>
<summary>Which servers handle GDPR data?</summary>

Definitely:
- **ArcBox-SQL** — Customer database
- **ArcBox-Ubuntu-01** — Web server (user sessions, cookies)

Maybe:
- **ArcBox-Win2K22** — App server (depends on what it processes)
- **ArcBox-Win2K25** — File server (may have customer documents)

Probably not:
- **ArcBox-Ubuntu-02** — Monitoring (but check what logs contain!)

</details>

<details>
<summary>Which EU regions should I use?</summary>

Common choices:
- **West Europe** (Netherlands) — Major hub
- **North Europe** (Ireland) — Good for UK proximity
- **France Central** (Paris) — French data requirements
- **Germany West Central** (Frankfurt) — German data requirements

</details>

<details>
<summary>What about backups and DR?</summary>

Ensure:
- Backup vault is in EU region
- Use LRS or ZRS (not GRS if it replicates outside EU)
- DR site (if any) is also in EU
- Log Analytics workspace in EU

</details>

---

## Challenge 6: Optimise

<details>
<summary>How much can I save with Hybrid Benefit?</summary>

- **Windows Server**: Up to 40% savings
- **SQL Server**: Up to 55% savings
- Requires active Software Assurance or subscription licenses

</details>

<details>
<summary>Should I recommend Reserved Instances?</summary>

Yes, if:
- Workload is stable (predictable usage)
- 1-year commitment for ~20–30% savings
- 3-year commitment for ~40–60% savings

Not yet, if:
- Just migrating (wait to see actual usage)
- Workload may change significantly
- Short-term project

</details>

<details>
<summary>What about Azure Arc?</summary>

Use Arc for:
- Servers that can't migrate (compliance, legacy)
- Unified management view
- Applying Azure Policy to on-prem
- Extended security updates

</details>

---

## Challenge 7: Presentation

<details>
<summary>How should I structure the presentation?</summary>

1. **Hook** (30 sec): "We're migrating Contoso to Azure in 3 months..."
2. **Assessment findings** (1 min): Key discoveries, readiness
3. **Strategy** (3 min): Waves, tools, timeline
4. **Risk & rollback** (1 min): What could go wrong, how we handle it
5. **GDPR** (1 min): How we addressed the curveball
6. **Cost** (1 min): Estimates and optimisation
7. **Governance** (30 sec): How we'll manage ongoing

</details>

<details>
<summary>How do I handle objections?</summary>

**Listen → Acknowledge → Address → Confirm**

Example:
- "That's a great question about rollback..."
- "I understand the concern about downtime..."
- "Our approach is... because..."
- "Does that address your concern?"

</details>

<details>
<summary>Tips for PaaS vs IaaS objection?</summary>

Arguments for IaaS (SQL on VM):
- Familiar management model
- More control over configuration
- May have specific SQL features needed
- Simpler migration (lift and shift)

Arguments for PaaS (SQL MI):
- Less management overhead
- Built-in HA and patching
- Better long-term TCO
- Cloud-native benefits

Your answer: "We recommend X because [specific reason for Contoso's situation]"

</details>

---

## Still Stuck?

1. Check the relevant challenge page for more context
2. Ask a teammate — they might have figured it out
3. Raise your hand for facilitator help

> **It's OK to ask for help!** That's what the facilitators are here for.
{: .note }
