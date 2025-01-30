---
id: jprgkxqmpp5sxs6ars17qk8
title: Traffic Estimation
desc: ""
updated: 2024-12-15T22:35
created: 1728857949969
---

See the basic assumption in [[CSBABT Scheduling_ Onboarding Regular and Clustered Types#How]] - equilibrium of the adsets.

Here are some documents about how the traffic estimations work:

![[Pasted image 20241014003357.png]]
It's basically a simulation/simulation.

## Deterministic Allocation
To account for longer running experiments without making them grow indefinitely, consider implementing a checkpointing mechanism. This involves periodically saving the state of the experiment, allowing it to resume from the last checkpoint in case of interruptions. Additionally, use efficient data structures and algorithms to manage memory and processing time effectively. By doing so, you can ensure that the experiment remains manageable and does not consume excessive resources over time.

To manage the allocation of segments to experiments, review the last few batches. Allocate segments to the experiments from these batches. If the experiments are not running yet, allocate the segments in a way that ensures the longevity of the experiment.
By doing this, you ensure that long-running experiments receive new ad units as if they were running in their original batch, maintaining consistency and fairness in the allocation process. This approach helps in balancing the load and prevents any single experiment from monopolizing resources over an extended period.

The pseudocode for this allocation algorithm is as follows:
```
for each batch in the last few batches:
  for each adunit in the snapshot:
    for each experiment in the batch:
        if we do allocation for the first time for an experiment:
            allocate segments to the experiment based on the batch and available segments for the adunit
    if experiment expired:
        free up segments of the experiment for the adunit
```
[Kisun's presentation](https://docs.google.com/presentation/d/1JergwiNcVhMV6rD5JEbEzUNWAqQMUbTwn2Okzyp5Emw/edit#slide=id.g218c85231ee_0_244).

