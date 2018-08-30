# Triage questions

- What is the business impact?

  We need to look beyond the technical aspects and understand the impact on the the goal of the org

- Is it actually a (business) problem?

  Are we out of SLO? If we don’t have a SLO, are we out of baseline? Is there a change in product requirements (making the baseline an issue)?
- Should this be handled?

  Does it make an economical sense? Will it resolve itself if we just wait?
- When should we handle this? (now, later, never)

  Is now (e.g. midnight, weekend, ...) the right time? Maybe we should wait for some traffic pattern? Maybe we should do it during working hours
- Should we remediate and investigate later?

  Often we can choose to do "just enough fixing" without fully debugging the problem and leave the investigation for later. But sometimes this means debugging will be much harder later on.
