---
layout: default
title: Troubleshooting
parent: Reference
nav_order: 2
description: "Common issues and fixes for the workshop"
---

# Troubleshooting

Common issues encountered during the workshop and how to resolve them.

---

## Azure Portal

| Issue | Solution |
|---|---|
| Can't sign in | Check credentials with facilitator; try incognito mode |
| Subscription not visible | Check subscription filter (funnel icon); click **Directories + subscriptions** |
| MFA issues | Ensure authenticator app is configured; contact IT helpdesk |
| Pop-up blocked | Disable pop-up blocker for `*.azure.com` and `*.microsoft.com` |

---

## ArcBox Environment

| Issue | Solution |
|---|---|
| Can't RDP to ArcBox-Client | Check NSG allows port 3389; verify VM is running; try Azure Bastion |
| Nested VMs not starting | Check ArcBox-Client memory; verify Hyper-V role is enabled |
| Post-deployment scripts stuck | Check `C:\ArcBox\Logs`; wait 20+ min; ask facilitator |
| Can't reach nested VMs | Verify network switch config; check IPs in Hyper-V Manager; test ping |

---

## Azure Migrate Appliance

| Issue | Solution |
|---|---|
| VHD download slow | Ask facilitator for local copy; use wired connection |
| Appliance won't start | Check memory (16 GB needed); verify VM import; check virtual switch |
| Can't access config manager | Get appliance IP via `ipconfig`; use `https://<IP>:44368`; accept cert warning |
| Registration fails | Verify project key is complete; check key hasn't expired; ensure Application Developer role |
| Host validation fails | Enable WinRM; open port 5985; verify credentials |
| Discovery not finding VMs | Check Hyper-V host credentials; verify VMs are running; wait a few minutes |

---

## Assessments

| Issue | Solution |
|---|---|
| No servers showing | Wait for discovery to complete; check appliance status; refresh dashboard |
| "Unknown" readiness | Discovery in progress — wait for metadata; add credentials if missing |
| SQL not discovered | Add SQL Server credentials; verify SQL service is running; wait (can take hours) |
| Cost estimate seems wrong | Check region, VM series, sizing criteria (performance vs as-is), RI vs PAYG |

---

## Network

| Issue | Solution |
|---|---|
| Can't access Azure portal | Try different network; disable VPN; check with venue IT |
| Proxy/firewall blocking | Verify access to `portal.azure.com`, `login.microsoftonline.com`, `*.azure.com` |
| Mobile hotspot needed | Use as backup for corporate network issues |

---

## General Tips

1. **Try incognito/private mode** — eliminates extension and cache issues
2. **Try a different browser** — Edge and Chrome work best
3. **Check the clock** — some Azure operations take minutes to propagate
4. **Ask your team first** — they may have already solved it
5. **Raise your hand** — facilitators are here to help

> Still stuck? Check [Hints and Tips](../../guides/hints-and-tips/) for challenge-specific guidance.
{: .tip }
