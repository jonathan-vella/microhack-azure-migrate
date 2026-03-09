# Pre-Deployment Guide

Complete these steps **before the workshop** (ideally the day before).

---

## Overview

| Task | Time Required | When |
|------|---------------|------|
| Deploy ArcBox environments | 30-50 min per team | Day before |
| Verify deployments | 10 min per team | Day before |
| Prepare Azure subscriptions | 30 min total | Day before |
| Pre-download Azure Migrate VHD | 20 min | Day before |
| Day-of verification | 5 min per team | Workshop morning |

---

## Step 1: Prepare Azure Subscriptions

### 1.1 Subscription Requirements

Each team needs:
- **1 Azure subscription** with sufficient quota
- **Owner** access for team members
- **Spending cap** configured (recommended: $100)

### 1.2 Register Resource Providers

Run this for each subscription (PowerShell):

```powershell
$providers = @(
    "Microsoft.Compute",
    "Microsoft.HybridCompute",
    "Microsoft.GuestConfiguration",
    "Microsoft.AzureArcData",
    "Microsoft.OperationsManagement",
    "Microsoft.Insights",
    "Microsoft.HybridConnectivity",
    "Microsoft.OffAzure",
    "Microsoft.Migrate"
)

foreach ($provider in $providers) {
    Register-AzResourceProvider -ProviderNamespace $provider
}
```

### 1.3 Verify Quota

ArcBox requires **8 DSv5-series vCPUs** per deployment.

```bash
# Check quota for DSv5 family
az vm list-usage --location eastus --query "[?name.value=='standardDSv5Family']"
```

---

## Step 2: Deploy ArcBox Environments

### 2.1 Supported Regions

Deploy ArcBox only in these regions:
- East US, East US 2, Central US, West US 2
- North Europe, West Europe, France Central, UK South
- Australia East, Japan East, Korea Central, Southeast Asia

### 2.2 Deploy Using Azure Portal

1. Navigate to [ArcBox for IT Pros deployment](https://jumpstart.azure.com/azure_jumpstart_arcbox/ITPro)

2. Click **Deploy to Azure**

3. Configure for each team:

   | Parameter | Value |
   |-----------|-------|
   | Subscription | Team's subscription |
   | Resource group | `rg-arcbox-[teamname]` |
   | Region | Select from supported list |
   | Windows Admin Username | `arcboxadmin` |
   | Windows Admin Password | `[Strong password - document this!]` |
   | Log Analytics Workspace Name | `log-arcbox-[teamname]` |
   | Deploy Bastion | `true` (recommended) |

4. Click **Review + Create** → **Create**

5. **Wait for deployment** (~30-50 minutes)

### 2.3 Deploy Using CLI (Alternative)

```bash
# Variables
TEAM_NAME="team1"
LOCATION="eastus"
PASSWORD="YourStr0ngP@ssword!"

# Create resource group
az group create --name "rg-arcbox-${TEAM_NAME}" --location "${LOCATION}"

# Deploy ArcBox
az deployment group create \
    --resource-group "rg-arcbox-${TEAM_NAME}" \
    --template-uri "https://raw.githubusercontent.com/microsoft/azure_arc/main/azure_jumpstart_arcbox/ARM/azuredeploy.json" \
    --parameters windowsAdminPassword="${PASSWORD}" \
    --parameters deployBastion=true
```

---

## Step 3: Verify ArcBox Deployments

### 3.1 Check Deployment Status

For each team, verify:

```bash
az deployment group show \
    --resource-group "rg-arcbox-[teamname]" \
    --name "azuredeploy" \
    --query "properties.provisioningState"
```

Should return: `Succeeded`

### 3.2 Connect to ArcBox-Client

1. Get the public IP:
   ```bash
   az vm show -g "rg-arcbox-[teamname]" -n "ArcBox-Client" -d --query "publicIps" -o tsv
   ```

2. RDP to the VM using the credentials you set

3. **Wait for post-deployment scripts** (10-20 minutes on first login)
   - Watch for the "ArcBox deployment complete" message
   - Or check `C:\ArcBox\Logs\`

### 3.3 Verify Nested VMs

In Hyper-V Manager, confirm these VMs exist and are running:
- [ ] ArcBox-Win2K22
- [ ] ArcBox-Win2K25
- [ ] ArcBox-SQL
- [ ] ArcBox-Ubuntu-01
- [ ] ArcBox-Ubuntu-02

---

## Step 4: Pre-Download Azure Migrate VHD

Save bandwidth by pre-staging the Azure Migrate appliance VHD.

### 4.1 Download VHD

1. Get the download link from Azure Migrate documentation
2. Download the VHD (~8-10 GB compressed)
3. Extract to a local folder

### 4.2 Option A: Stage on Each ArcBox-Client

1. RDP to each ArcBox-Client
2. Copy the extracted VHD folder to `C:\ArcBox\AzureMigrateVHD\`

### 4.3 Option B: Use Azure Storage

1. Create a storage account in the same region
2. Upload the VHD to a blob container
3. Note the SAS URL for download during workshop

---

## Step 5: Prepare Hyper-V for Azure Migrate

Run this script on each ArcBox-Client to prepare for Azure Migrate discovery:

```powershell
# Enable WinRM for Azure Migrate
Enable-PSRemoting -Force

# Configure WinRM
winrm quickconfig -force
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'

# Open firewall
New-NetFirewallRule -DisplayName "WinRM HTTP" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 5985

# Verify
winrm enumerate winrm/config/listener
```

Alternatively, download and run the official script:
```powershell
# Download from Microsoft Learn reference
# https://learn.microsoft.com/azure/migrate/tutorial-discover-hyper-v
Invoke-WebRequest -Uri "https://download.microsoft.com/download/8/a/a/8aae170f-2f49-4f14-b211-7f876fd8f28f/MicrosoftAzureMigrate-Hyper-V.ps1" -OutFile "MicrosoftAzureMigrate-Hyper-V.ps1"

# Verify hash
Get-FileHash -Path .\MicrosoftAzureMigrate-Hyper-V.ps1 -Algorithm SHA256

# Run
.\MicrosoftAzureMigrate-Hyper-V.ps1
```

---

## Step 6: Configure RBAC

### 6.1 Create Team Assignments

For each team member, assign:

```bash
# Owner on the subscription (or at minimum, the resource group)
az role assignment create \
    --assignee "user@domain.com" \
    --role "Owner" \
    --scope "/subscriptions/[subscription-id]/resourceGroups/rg-arcbox-[teamname]"

# Azure Migrate permissions (at subscription level)
az role assignment create \
    --assignee "user@domain.com" \
    --role "Contributor" \
    --scope "/subscriptions/[subscription-id]"
```

### 6.2 Application Developer Role

For appliance registration, users need:

1. Navigate to Azure AD → Roles and administrators
2. Find **Application Developer** role
3. Add team members (or verify they already have it)

---

## Step 7: Configure Cost Controls

### 7.1 Set Spending Controls

For **MSDN / Free Trial** subscriptions, configure the built-in spending cap in the
[Account Center](https://account.azure.com/).

For **Enterprise / Pay-As-You-Go** subscriptions (which do not support spending caps),
use **Azure Cost Management budgets** instead:

1. Navigate to subscription → **Budgets**
2. Create a budget: **$100** per team
3. Set alerts at 50 %, 80 %, 100 %

### 7.2 Configure Auto-Shutdown

For ArcBox-Client VMs:

```bash
az vm auto-shutdown \
    --resource-group "rg-arcbox-[teamname]" \
    --name "ArcBox-Client" \
    --time "1800" \
    --timezone "UTC"
```

---

## Step 8: Create Credentials Document

Prepare a credentials sheet for each team:

```
TEAM: [Team Name]
==============================

Azure Subscription ID:
[subscription-id]

Azure Login:
[provided or team's own]

ArcBox-Client RDP:
IP: [public IP]
Username: arcboxadmin
Password: [password]

Nested VM Credentials:
Windows (Win2K22, Win2K25, SQL):
  Username: Administrator
  Password: [password]

Linux (Ubuntu-01, Ubuntu-02):
  Username: arcbox
  Password: [password]

Azure Migrate VHD Location:
C:\ArcBox\AzureMigrateVHD\
```

> ⚠️ Distribute credentials securely on workshop day. Do not email passwords.

---

## Step 9: Day-of Verification Checklist

Run through this 30 minutes before workshop starts:

### For Each Team Environment

- [ ] ArcBox-Client VM is running
- [ ] Can RDP to ArcBox-Client
- [ ] Post-deployment scripts completed
- [ ] All 5 nested VMs are running
- [ ] Internet connectivity from ArcBox-Client
- [ ] Azure Migrate VHD is available
- [ ] WinRM is configured

### For Each Azure Subscription

- [ ] Team members can sign in
- [ ] Subscription is visible
- [ ] Required resource providers registered
- [ ] Quota available for any new resources

---

## Troubleshooting

### ArcBox Deployment Failed

1. Check deployment errors in Azure portal
2. Common issues:
   - Quota exceeded → Request increase or use different region
   - Name conflicts → Use unique names
   - Region not supported → Check supported region list

### Post-Deployment Scripts Stuck

1. Check `C:\ArcBox\Logs\` for errors
2. Common issues:
   - Internet connectivity → Check NSG rules
   - Script timeout → Wait longer or restart VM
3. Re-run scripts manually if needed

### Nested VMs Not Starting

1. Verify ArcBox-Client has enough memory
2. Check Hyper-V Event Viewer
3. Ensure virtual switch is configured

### Can't RDP to ArcBox-Client

1. Check VM is running
2. Verify NSG allows port 3389
3. Try Azure Bastion instead
4. Check public IP is assigned

---

## Cleanup After Workshop

Run the cleanup script after the workshop:

```powershell
# Delete all ArcBox resource groups
$teams = @("team1", "team2", "team3")

foreach ($team in $teams) {
    az group delete --name "rg-arcbox-$team" --yes --no-wait
    az group delete --name "rg-migrate-$team" --yes --no-wait
}
```

---

## Checklist Summary

**Day Before:**
- [ ] Subscriptions prepared with RBAC
- [ ] Resource providers registered
- [ ] ArcBox deployed for each team
- [ ] Post-deployment scripts completed
- [ ] Azure Migrate VHD pre-staged
- [ ] WinRM configured
- [ ] Credentials documented

**Morning of Workshop:**
- [ ] All ArcBox-Client VMs running
- [ ] All nested VMs running
- [ ] RDP access verified
- [ ] Credentials ready to distribute
