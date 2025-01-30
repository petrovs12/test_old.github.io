---
id: d8u9yotolz54d5x3jk5yacs
title: Summary
desc: ""
updated: 2024-12-15T22:35
created: 1732207269637
---
## \*  Added 'fast estimates' of whether experiments will be scheduled

- Added 'overlapping experiments' to see what experiments overlap in traffic

- Added limited version of 'how to change experiment settings to be scheduled'  'How many segments will fit in a batch'

- improved ability of small experiment owners to identify conflicting experiments, view traffic estimates quickly, and get recommendations how to change setup in order to get scheduled.  

- increasing [small experiment throughput](https://fburl.com/daiquery/4n90bmhi) by 140% Q4_2023-13.15/batch, Q12024-13.2 Q2-31.7 (without changing constraints).

- Still bugs and escalations, including to a D2.

- Record numbers of CS BQRT Experiments scheduled 
  ![[Pasted image 20240902123724.png]]

\*\*

- Assumes nothing changes in the characteristcs of the traffic, but only of the batch. 
- Given candidate experiments of a batch, figure out a forecast probability of assigning a given adunit to an experiment (justified by the claim/observation that adunits are in [equilibrium wrt custom flags](https://docs.google.com/document/d/1LZzI4-iJ04iEJ32xkUsN_FHwFzM01YdNXFmihcGkRIc/edit#heading=h.wdne1s81v88t)) 
    
- Given these probabilities, compute metrics on the forecasted traffic for experiments, and put guardrails on those.
    

\*output: dim(A) = [|ad_unit|,|csbqrt experiments_within_a_batch|] 

### Key Problem To Assignment Summary; dimred

We start up with a matrix of the kind:dim(A) = [|ad_unit|,|csbqrt experiments_within_a_batch|] \(see cs_bqrt_estimator_eligibility_results)
We want a matrix A1, non-negative, entries, s.t.:k is ‘small enough’, latent space, like 20-100.dim(A1) = [k,|csbqrt_experiments|]# overall traffic is preserved, i.e.
A.T_ones(|ad_units|) = A1.T_ones(k)Interactions between experiments (competition for traffic) is preserved as much as possible
Min ||A.T_A-A1.T_A1||
/

### Scheduler Summary

**![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfEFpCiSkKaw5HYXTXU0YVk74ZaV59Cg07K_vDakNdpKpQuNvIt9_PykbkGXCY5tmGVD8g9CbiL1opiBo7js2F8CGSUKxAigD3rnw_Lyf15h1wOlsnXdzcuArBE3kxNnD5_Xa7VTR8C2J0tbsOdWKgoUlrA?key=VLzcQB3KlDImIatGlW-HlQ)**

**![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdnWChfThsZVFC3BO0NB-wnc3i-vt0P8KlZ_RTGNm91FxdXTJWaxiKD64JaTnJppC-BwirZLcl1FxAHkpH0Qea7h0mr-zXk8oFsBRWeBQcbspQxQf_AHpTJETYvwI_PbZKaR2OK8Sb8AEb2209c1cHMO9Xf?key=VLzcQB3KlDImIatGlW-HlQ)**
Observability Tooling Summary
Added:

- Faster estimates
- How many segments will fit in a batch
- Overlapping estimates

Is this maybe experimental learn how to schedule themselves and resolve their conflicts because maybe we cover week conflicts are similar.

Interactive Scheduler

# Prospective Solution and Corrective Actions

## Continuum between batch processing, and online processing

### Batch Processing with solution stickiness

We call the current prospective solution the set of scheduled experiments with priorities If the batch to start now. this prospective solution is calculated often and the previous prospective solution is a regular ration term of optimization function.  If a new solution has a significant difference with a previous one for example changing the schedule start time movement the owner is notified.  

# Overall Scheduling Flow

This is a recommendation on how to proceed (ideal state, if FEASIBLE).

- Batch release Tuesdays.

- Experiment change cutoffs sunday.

- 'final scheduler' run on Monday morning.

- users can escalate Monday.

## Prospective Solution, Calcluated hourly

### User comms

- ping owners if big changes, with solution diff for major decision changes.

- Make the message such that its clear what can change. In particular, send message about experiments that can be extended/booked and can tAke big chunks of traffic- long running experiments, and unbooked clusters.

- Under above caveats, multi-week estimation is possible, with risks articulated relatively clearly.

### Weighting extensions vs Solution mstability

If i booked an experiment 3 weeks ago, and someone tries to extend, should the extension be accepted automatically?

### Booking in advance can increase weight in the objective function, similar to ' min/max' start date

Min/max start date.

### Regularizing factor, preventing flip flops, soft prioritization mechanism

Persist a 'current solution', which is consultative, and communicate changes to it to customers if they get out of it. This is recomputed every hour.

Connect 'current solutions' over time by adding a regularization term to the objective function, adding a minimization term about $x_{i,w}$ and $y_{i,w,t}$ for the current solution with a small coefficient- this will ensure the solution wont jump about without strong improvement to the optemization function. It should reliably break ties. Details tbd, for example perhaps the regularization penalty should include also $\Sigma_{t=1..T} (x_{i,t})$ to make it softer for regulization

### Final solution and escalations

The final solution is calculated in the same way as the 'current solutions'.

## Experiment Creation

User creates an experiment.

After the preview stage, there is a simple check against the 'current solution'.

# Model Additions And User Requirements

Here we list features we can and should add directly to the above model in order to model currently existig, currently planned, and other requirements.

## Boundary Conditions

The role of these is to ensure continuity, take into account long running experiments, etc.

### Taking into account currently running experiments

This goes into the model directly as new inputs:

( set of running experiments with their traffic profiles)

and affect the optimization in an obvious way via constraint

(Traffic supply not overused) on the right- hand side

## Extensions

Recommended way to handle, maybe currently we have like 5 a week.

### Owner notification

# Modelling 'User-Model Interactions', i.e. forcing stuff, model

The following calculations vs the 'current prospective solution' are simple checks that we can do easily (especially in the context of dimensionality reduction).

## Notifications

### Overall notification flow

## Experiment Overlap

exists, handle as it is handled now, in memory.

## Priority Swap, experiment swap

Use case and user flow:

Note: the functionality bellow to be exposed as a 'consultative one', i.e. just check a what-if scenario as well.

A user looks at the prospective solution, wants to get their experiment in.

#### Minimal subset to get in

From the traffic matrix, directly calculate a minimal subset of experiments to remove, such that this experiment can get in.

Implementation: solve the same problem as the usual but without other candidate experiments, and with the added constraint this experiment is in ( $x_{i,t}==1$), objective function is sum(x for x in current solution).

Output:

List of experiments, excluded. User can negotiate wiht owners to postpone them.

Additional functionality:

do it for a subset of experiments.

They mark some experiments (if their own, no conformation, if others, have to get a conformation in a form).

## Priority Swap, experiment already in

Use case- user's experiment is IN the prospective solution asks: hey, this one gets more traffic than me, I want to see what happens if I would swap, and then swap (if my experiments) or ask to swap.

In the model, this can mean 2 things:

1. I get at least the traffic, 'booked' by the first experiment.

2. I get at least the PERCENTAGE of traffic, booked by the first experiment.

both are modelabble by using the same objective function as in the priority swap, and adding constraints on the $y$ variables, comparing to the results of the previous solution.

e.g. in case 1)

$trafficMatrix_{i_1,w,t}*y_{i_1,w,t}>=trafficMatrix_{i_1,w,t}*prevY_{i_1,w,t}$

in case 2)

$y_{i_2,w,t}>=prevY_{i_1,w,t}$

in case 2 we might get some rejected experiments we have to get consent by.

## How many segments will fit in a batch

Calculate directly against current solution, calculate min nonzero $ceil(y_{i,t,w}/2)/$ - this is the number of segments to request
O

