---
id: wqlyh8nqtevfct213thmgu5
title: Consistent Hashing
desc: ""
updated: 2025-01-26T11:56
created: 1641933783321
---


 ## Motivation:
 We have a stream of BLOB objects, and want to assign them to $n$ servers in a 'uniform' way. We also want to ensure that
 if a server is added or removed, the 'movement' of objects is not too much. In particular, if we add or remove a server we want only
 about $1/n$) of the objects to move around.

 Idea:
 Use a hash function that assigns both objects and servers to points in the unit circle. So $f:A->[0,2\pi]$, for both servers and objects.
 Then assign each object $o$ to the closest server *counterclockwise* of $f(o)$. 
 If a server is added or removed, it's obvious then what to do. 
 1. If added- only move objects __from__ the first one counterclockwise to it (and only those needed)- those are $\approx O(1/n)$. 
 2. If removed -  move all objects __to__ the first one counterclockwise-all of them. Those are also about $O(1/n)$ 
3. Have the load balancer know about the ranges of servers;
4. the rebalancing operation is performed at server removal as part of the normal shutdown process.
5. to avoid hotspots and lack of system availabbility when a server shuts down, we we replicate to the next k servers (clockwise)
6. Each physical server is replicated to k virtual nodes around the ring, randomly. when the application happens, we replicate only to the unique servers.
7. We optimise the number of virtual notes that the capacity desired replication rebus nest and number of keys.
cx


![[engineering.system_design.Consistent Hashing 2025-01-07 11.38.56]]