# Triage exercise, player 1
The point of this exercise is to train ourselves in doing triage.
You are reporting a problem to the engineer on call which will do the triage. Normally, you would try to provide as much information as possible up front, but for the purpose of this exercise we ask that you refrain from it. Be brief and answer only what you are directly asked for.
We expect you to make some data up, that's fine. The goal of this exercise to practice asking the right *questions* - the answers aren't as important.

## Background
You are working in a company providing a web based financial accounting service. Your clients are using this service (mostly Monday to Friday 8am-6pm) to manage their business finances and accounts.

# Scenario I
It’s Wednesday early morning (2:00 AM), and you are calling as a support personnel to report that "the service" is down.
What exactly is down is unclear at this point. All you know is that clients complain (since half an hour ago) they cannot perform various operations and that your own attempts to complete business flows have failed.

- Throughput dropped to zero
- All business critical services are down
- We learned about the problem through the support team from client complaining

# Scenario II
It's Saturday morning (9:30 AM) and you're paging the engineer on call regarding an alert. A disk failed in the primary database server.

- If the database becomes unavailable the system will be down
- Performance degradation of the database will have adverse effects on system performance
- The disk is part of a RAID 6 array which is now unhealthy (but still operational, RAID 6 can tolerate up to 2 disk failures)
- The database has a slave which is healthy


# Scenario III
It's Friday night (7:00PM) and you're reporting an alert "no disk space"

- The disk in question is the storage disk of a Redis server
- The Redis server is being used for PUB/SUB of monitoring data
- FYI Redis PUB/SUB is not persistent

# Scenario IV
It's Tuesday noon (11:30AM), we got a call from a NOC team regarding errors in RabbitMQ metrics

- There was a spike of errors for producers and consumers, but metrics are normal now
- The RabbitMQ master server failed-over to the slave
- The new master is working normally now
- The previous master’s power supply failed
- The current master is in another rack
