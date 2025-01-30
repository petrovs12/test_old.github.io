---
id: qnfezr8qewoc56dyb336a0x
title: Dropout
desc: ""
updated: 2024-12-15T22:35
created: 1646298559034
---


Dropout:
1. At training time, in each training epoch, drop out nodes/connections randomly by setting their weights to zero.
Each node weight is set by 0 with probability $p$.
2. At testing/inference time, multiply each learned weight by $p$.

Justification:
We 'stochastically train' simultaneously $2^{|NN|}$ models,where $|NN|$ is the network size.
Thus at the end of training we may pretend we have $2^{|NN|}$ candidate models. That is, we can drop any number of nodes and still have a model.
Now, ideally, on inference time, we may :
For each subset of nodes, disable them, and predict on the basis of the rest, and then take the average.
But this is obviously infeasible.  So we approximate their 'model average' by **multiplying the weights by $p$**.

