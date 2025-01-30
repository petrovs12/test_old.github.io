---
id: 3lvwzzzikq7yj1lq1xabr47
title: excalidraw
desc: ""
updated: 2024-12-15T22:35
created: 1732207269682
---
## *  Added 'fast estimates' of whether experiments will be scheduled
* Added 'overlapping experiments' to see what experiments overlap in traffic
* Added limited version of 'how to change experiment settings to be scheduled'  'How many segments will fit in a batch'
*  improved ability of small experiment owners to identify conflicting experiments, view traffic estimates quickly, and get recommendations how to change setup in order to get scheduled.  

* increasing [small experiment throughput](https://fburl.com/daiquery/4n90bmhi) by 140% Q4_2023-13.15/batch, Q12024-13.2 Q2-31.7 (without changing constraints).
*  Still bugs and escalations, including to a D2.
* Record numbers of CS BQRT Experiments scheduled 
  ![[Pasted image 20240902123724.png]]

### 
**

- Assumes nothing changes in the characteristcs of the traffic, but only of the batch. 
- Given candidate experiments of a batch, figure out a forecast probability of assigning a given adunit to an experiment (justified by the claim/observation that adunits are in [equilibrium wrt custom flags](https://docs.google.com/document/d/1LZzI4-iJ04iEJ32xkUsN_FHwFzM01YdNXFmihcGkRIc/edit#heading=h.wdne1s81v88t)) 
    
- Given these probabilities, compute metrics on the forecasted traffic for experiments, and put guardrails on those.
    

*output: dim(A) = [|ad_unit|,|csbqrt experiments_within_a_batch|] 
Key Problem To Assignment Summary; dimred


We start up with a matrix of the kind:dim(A) = [|ad_unit|,|csbqrt experiments_within_a_batch|] (see cs_bqrt_estimator_eligibility_results)
We want a matrix A1, non-negative, entries, s.t.:k is ‘small enough’, latent space, like 20-100.dim(A1) = [k,|csbqrt_experiments|]# overall traffic is preserved, i.e.
A.T*ones(|ad_units|) = A1.T*ones(k)Interactions between experiments (competition for traffic) is preserved as much as possible
Min ||A.T*A-A1.T*A1||
/

### 
