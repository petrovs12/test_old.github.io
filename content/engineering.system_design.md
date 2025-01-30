---
id: r6kyo15mbz0w0vbraervbb9
title: TL;DR Path For Interview
desc: ""
updated: 2024-12-15T22:35
created: 1641827611219
---
Read and practice from either [this system design Interview book](https://www.amazon.de/-/en/Frank-Kane/dp/B09M172JQK/ref=sr_1_1?crid=24YZRAKE14LBZ&keywords=mastersystem+design+vorstellungsgespr%C3%A4ch&qid=1647079294&sprefix=sennheiser+450bt+battery%2Caps%2C92&sr=8-1)

or the grokking course
<https://www.educative.io/courses/grokking-the-system-design-interview>
If using the course, maybe jump between the case studies and the concepts towards the back.
from here or the system design interview book, read the concepts first, then go trough the use cases one by one and when you don't understand something, google around.
After reading through 3-4 of the design use cases, try to replicate by doing them in the drawing tool for the interview. Rinse and repeat.

[Designing Data-Intensive Applications](https://dataintensive.net/) is also great, but maybe a bit of a longer-term read, deepening on your background and time.

# My Study Path

0. Watch some youtube videos to get a feel of goal.
   These are good ones:
   [Design Messenger](https://www.youtube.com/watch?v=uzeJb7ZjoQ4&ab_channel=Exponent)
   [Design Build System](https://www.youtube.com/watch?v=q0KGYwNbf-0&ab_channel=Cl%C3%A9mentMihailescu)

1. Join a discussion group. 

2. [Grokking is pretty classic](https://www.educative.io/courses/grokking-the-machine-learning-interview).
   Can do the free trial and or get the pdf for free
    Read trough it. I [this system design Interview book](https://www.amazon.de/-/en/Frank-Kane/dp/B09M172JQK/ref=sr_1_1?crid=24YZRAKE14LBZ&keywords=mastersystem+design+vorstellungsgespr%C3%A4ch&qid=1647079294&sprefix=sennheiser+450bt+battery%2Caps%2C92&sr=8-1) was a bit better, but maybe it was ergonomic issue(reading on kindle).

3. When I would hit a point I don't understand re: performance and choice of DB, I would go around to google stuff about sql/nosql/ usage patterns of different DB's.
   Some notes here:
   [[engineering.system_design.nosql databases]]
   Some nice Quora Discussions/blogs I've found:

[RDBMS-over-nosql](https://www.quora.com/What-are-some-reasons-to-use-traditional-RDBMS-over-NoSQL>)
[Relational-Disadvantages](https://www.quora.com/What-are-disadvantages-of-relational-databases)
[Time Complexity of Joins](https://www.quora.com/What-is-time-complexity-of-Join-algorithm-in-Database?share=1)
[Logs and Real Time Data](https://engineering.linkedin.com/distributed-systems/log-what-every-software-engineer-should-know-about-real-time-datas-unifying)
[Shopify Data Store Blog](https://shopify.engineering/five-common-data-stores-usage)

Papers:
[Google Big Table Paper](https://static.googleusercontent.com/media/research.google.com/en//archive/bigtable-osdi06.pdf)

3. Practice the drawing tool you'll use during the interview. Do a bunch of drawings/designs with it.


4. Rememeber to mention [[engineering.system_design.CAP and PACELC Theorems]].

5. Remember to mention that if scalability is required and you turn out to need joins, you can always outsource the joins etc to the application logic.

Think about if you need very fast reads and writes, and how this trades off against correctness

Notes and references here:

[log based workflow](https://onedrive.live.com/redir?resid=A6A13EED7FFACAB8%212256&page=Edit&wd=target%28Quick%20Notes.one%7Cb7e7d858-e5f0-4801-9d21-c506078b696a%2FSystem%20design%20and%20logs%7C468f4191-cdbc-7440-b035-e8581ff8b933%2F%29)

<https://onedrive.live.com/redir?resid=A6A13EED7FFACAB8%212256&page=Edit&wd=target%28Transmetrics%20Clieant%20Projects%2FNew%20Section%208.one%7Cc346bbda-ef84-4637-8db7-5b2328e31011%2FManage%20massive%20writes%20with%20HA%5C%2FDR.%20-%20A%20%7C65627e1e-3a4b-4e06-a3df-7d4a7968a69f%2F%29>

# Basics

## Single- Server Design

<div class="mermaid">
  graph LR;
a[Clients]--network--&gt;b["Server(compute and DB)"];
c[Single point of failure]--&gt;b
</div>

 Single point of failure is bad

<div class="mermaid">
  graph LR;
a[Clients]--network--&gt;b["Server(compute and DB)"] &lt;--&gt; f[DB];
c[Single point of failure]--&gt;b
c[Single point of failure]--&gt;f

</div>

not any better

Vertical Scaling - buy bigger server, has limits.

Horizontal Scaling - buy more servers, larger limits.

Geo-disitrubtion of servers.

 _Any individual server cannot assume that that server is the same one that served previous requests to a given user. That's what I mean by stateless._

Different Data centers (availability zones in AWS).

# DB Replication

## Cold Standby

<div class="mermaid">
  graph TD;
a[Clients]--network--&gt;b["Server(compute and DB)"] &lt;--&gt; f[DB];
c["DB Replica"]
c--periodic backup--&gt;f
</div>

Downtime; backup files to restore with, data since last backup is lost.

## Warm Standby

<div class="mermaid">
  graph TD;
a[Clients]--network--&gt;b["Server(compute and DB)"] &lt;--&gt; f[DB];
c["DB Replica"]
c--"replication (copy-on-write-constantly)"--&gt;f
</div>

Most Database systems have their own replication mechanisms.
**Replication** is a process of copying data from one database to another. For most practical cases, 
it's just a switch you turn on...

## Hot Standby

<div class="mermaid">
  graph TD;
a[Clients]--network--&gt;b["Server(compute and DB)"] &lt;--&gt; f[DB];

c["DB Replica"]
c--"replication (copy-on-write-constantly)"--&gt;f
b-.if primary fails.-&gt;c
</div>

<div class="mermaid">
  graph TD;
a[Clients]
b["Server"];
c["DB"];
d["DB Replica"];
e["Load Balancer"]
a--network--&gt;b--&gt;e-.-&gt;c
e-.-&gt;d
</div>

## horizontal

