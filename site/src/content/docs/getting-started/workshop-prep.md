---
title: Workshop Prep
description: "Contoso Bakery scenario brief — read this before the workshop"
sidebar:
  order: 2
---


# Scenario Brief: Contoso Bakery

## Company Overview

**Contoso Bakery** is a growing artisan bakery and wholesale supplier based in Dublin, Ireland, known for their premium sourdough breads and pastries sold to cafés and restaurants across the region.

| Attribute | Details |
|---|---|
| Industry | Food & Beverage (Wholesale) |
| Employees | 65 |
| Revenue | €10M annually |
| Locations | Dublin, Ireland (single site) |
| IT Staff | 3 (IT Manager + 2 support) |

---

## Business Context

### Current Situation

Contoso Bakery operates from a single facility with a small server room that hosts their business applications. The infrastructure is aging, and the company faces several challenges:

- **Hardware refresh due** — Servers are 6+ years old and out of warranty
- **No redundancy** — Single points of failure everywhere
- **Skills gap** — IT team stretched thin, no dedicated infrastructure specialist
- **Business continuity** — No proper disaster recovery plan
- **Growth pressure** — New B2B customers require online ordering capability

### Strategic Initiative

The Managing Director has approved a **"Cloud Migration" project** with the goal of moving all workloads to Azure within 6 months. This workshop focuses on planning and executing that migration.

---

## Current Environment

Your simulated on-premises datacenter (represented by ArcBox) contains:

### Server Inventory

| Server Name | Operating System | Role | Business Criticality |
|---|---|---|---|
| **ArcBox-Win2K22** | Windows Server 2022 | Application Server | High |
| **ArcBox-Win2K25** | Windows Server 2025 | File Server | Medium |
| **ArcBox-SQL** | Windows Server 2022 + SQL Server 2022 | Database Server | Critical |
| **ArcBox-Ubuntu-01** | Ubuntu 22.04 LTS | Web Server | High |
| **ArcBox-Ubuntu-02** | Ubuntu 22.04 LTS | Monitoring Server | Medium |

### Application Landscape

```text
┌─────────────────────────────────────────────────────────────────┐
│                       CONTOSO BAKERY                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   [B2B Order Portal]        [Internal Apps]        [Monitoring]  │
│   Ubuntu-01 (Web)    ←→    Win2K22 (App)    →    Ubuntu-02      │
│         ↓                        ↓                              │
│         └──────────→ [SQL Database] ←──────────┘                │
│                      ArcBox-SQL                                  │
│                                                                  │
│   [File Shares]                                                  │
│   Win2K25 (Files)                                               │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Dependencies

| Application | Depends On | Notes |
|---|---|---|
| B2B Order Portal (Ubuntu-01) | SQL Database, App Server | Customer-facing, business hours |
| Inventory & Ordering (Win2K22) | SQL Database | Core business app |
| Monitoring (Ubuntu-02) | All servers | Basic uptime monitoring |
| File Server (Win2K25) | N/A | Recipes, invoices, HR docs |

---

## Stakeholder Requirements

### Managing Director

> "We're a small team and I need this to be simple. I can't afford for the bakery systems to go down during our busy morning rush. Just make it work reliably."

**Priorities**: Keep it simple, minimise disruption, reliable systems.

### Finance Manager

> "We're a small business — every euro counts. Show me that cloud makes financial sense and won't blow our budget."

**Priorities**: Clear predictable costs, stay within budget, understand ongoing monthly spend.

### IT Manager (also acting as CISO)

> "Our B2B customers trust us with their order data. We need to make sure we're handling it properly — I've heard about GDPR but we've never had a formal compliance review."

**Priorities**: Data protection basics, GDPR awareness, security fundamentals in Azure.

### Operations Supervisor

> "I manage the bakery floor and rely on the ordering system every day. If it goes down, we can't fulfil orders. Keep it running!"

**Priorities**: System availability, simple handover, quick support when issues arise.

---

## Constraints

| Constraint | Details |
|---|---|
| **Downtime window** | Weekends only (Sat 18:00 – Sun 12:00) |
| **Timeline** | Complete migration within 3 months |
| **Budget** | €15,000 for migration (tooling, any consulting) |
| **Data residency** | Customer data should stay in EU (GDPR) |
| **Skills** | IT team has limited Azure experience |

---

## Success Criteria

The migration will be considered successful when:

1. All 5 servers migrated to Azure (or managed via Arc)
2. Applications functional with same or better performance
3. GDPR compliance requirements met and documented
4. Monitoring operational with comparable visibility
5. IT team trained on Azure operations
6. Total cost of ownership reduced by 15% or justified

---

## Your Mission

As the migration consulting team, you will:

1. **Discover and assess** the current environment using Azure Migrate
2. **Design a migration strategy** aligned with Cloud Adoption Framework
3. **Plan migration waves** with proper sequencing and dependencies
4. **Address compliance requirements** including GDPR
5. **Optimise for cost** and design governance controls
6. **Present your plan** to Contoso Bakery leadership

---

## Questions to Consider

As you work through the challenges, think about:

- Which workload is the best pilot candidate?
- How do you handle the SQL database migration?
- What happens if the web server migration fails on Sunday morning?
- How will you address GDPR for customer order data?
- What's your recommendation for the monitoring server?

---

## Additional Context

### IT Environment Details

| Component | Current State |
|---|---|
| Virtualisation | Hyper-V |
| Active Directory | None (workgroup) |
| Backup | USB external drives (manual) |
| Monitoring | Basic Nagios |
| Network | 500 Mbps fibre broadband |

### Business Hours

| Day | Hours | Notes |
|---|---|---|
| Monday–Friday | 04:00–18:00 | Bakery production starts early |
| Saturday | 05:00–14:00 | Reduced hours |
| Sunday | Closed | Best maintenance window |
