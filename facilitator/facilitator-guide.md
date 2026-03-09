# Facilitator Guide

Comprehensive coaching guide for the Azure Migration Workshop.

---

## Your Role

As a facilitator, you are a **coach**, not a lecturer. Your job is to:

- ✅ Guide teams when they're stuck (not give answers)
- ✅ Keep the workshop on schedule
- ✅ Encourage collaboration and discussion
- ✅ Evaluate deliverables fairly
- ✅ Create a safe learning environment

---

## Workshop Overview

| Metric | Value |
|--------|-------|
| Duration | 7 hours (10:00-17:00) |
| Team Size | 4 people per team |
| Scoring | 100 points + 15 bonus |
| Format | Hands-on labs + WDS |

---

## Block-by-Block Coaching Notes

### 10:00-10:15 | Welcome & Introductions

**Purpose**: Welcome participants (assumes Azure 101 pre-work completed).

**Your Actions**:
- Welcome participants, set expectations
- Explain the competitive scoring format
- Confirm everyone completed Azure 101 pre-work
- Quick Azure portal orientation if needed

**Common Issues**:
- Login problems → Check credentials, try incognito mode
- Can't see subscription → Check subscription filter

**Transition to Next Block**: "Now that everyone is comfortable with Azure, let's meet Contoso Bakery..."

---

### 10:15-10:30 | Scenario Introduction

**Purpose**: Set the context and form teams.

**Your Actions**:
- Present the Contoso Bakery scenario (use scenario-brief.md)
- Facilitate team formation (4 per team)
- Walk through ArcBox environment overview
- Answer questions about the scenario constraints

**Key Points to Emphasize**:
- This is a competitive workshop (leaderboard!)
- Real-world migration skills are the goal
- Teams should divide work effectively
- Hints are available — it's OK to use them

**Transition**: "You have 45 minutes to design your assessment strategy. Time starts now!"

---

### 10:30-11:15 | Challenge 1: Plan (WDS)

**Purpose**: Design assessment strategy and wave plan.

**Your Actions**:
- Circulate between teams
- Ask probing questions, don't give answers
- Watch for teams going off-track
- Time check at 30 minutes

**Coaching Questions**:
- "Why did you choose that order?"
- "What if this server depends on that one?"
- "How would you explain this to the CTO?"
- "What's your biggest risk?"

**Common Mistakes**:
- Ignoring dependencies → Ask "What happens if SQL is down?"
- Migrating everything at once → "What's your rollback?"
- Forgetting monitoring → "How will you know it works?"

**At 10 Minutes Remaining**: "Start wrapping up your whiteboard — take a photo!"

**Scoring During Break**: Use rubric to score whiteboards while teams take break.

---

### 11:15-12:30 | Challenge 2: Deploy Appliance

**Purpose**: Hands-on Azure Migrate appliance deployment.

**Your Actions**:
- Ensure teams can connect to ArcBox
- Guide through VHD download/import if stuck
- Help with appliance configuration issues
- Verify discovery starts before lunch

**Key Technical Checkpoints**:
| Time | Checkpoint |
|------|------------|
| 11:30 | Teams connected to ArcBox-Client |
| 11:45 | Azure Migrate project created |
| 12:00 | Appliance imported and starting |
| 12:15 | Appliance registered with Azure |
| 12:25 | Credentials added, discovery starting |

**Common Issues**:
- VHD download slow → Provide local copy if prepared
- Appliance won't start → Check memory, virtual switch
- Registration fails → Wrong key, pop-up blocked
- Host validation fails → WinRM not enabled, wrong creds

**Troubleshooting Priority**: Get ALL teams to "discovery started" before lunch.

---

### 12:30-13:15 | Lunch

**Your Actions**:
- Eat!
- Monitor discovery status (spot check)
- Score Challenge 1 and 2 deliverables
- Prepare for assessment challenge
- Review scoring so far

---

### 13:15-14:00 | Challenge 3: Assessment

**Purpose**: Create and analyze Azure assessments.

**Your Actions**:
- Verify discovered servers appear in portal
- Guide teams through assessment creation
- Help interpret assessment results
- Ensure teams export their findings

**Key Checkpoints**:
| Time | Checkpoint |
|------|------------|
| 13:20 | Discovered servers visible |
| 13:35 | VM assessment created |
| 13:50 | Results being analyzed |
| 14:00 | Findings documented |

**Coaching Questions**:
- "What does that readiness status mean?"
- "Why is the confidence rating low?"
- "Is that VM size appropriate?"
- "How will you use this data?"

**If Discovery Is Incomplete**:
- Show demo project with pre-discovered data
- Have teams work with partial results
- Emphasize this is normal (full discovery takes time)

---

### 14:00-14:30 | Challenge 4: Execute (WDS)

**Purpose**: Design migration execution strategy.

**Your Actions**:
- Ensure teams use assessment findings
- Guide tool selection discussions
- Probe on rollback strategy
- Watch for unrealistic timelines

**Coaching Questions**:
- "Why that tool for this workload?"
- "What if migration fails at 2 AM?"
- "Who approves the rollback?"
- "How long until rollback is impossible?"

**Common Mistakes**:
- No rollback plan → "What's your safety net?"
- Wrong tool selection → Ask about workload specifics
- Unrealistic timeline → "How many hours for SQL migration?"

---

### 14:30-14:45 | Break

**Your Actions**:
- Score Challenge 3 and 4 deliverables
- **PREPARE THE CURVEBALL**
- Set timer for 14:45 announcement

> ⚠️ **DO NOT reveal the curveball before 14:45!**

---

### 14:45-15:15 | Challenge 5: Curveball

**Purpose**: Test adaptability with surprise requirement.

**Your Actions**:
1. At exactly 14:45, make the announcement (see [Curveball Script](curveball-script.md))
2. Let teams absorb the news (1-2 minutes of chaos is normal!)
3. Guide teams to systematically address the requirement
4. Ensure all teams understand what's required

**Coaching Questions**:
- "Which servers handle customer data?"
- "What about your backups?"
- "How will you prove compliance?"

**Common Reactions**:
- Panic → "Take a breath. Start with impact analysis."
- Denial → "This is realistic — it happens all the time."
- Overcomplication → "Focus on the data, not everything."

---

### 15:15-16:00 | Challenge 6: Optimize (WDS)

**Purpose**: Cost optimization and governance design.

**Your Actions**:
- Guide cost estimation exercises
- Discuss Hybrid Benefit eligibility
- Probe on governance structure
- Introduce Azure Arc for hybrid

**Coaching Questions**:
- "Do you have Windows Server licenses?"
- "Which workloads are stable enough for RIs?"
- "How will you enforce policies?"
- "What about servers that can't migrate?"

---

### 16:00-16:45 | Challenge 7: Presentations

**Purpose**: Team presentations and objection handling.

**Your Actions**:
- Timekeeper (strict 8-minute limit per team)
- Each team has 11 minutes total (8 min presentation + 3 min objections)
- Deliver the 3 mandatory objections
- Score presentations using rubric
- Encourage peer appreciation

**Presentation Order** (4 teams):
| Team | Time Slot |
|------|-----------|
| Team 1 | 16:00 - 16:11 |
| Team 2 | 16:11 - 16:22 |
| Team 3 | 16:22 - 16:33 |
| Team 4 | 16:33 - 16:44 |

**Objection Delivery**:

After each presentation, deliver these objections (adapt wording):

1. **PaaS vs IaaS**: "I noticed you're migrating SQL to VMs. Why not Azure SQL Managed Instance? Wouldn't that reduce management overhead?"

2. **Rollback**: "Walk me through what happens if the web server migration fails during peak hours. Exactly what steps would you take?"

3. **GDPR**: "How can you guarantee customer data never leaves the EU? What about backup replicas and disaster recovery?"

**Scoring**: Use presentation criteria in rubric.

---

### 16:45-17:00 | Wrap-up

**Your Actions**:
1. Tally final scores
2. Announce leaderboard (with fanfare!)
3. Award prizes if available
4. Facilitate peer appreciations
5. Share key takeaways
6. Collect feedback forms
7. Run cleanup scripts

**Key Takeaways to Emphasize**:
- Azure Migrate is the starting point for any migration
- Assessment data drives decisions
- Rollback planning is essential
- Compliance surprises are real — build flexibility into plans
- CAF provides a proven methodology

---

## Coaching Phrases

Use these when teams are stuck:

| Situation | What to Say |
|-----------|-------------|
| Team is stuck | "What have you tried so far?" |
| Wrong direction | "What does the error message tell you?" |
| Need more info | "What would you need to know to decide?" |
| Conflict in team | "Both views have merit. How might you combine them?" |
| Running out of time | "What's the minimum viable deliverable?" |
| Asking for answer | "What's your best guess? Let's explore that." |

---

## Emergency Procedures

### Azure Portal Down
1. Use Azure CLI as backup
2. Show screenshots from solution reference
3. Adjust challenge focus to WDS

### ArcBox Not Working
1. Have backup environment ready
2. Use demo discovery data
3. Focus on design challenges

### Team Member Drops Out
1. Redistribute work among remaining members
2. Adjust scoring expectations slightly
3. Pair with another small team if needed

### Running Behind Schedule
| Cut from | Save Time |
|----------|-----------|
| Scenario intro | 10 min (read-ahead) |
| Breaks | 5 min each |
| Challenge 6 | 15 min (combine with C4) |
| Presentations | 2 min per team |

> 💡 Pre-work: Azure 101 should be completed before the workshop, so this won't impact the day.

---

## Scoring Tips

- Score during breaks when possible
- Use the rubric consistently across teams
- Partial credit is OK
- Document notes for debriefs
- Bonus points should be rare (truly exceptional)

---

## Post-Workshop

1. Ensure all cleanup scripts run
2. Collect and review feedback forms
3. Share final scores with teams
4. Delete temporary Azure resources
5. Debrief with co-facilitators

---

## Thank You!

Thank you for facilitating this workshop. Your guidance helps IT professionals build real-world Azure migration skills.

Questions? Contact the workshop developer.
