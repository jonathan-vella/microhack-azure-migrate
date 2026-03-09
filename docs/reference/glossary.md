---
layout: default
title: Glossary
parent: Reference
nav_order: 1
description: "Key Azure Migrate and CAF terminology"
---

# Glossary

## Naming Conventions

Throughout this workshop the following terms are used consistently:

| Term | Meaning |
|---|---|
| **WDS** | Whiteboard Design Session — a collaborative design exercise using whiteboards |
| **CAF** | Cloud Adoption Framework — Microsoft's methodology for cloud adoption |
| **ArcBox** | Azure Jumpstart ArcBox — the simulated on-premises lab environment |

## Azure Migrate Terms

| Term | Definition |
|---|---|
| **Appliance** | A lightweight VM deployed on-premises that discovers and assesses servers |
| **Discovery** | The process of finding and cataloging on-premises servers, apps, and dependencies |
| **Assessment** | An evaluation of on-premises workloads for Azure readiness, sizing, and cost |
| **Readiness** | Whether a workload can run in Azure as-is, with changes, or not at all |
| **Dependency mapping** | Visualising which servers communicate with each other |
| **Migration wave** | A group of workloads migrated together in a single batch |
| **Project key** | A credential used to register the appliance with an Azure Migrate project |

## CAF Phases

| Phase | Description |
|---|---|
| **Plan** | Define migration strategy, assess workloads, prioritise waves |
| **Prepare** | Set up Azure environment, deploy tooling (appliance), configure credentials |
| **Execute** | Run assessments, perform migrations, validate results |
| **Optimise** | Right-size resources, apply cost controls, configure governance |
| **Decommission** | Retire source infrastructure after successful validation |

## Azure Services

| Service | Purpose in This Workshop |
|---|---|
| **Azure Migrate** | Discovery, assessment, and migration orchestration |
| **Azure Arc** | Hybrid management for servers that remain on-premises |
| **Azure Policy** | Governance controls (e.g., allowed regions, required tags) |
| **Azure SQL Managed Instance** | PaaS option for SQL Server migration |
| **Azure Site Recovery** | Disaster recovery and migration replication |
| **Azure Monitor** | Post-migration monitoring and alerting |

## Compliance Terms

| Term | Definition |
|---|---|
| **GDPR** | General Data Protection Regulation — EU regulation on personal data protection |
| **Data residency** | Requirement that data is stored in a specific geographic region |
| **PII** | Personally Identifiable Information — data that can identify an individual |
| **Data sovereignty** | Legal requirement that data is subject to the laws of the country where it's stored |

## Identity

| Term | Definition |
|---|---|
| **Microsoft Entra ID** | Microsoft's cloud identity and access management service (formerly Azure Active Directory) |
| **RBAC** | Role-Based Access Control — grants permissions based on assigned roles |
