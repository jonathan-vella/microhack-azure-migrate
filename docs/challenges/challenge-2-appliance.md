---
layout: default
title: "Challenge 2: Deploy Appliance"
parent: Challenges
nav_order: 3
description: "Deploy and configure the Azure Migrate appliance"
---

# Challenge 2: Deploy Azure Migrate Appliance

## Challenge Snapshot

| Field | Value |
|---|---|
| Duration | 75 minutes |
| Type | Hands-on Lab |
| Points | 25 |
| Deliverable | Registered Azure Migrate appliance with discovery started |

## Objective

Deploy and configure the Azure Migrate appliance in your ArcBox environment to discover on-premises workloads.

---

## The Business Challenge

Your assessment strategy from Challenge 1 requires actual data from the environment. Contoso Bakery needs you to:

1. Set up the Azure Migrate project
2. Deploy the discovery appliance
3. Configure credentials for all server types
4. Start discovering workloads

This is where planning meets reality — let's see what's actually running!

---

## Prerequisites

Before starting this challenge, ensure:

- [ ] You completed the Azure 101 pre-work
- [ ] You can access the Azure portal
- [ ] Your facilitator has confirmed ArcBox is deployed and ready
- [ ] You have the ArcBox VM credentials (see [ArcBox Environment](../getting-started/arcbox-environment/))

---

## Your Tasks

### Part A: Create Azure Migrate Project (15 min)

1. Navigate to **Azure Migrate** in the Azure portal
2. Select **Servers, databases and web apps**
3. Click **Create project**

   | Setting | Value |
   |---------|-------|
   | Subscription | Your workshop subscription |
   | Resource group | Create new: `rg-migrate-[teamname]` |
   | Project name | `migrate-contoso-[teamname]` |
   | Geography | Select your region |

4. Click **Create**

5. After creation, click **Discover** in the Azure Migrate dashboard

6. Configure discovery settings:

   | Setting | Value |
   |---------|-------|
   | Are your servers virtualized? | **Yes, with Hyper-V** |
   | Appliance name | `appliance-[teamname]` (max 14 chars) |

7. Click **Generate key**

   > ⚠️ **Watch out**: Copy this key and save it — you'll need it for registration!

✅ **Verify**:

- [ ] Azure Migrate project created
- [ ] Project key generated and saved

---

### Part B: Download and Import Appliance VHD (25 min)

1. In the Azure Migrate portal, locate **Step 2: Download Azure Migrate appliance**

2. Click **Download** to get the VHD file (~8-10 GB)

   > 💡 **Tip**: While downloading, proceed to connect to your ArcBox environment

3. **Connect to ArcBox-Client VM**:

   - Use the RDP connection details from your facilitator
   - Or use Azure Bastion if configured

4. Once connected to ArcBox-Client, open **Hyper-V Manager**

5. Import the Azure Migrate appliance:

   a. **Actions** → **Import Virtual Machine**

   b. **Locate Folder**: Browse to the extracted VHD folder

   c. **Select Virtual Machine**: Choose the appliance

   d. **Choose Import Type**: Select **"Copy the virtual machine (create a new unique ID)"**

   e. **Configure Networking**: Select the external virtual switch

   f. Click **Finish**

6. **Start the appliance VM**:
   - Right-click the imported VM → **Start**
   - Right-click → **Connect** to open console

7. **Initial VM Configuration**:
   - Accept license terms
   - Set language and keyboard
   - Set administrator password (document this!)

✅ **Verify**:

- [ ] VHD downloaded
- [ ] Appliance imported into Hyper-V
- [ ] Appliance VM running

---

### Part C: Configure and Register Appliance (20 min)

1. **Access the Appliance Configuration Manager**:

   - From any machine that can reach the appliance
   - Open browser to: `https://<appliance-IP>:44368`
   - Accept the certificate warning

2. **Set up prerequisites**:

   The appliance will check:
   - ✅ Internet connectivity
   - ✅ Time sync
   - ✅ Latest updates

3. **Register with Azure Migrate**:

   a. Paste the **project key** you saved earlier

   b. Click **Login**

   c. Click **Copy code & Login**

   d. In the new browser tab, paste the device code

   e. Sign in with your Azure credentials

   f. Return to the configuration manager

   g. Verify: **"Successfully registered"**

✅ **Verify**:

- [ ] Appliance configuration manager accessible
- [ ] Prerequisites passed
- [ ] Appliance registered with Azure

---

### Part D: Add Discovery Credentials (15 min)

1. **Add Hyper-V Host Credentials**:

   In **Step 1: Provide Hyper-V host credentials**:

   | Setting | Value |
   |---------|-------|
   | Friendly name | `ArcBoxAdmin` |
   | Username | Administrator credentials from facilitator |
   | Password | Password from facilitator |

2. **Add Hyper-V Host**:

   In **Step 2: Provide Hyper-V host/cluster details**:

   - Click **Add discovery source**
   - Enter the Hyper-V host IP/FQDN (ArcBox-Client)
   - Select the `ArcBoxAdmin` credentials
   - Click **Save**
   - Wait for validation: **"Validation successful"**

3. **Add Server Credentials** (for deeper discovery):

   In **Step 3: Provide server credentials**:

   | Type | Friendly Name | Username | Purpose |
   |------|---------------|----------|---------|
   | Windows | `WindowsAdmin` | Administrator | Win2K22, Win2K25, SQL |
   | Linux | `LinuxAdmin` | arcbox | Ubuntu VMs |
   | SQL Server | `SQLAdmin` | sa (if applicable) | SQL instance discovery |

   > 💡 **Tip**: Get exact credentials from [ArcBox Environment](../getting-started/arcbox-environment/)

✅ **Verify**:

- [ ] Hyper-V host credentials added
- [ ] Hyper-V host validated successfully
- [ ] Server credentials added (Windows, Linux)

---

### Part E: Start Discovery (15 min)

1. Click **Start discovery**

2. Monitor the discovery status in the table

3. **Expected timeline**:
   - Server metadata: ~2 minutes per host
   - Full software inventory: Up to 1 hour
   - SQL discovery: Up to 24 hours (you'll see partial results)

4. **While waiting**, return to Azure portal:
   - Navigate to **Azure Migrate** → **Servers, databases and web apps**
   - Click on the discovered servers count (may take 5-10 minutes to appear)
   - You should eventually see 5 VMs:
     - ArcBox-Win2K22
     - ArcBox-Win2K25
     - ArcBox-SQL
     - ArcBox-Ubuntu-01
     - ArcBox-Ubuntu-02

✅ **Verify**:

- [ ] Discovery started successfully
- [ ] Servers beginning to appear in Azure portal

---

## Expected Deliverables

By the end of this challenge, your team should provide:

1. ✅ Azure Migrate project and generated key
2. ✅ Registered appliance with validated discovery sources
3. ✅ Discovery started with ArcBox servers appearing in Azure

---

## Success Criteria (25 Points)

| Criterion | Points | Verification |
|-----------|--------|--------------|
| Azure Migrate project created | 5 | Project visible in portal |
| Appliance registered | 5 | Shows "Registered" status |
| Credentials configured | 5 | Hyper-V + Windows + Linux |
| Discovery started | 5 | No errors, discovery running |
| 5 VMs discovered | 5 | All 5 ArcBox VMs visible in portal |
| **Total** | **25** | |

---

### ⚠️ Watch out

| Issue | Solution |
|-------|----------|
| VHD download slow | Check with facilitator for local copy |
| Appliance won't start | Verify enough RAM (16 GB) on Hyper-V host |
| Can't access config manager | Check network connectivity, firewall port 44368 |
| Host validation fails | Verify WinRM port 5985 is open |
| Registration fails | Ensure you have Application Developer role in Microsoft Entra ID |
| Discovery stuck | Check credentials have local admin on Hyper-V host |

---

## 💡 Tip

- **Work in parallel** — One person downloads VHD while another creates the Migrate project
- **Document everything** — Save passwords and IPs, you'll need them later
- **Don't wait for full discovery** — Initial server discovery is fast, deeper analysis takes longer
- **Check the appliance logs** — If issues occur, logs are at `C:\ProgramData\Microsoft Azure\Logs`

---

## ⚠️ Watch out

- Validate appliance networking and WinRM early to avoid late discovery failures.
- Keep project key and credentials secure and accessible to the team.

---

### What Just Happened?

You deployed the Azure Migrate appliance, which:

1. **Connected to your Hyper-V host** via WinRM
2. **Discovered VMs** by querying Hyper-V management interfaces
3. **Collected metadata** — VM names, OS, CPU, memory, disks
4. **Sent data to Azure** — Securely via HTTPS to your Migrate project

This is exactly how real migrations begin — with discovery!

---

### Reflection Questions

- What would happen if discovery credentials were wrong?
- How does agentless discovery differ from agent-based?
- Why does full software inventory take longer than server metadata?

---

## Next Step

⏸️ **Break for Lunch** — Discovery will continue running.

After lunch, verify your discovered servers and proceed to [Challenge 3: Assessment](challenge-3-assessment/).
