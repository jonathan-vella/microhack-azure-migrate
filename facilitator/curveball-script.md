# Curveball Script

> ⚠️ **CONFIDENTIAL** — Do not share with participants until 14:45!

---

## Timing

**Announce at exactly 14:45** — After the lunch break and Challenge 4.

---

## Setup

1. Get everyone's attention
2. Ask teams to pause what they're doing
3. Deliver the announcement with appropriate gravitas

---

## The Announcement

Read this aloud (or adapt to your style):

---

> **Facilitator**: "Everyone, can I have your attention please? I have an urgent message for all teams."
>
> *[Pause for attention]*
>
> "I've just received an email from Contoso's IT Manager. I'll read it to you now..."
>
> ---
>
> **Email from IT Manager:**
>
> *"Team,*
>
> *I've just concluded a meeting with our Legal and Compliance departments regarding our Azure migration.*
>
> ***Effective immediately**, all customer data, financial records, and personally identifiable information must remain within the **European Union** to comply with GDPR requirements.*
>
> *This includes:*
> - *Customer database records*
> - *Transaction logs*
> - *User authentication data*
> - *Any backups or replicas of the above*
>
> *Please update your migration plans accordingly. I need confirmation that our architecture addresses this requirement before we can proceed.*
>
> *Regards,*
> *IT Manager*
> *Contoso Bakery"*
>
> ---
>
> *[Pause to let it sink in]*
>
> **Facilitator**: "So... it looks like you have a new constraint to work with. You have 30 minutes in Challenge 5 to analyze the impact and update your migration plans. This challenge is worth 10 points."
>
> "The challenge instructions are in your `05-curveball.md` file. You may reveal the hidden content now."
>
> "Time starts... now!"

---

## After the Announcement

### Expect These Reactions

| Reaction | Your Response |
|----------|---------------|
| Groans/laughter | Smile — this is intentional! |
| "We already planned for EU!" | "Great foresight! Document how." |
| "This changes everything!" | "That's real life. Start with impact analysis." |
| "Is this fair?" | "100% fair — it's worth 10 points and tests adaptability." |
| Confusion | Point to 05-curveball.md |

### Coaching During Challenge 5

Walk around and guide teams:

- "Which servers definitely have PII?"
- "What about your backup strategy?"
- "How will you prove compliance to an auditor?"
- "Don't forget about logs — do they contain customer data?"

---

## Why This Curveball?

Brief talking points for wrap-up discussion:

1. **Real-world relevance**: Compliance requirements often emerge mid-project
2. **Adaptability is key**: Plans must be flexible enough to accommodate change
3. **Impact analysis**: Start with what's affected, then design solutions
4. **GDPR is common**: Any EU business migration will face this

---

## Alternative Curveballs (for future workshops)

If you've run this workshop before and want variety:

### Option B: Cost Reduction

> "The CFO just reviewed the cost estimates and is requiring a 30% reduction from your original figures. Re-evaluate your architecture."

### Option C: Discovered Dependencies

> "We just found documentation that the SQL database has an undocumented dependency on an external Oracle database in the UK office. This was not in the original scope."

### Option D: Security Incident

> "Contoso's IT Manager detected suspicious activity. All migrations are paused until you can demonstrate that your plan includes proper security controls."

---

## Scoring Notes

Challenge 5 is worth **10 points**:

| Criterion | Points |
|-----------|--------|
| GDPR impact correctly identified | 3 |
| Plan adapted appropriately | 4 |
| Data residency clearly addressed | 3 |

Be generous if teams show good thinking, even if execution isn't perfect.

---

## Debrief Points

In the wrap-up, highlight:

- Which team adapted most quickly?
- What did teams miss (usually: backup locations, log data)?
- How would they handle this differently in real life?
- The importance of asking about compliance EARLY in discovery

---

**Remember**: The curveball is meant to be challenging but fair. It rewards adaptability and critical thinking!
