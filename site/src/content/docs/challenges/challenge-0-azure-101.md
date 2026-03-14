---
title: "Challenge 0: Azure 101"
description: "Pre-work — foundational Azure skills before the workshop"
sidebar:
  order: 1
  badge:
    text: Pre-work
    variant: note
prev: false
next:
  link: ../challenge-1-plan/
  label: "Challenge 1: Plan"
---


# Pre-work: Azure 101

## Challenge Snapshot

| Field | Value |
|---|---|
| Duration | 30 minutes |
| Type | Self-paced |
| Complete Before | Workshop Day |
| Deliverable | Completed pre-work checklist and readiness to start Challenge 1 |

## Objective

Ensure all participants have foundational Azure skills before starting the migration challenges. Complete this pre-work **before the workshop** to ensure your team can hit the ground running.

---

## The Business Challenge

Your team has been given access to an Azure subscription for this workshop. Before the workshop day, you need to familiarize yourself with the Azure portal and key concepts.

---

## Prerequisites

Before starting this challenge, ensure:

- [ ] You have Azure subscription credentials from your facilitator
- [ ] You can sign in to the Azure portal

---

## Your Tasks

### Task 1: Navigate the Azure Portal (10 min)

1. Open the [Azure Portal](https://portal.azure.com) in your browser
2. Sign in with the credentials provided by your facilitator
3. Explore the portal interface:
   - **Home** — Your personalized dashboard
   - **All services** — Complete service catalog
   - **Search bar** — Quick navigation (try searching "migrate")
   - **Cloud Shell** — Built-in command line

✅ **Verify**: Can you find the following?

- [ ] Your subscription name
- [ ] The resource groups in your subscription
- [ ] The Azure Migrate service

---

### Task 2: Understand Subscriptions & Resource Groups (10 min)

**Concepts to understand:**

| Concept | Description | Analogy |
|---------|-------------|---------|
| **Tenant** | Your organization's Microsoft Entra ID instance | Your company |
| **Subscription** | Billing container for Azure resources | A credit card account |
| **Resource Group** | Logical container for related resources | A folder for project files |
| **Resource** | Individual Azure service instance | A file |

**Explore your subscription:**

1. Navigate to **Subscriptions** in the portal
2. Click on your workshop subscription
3. Review:
   - Subscription ID (you'll need this later)
   - Current cost/usage
   - Resource providers

**Explore resource groups:**

1. Navigate to **Resource Groups**
2. Find the pre-created ArcBox resource group
3. Click into it and explore the resources

✅ **Verify**: Answer these questions:

- [ ] What is your subscription ID? (Write it down)
- [ ] What resource group contains your ArcBox environment?
- [ ] How many resources are in that resource group?

---

### Task 3: Understand RBAC Basics (5 min)

**Role-Based Access Control (RBAC)** determines what actions you can perform.

| Role | Permissions |
|------|-------------|
| **Owner** | Full access, can assign roles |
| **Contributor** | Create/manage resources, can't assign roles |
| **Reader** | View only |

**Check your role:**

1. Navigate to your subscription
2. Click **Access control (IAM)**
3. Click **View my access**
4. Note your assigned role(s)

✅ **Verify**:

- [ ] What role do you have on this subscription?

---

### Task 4: Locate Azure Migrate (5 min)

Azure Migrate is the hub for migration tools. Let's find it.

1. In the portal search bar, type **"Azure Migrate"**
2. Click on **Azure Migrate** in the results
3. Explore the overview page:
   - **Servers, databases and web apps** — What we'll use today
   - **Assessment tools** — For evaluating readiness
   - **Migration tools** — For executing migrations

✅ **Verify**:

- [ ] Can you navigate to Azure Migrate?
- [ ] Do you see the "Discover, assess and migrate" section?

---

## Expected Deliverables

Complete this checklist before proceeding:

| Item | Status |
|------|--------|
| Signed into Azure portal | [ ] |
| Found subscription ID | [ ] |
| Identified ArcBox resource group | [ ] |
| Checked RBAC role assignment | [ ] |
| Located Azure Migrate service | [ ] |

---

## Success Criteria

| Criterion | Verification |
|-----------|--------------|
| Azure portal access confirmed | Can sign in and navigate subscription and resource groups |
| Azure Migrate located | Can find Azure Migrate and core migration section |
| Pre-work readiness complete | Verification checklist items are checked |

---

### Key Terminology

| Term | Definition |
|------|------------|
| **Azure Migrate** | Centralized hub for discovery, assessment, and migration |
| **Appliance** | On-premises VM that discovers your workloads |
| **Assessment** | Report evaluating migration readiness and costs |
| **Discovery** | Process of finding and cataloging your workloads |
| **Replication** | Copying data from source to target (not covered today) |

---

## 💡 Tip

- **Bookmark Azure Migrate** — You'll return here frequently
- **Use the search bar** — It's the fastest way to navigate Azure
- **Pin to dashboard** — Right-click services to pin them for quick access

---

## ⚠️ Watch out

| Issue | Solution |
|-------|----------|
| Can't sign in | Check credentials with facilitator |
| Subscription not visible | You may not have access assigned yet |
| Portal is slow | Try a different browser or incognito mode |

---

## Next Step

Once your team has completed all verification items, proceed to the [Scenario Introduction](../../getting-started/workshop-prep/), then continue to [Challenge 1: Plan](../challenge-1-plan/).
