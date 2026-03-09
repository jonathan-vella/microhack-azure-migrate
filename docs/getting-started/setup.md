---
layout: default
title: Setup & Pre-work
parent: Getting Started
nav_order: 1
description: "Complete these items before the workshop to ensure a smooth start"
---

# Setup & Pre-work

> Complete these items **before the workshop** to ensure a smooth start.
> Estimated time: 15–30 minutes.
{: .important }

## Readiness Gate

Before the event, confirm every item below passes:

- [ ] Azure portal access verified
- [ ] Modern browser ready (Edge/Chrome/Firefox)
- [ ] Pop-up blocker configured for `*.azure.com`
- [ ] (Optional) Azure basics reviewed
- [ ] (Optional) Scenario brief read
- [ ] Day-of items ready (laptop, charger, notebook)

> If **any** blocking item fails, contact your facilitator immediately.
{: .warning }

---

## Required: Azure Portal Access

### 1. Verify Azure Credentials

Your facilitator will provide Azure subscription access. Verify you can sign in:

1. Open [Azure Portal](https://portal.azure.com)
2. Sign in with provided credentials
3. Verify you can see the subscription

```
✅ Can sign into Azure portal
✅ Can see workshop subscription
✅ Can see ArcBox resource group (if pre-deployed)
```

### 2. Browser Requirements

Use a modern browser with pop-up blocker disabled for Azure authentication:

| Browser | Supported |
|---|---|
| Microsoft Edge | ✅ Yes (recommended) |
| Google Chrome | ✅ Yes |
| Mozilla Firefox | ✅ Yes |
| Safari | ⚠️ Limited support |

**Recommended settings**:

- Disable pop-up blocker for `*.azure.com` and `*.microsoft.com`
- Enable cookies
- Disable browser extensions that may interfere

---

## Recommended: Azure Fundamentals Preparation

If you're new to Azure, review these concepts before the workshop:

### Core Concepts (15 min)

| Concept | Description | Learn More |
|---|---|---|
| **Subscription** | Billing container for resources | [Link](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-setup-guide/organize-resources) |
| **Resource Group** | Logical container for resources | [Link](https://learn.microsoft.com/azure/azure-resource-manager/management/manage-resource-groups-portal) |
| **RBAC** | Role-based access control | [Link](https://learn.microsoft.com/azure/role-based-access-control/overview) |
| **Azure Migrate** | Migration assessment tool | [Link](https://learn.microsoft.com/azure/migrate/migrate-services-overview) |

### Quick Videos

- [Azure Fundamentals in 5 minutes](https://www.youtube.com/watch?v=NKEFWyqJ5XA)
- [Azure Migrate Overview](https://www.youtube.com/watch?v=SAQwYb9F-_c)

---

## Optional: Read the Scenario

Review the [Workshop Prep](workshop-prep/) to understand the Contoso Bakery case study before the workshop.

---

## Day-of Checklist

Bring or ensure you have:

- [ ] Laptop with charged battery
- [ ] Charger/power adapter
- [ ] Azure portal access verified
- [ ] This repository bookmarked or cloned
- [ ] Notebook and pen (for whiteboard sessions)

---

## Technical Requirements

### Minimum Laptop Specs

| Component | Requirement |
|---|---|
| OS | Windows 10/11, macOS, or Linux |
| Browser | Edge, Chrome, or Firefox (latest) |
| Network | Stable internet connection |
| Screen | Recommended dual-monitor for hands-on labs |

### Network Access

Ensure you can access these URLs:

| URL | Purpose |
|---|---|
| `portal.azure.com` | Azure Portal |
| `login.microsoftonline.com` | Azure AD authentication |
| `*.azure.com` | Azure services |
| `github.com` | Workshop materials |

> If your organization uses a proxy or firewall, verify access beforehand.
{: .warning }

---

## Troubleshooting

### Can't access Azure portal?

1. Check if you're using the correct credentials
2. Try incognito/private browsing mode
3. Clear browser cache and cookies
4. Try a different browser
5. Contact your facilitator

### Multi-factor authentication issues?

1. Ensure your authenticator app is configured
2. Check if your organization requires specific MFA methods
3. Contact your IT helpdesk if needed

### Network issues?

1. Try a different network (mobile hotspot as backup)
2. Disable VPN if using one
3. Check with venue IT support

---

## Post-Event Cleanup

After the workshop, your facilitator will run cleanup scripts to remove all
Azure resources. If you need to clean up manually, see
[Governance Scripts](../reference/governance-scripts/).
