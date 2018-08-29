# Triage exercise, player 2
The point of this exercise is to train ourselves in doing triage.
You are reporting a problem to the engineer on call which will do the triage. Normally, you would try to provide as much information as possible up front, but for the purpose of this exercise we ask that you refrain from it. Be brief and answer only what you are directly asked for.
We expect you to make some data up, that's fine. The goal of this exercise to practice asking the right *questions* - the answers aren't as important.

## Background
You are working in a company providing hosting user websites (think Wordpress). You have clients from around world which are building and managing websites and users browsing the websites. There are several prominent blogs and independent news sites hosted on your system. The system is fully hosted on AWS.

# Scenario I
It's Thursday 4:00AM, a monitor alert triggered reporting that a service has failed

- The service is called "the cleaner"
- This service appears to be cleaning old EBS snapshots from S3
- The EBS volumes in question are 1TB each, the snapshot creation rate is ~ 50 snapshot/day

# Scenario II
It's Friday 17:00AM and support personnel are reporting several users complained their site does not load

- Support personnel were not able to recreate the issue
- One engineer who happens to be in Saint Petersburg reports that the site in question do load
- In fact, no sites hosted on your platform are loading for that engineer

# Scenario III
It's Monday 9:00AM. You get an alert from the monitor your service is "slow". Slow in this context means an [APDEX score](https://en.wikipedia.org/wiki/Apdex) < 0.7 and satisfaction threshold of 300ms (you can treat it as arbitrary, read ahead).
After preliminary investigation you find the source of the problem is a slow RPC call to one of your backend services - avg latency jumped from 50ms to 150ms and p99 from 400ms to 420ms. Player 1 is the engineer responsible for the backend service in question.

- There is no SLA/SLO for either service
- It's not clear who setup the alert or why APDEX was chosen as the SLI
- Your system is serving RSS feed of the sites

# Scenario IV
It's Tuesday around tea time (4PM), you just had your first scone when you get a message from your friend at the whitehouse that first contact with Aliens has been established!!!

- All metrics look fine. No alerts fired
- The news and your twitter feed are silent... for now
- You have no confirmation for your friends info
