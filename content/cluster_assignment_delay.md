---
id: uhx9igco6zsn9b2bg0emor8
title: Cluster_assignment_delay
desc: ""
updated: 2024-12-15T22:35
created: 2024-08-30T10:35
---
```mermaid
graph TB;

a[AdPublisher] 

a--'every 30 minutes'-->l

subgraph l[AssignmentToCSBQRT]
b[Is Cluster Assigned hypothetically for adunit]
b--yes-->
c[Assign based on priorities]


end
c-->f[Ad is assigned and usable in CS]

b--no--> a
inc[Incremental Assignment]
inc--'every 4 hours'-->b
```