---
id: ke2szb94vrbo16e4vbux4gp
title: Designing Uber Backend
desc: ""
updated: 2024-12-15T22:35
created: 1641907099456
---

[Uber Backend](https://docs.google.com/drawings/d/1-kZWlP49_xPPXh3CmE_7g8WLbHwE2p6at4iVpGxwJj0/edit).



![[science.CS.algos.Data Structures.Quad Tree]]

We can use this to store the "long-term locations" of all drivers. 
Updating it might be a bit costly, as they constantly move around, BUT we can do as follows:

When a user requests a ride, we can check top drivers in their area and see their location in the quad-tree. Say the quad-tree is updated every minute or 15 seconds. 

In addition, every driver sends their current location back every 3 seconds, but this is not reflected
in the quad-tree as often, as it's a bit expensive to update.

Every driver represents a topic in a [[engineering.technologies.Message Queues]], to which topic all
customers, interested in them, are subscribed (via the mobile client).

Thus a rider can request more general info on all drivers from the quad-tree (every 15 seconds), but 
can track the locations of drivers they are subscribed to much more efficiently (every 3 seconds).

These subscriptions will be normally terminated when a ride is confirmed.
