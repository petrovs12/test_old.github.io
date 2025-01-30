---
id: xdh2u4upor86joascnq2wqk
title: Mathematical Model for CSBQRT Scheduler
desc: ''
updated: '2024-11-21T10:10'
created: 1728891034814
---
We want to write down a model description for the csbqrt scheduler+traffic allocation algorithm. We call out current and possibly future properties the platform/model should have, while considering the existing implementation of the backend allocation, user-facing features, and overall customer expectations.

We are developing our scheduling system as a Mixed Integer Linear Program (MILP) that takes as inputs  traffic requirements of different experiments, their earliest and latest possible start dates, and classifications indicating whether they are urgent, clustered, regular, or small. In the future, the system may also accommodate additional requirements such as custom power requirements and preferences regarding traffic selection bias.

 The mathematical model is designed to schedule experiments several weeks in advance, allowing for rescheduling to subsequent weeks if an experiment cannot be accommodated in the current week. Our objective is to optimize a function (detailed below) that balances KPI's. The key inputs, decision variables, and constraints of the model are outlined bellow

# Assumptions/Risks

Traffic dimensionality reduction works (link to doc and evaluation attached).

Can handle "very small experiments" - up to 1000 requested campaigns with small# of impressions (tbd how, there are options).

# Dimensionality Reduction Part

The dimensionality reduction part is described in detail here:
![[CSBQRT.Scheduler.Dimensionality Reduction Details#Dimensionality Reduction]]

# Base Model

i∈I: Set of experiments

w∈W: Set of weeks

t∈T: Set of traffic types (subject do dim reduction)

Parameters

$trafficMatrix_{i,t}$: Traffic profile of experiment $i$ for traffic type $t$. each entry $\leq 1$

$availableTraffix_{i}$ available traffic supply for type $i$ ( assume its the same over the weeks).

$teamAssignment_i$ - which team does the experiment belong to.

$teamQuota_i$ - total quota per team does the experiment belong to.

## Decision Variables

$x_{i,w}\in {0,1}$ - experiment i scheduled in week w

$y_{i,w,t}\in[0,1]$ partial traffic assigned to experiment i in week w for traffic type t. 

$z_{i,w,t}\in [0,1]$ - penalty for traffic deviation from the requested traffic profile.

## Objective function (tbd)

maximize linear combination of 
total assigned traffic and total number of experiments, scheduled

$max \alpha\Sigma_{i,w} x_{i,w}+\beta \Sigma_{i,w,t} y_{i,w,t}$

## Basic Constraints

### An experiment can only be scheduled at most once:

$\Sigma_{w\in W}x_{i,w}<=1,\forall w\in W, t\in T$

### Traffic supply not overused

$\Sigma_{i \in I} y_{i,w,t}<=availableTraffix_{i}   ,\forall w\in W, t\in T$

### Team quota

$\Sigma_{i \in I|  teamAssignment_i=t,w\in W, t\in T} y_{i,w,t}<=teamQuota_i$

## 'Good experiment'/Business Goal Constraints

### Total volume of traffic if scheduled >=80% ( tbd)

$\Sigma_{t\in T} y_{i,w,t} >= \lambda *\Sigma_{t\in T} trafficMatrix_{i,t}*x_{i,w}, \forall w\in W,i\in I$

### Traffic Selection Bias Constraints

We want to add a constraint that makes the traffic received in distribution similar to one requested, along certian key dimensions. 

The goal of the traffic selection bias was made clear in the [[Clustered CSBQRT]] project and constraints, and it further makes the clusters more similar to Full BQRT. Most important category to balance is 'Advertiser Country', for others see features in the columns of [Cluster_summary_stats_multifeatures_v1](https://fburl.com/data/41xrrytq)). 

In addition, we may use:

- data from intentions
- breakdowns selected for the particular experiment

In the Scheduler, we want to make sure the deviation (measured by $\chi^2$ ) of the traffic received, and global traffic, is limited along these key categories. 
![[Chi2 Illustration.svg]]

#### Traffic Selection Bias Estimation for the Dimensionality Reduced Traffic Profiles

 We already can project adunit sets to these dimensions, as in the Cluster_summary_stats_multifeatures_v1 table, and e.g. intentions feature 
 Note that `trafficMatrix` variable captures the projection of each experiment setup along the latent dimensions. Specifically, each row in `trafficMatrix` represents a dimensionally reduced representation of an experiment's traffic profile.

$f(adset)\rightarrow trafficVector$ - this is the 'dimensionality reduction', e.g. [D62022067](D62022067).

$g(adset)\rightarrow \textbf{Distribution Along Interesting Dimensions}$ - this part is implemented in the pipeline for **Cluster_summary_stats_multifeatures_v1** table.

We want to compute these distributions for a dimensinally reduced vector, i.e. 
$g(f^{-1})$

However, in the NMF dimensionality reduction setup, $f$ is a linear operation, implemened by a matrix( the $W$ in $E=WH$), so we can directly invert it.

As a reminder, $E$ here is the eligibility matrix with adunits as rows, and observed experiment setups as columns. 

### Chi-Squared Distance Constraint

We would like to use the chi2 distance for this, defined as follows:
$ \\chi^2 = \\sum\_{i=1}^{n} \\frac{(O_i - E_i)^2}{(E_i+O_i)} $

where $O_i$ is the observed frequency and $E_i$ is the expected frequency.
,
In a linear/mixed linear program, we have to linerize chi2 - based contstraints. [Code pointer](https://www.internalfb.com/code/fbsource/[3d0553a64ffe]/fbcode/fblearner/flow/projects/clustered_csbqrt/cluster_balancer_new.py?lines=47) for how this is done now to create the clustered experiments.

### Smoothness of quota spent

spent quota for the period is at least some % of the remaining team quota.
the function $k(x,t)$ tbd - I recommend it to be determined via simulation of the past quotas and demand,
and figuring out what are the confidence intervals if teams are attempting to uniformly place requests troughout the half.

$\Sigma_{i \in I|  teamAssignment_i=t,w\in W, t\in T} y_{i,w,t}>=k(teamQuota_i, len(T))*(teamQuota_i)$

### Modelling Urgent Experiments

#### Variant 1- recommended

We can model urgent experiments by upping their weight in the objective function so that it's >> non-urgent
 e.g. 5, 10, or 100. The bigger we make it, the more we ensure it is correct, but may run into suboptimality issues (due to integrality gap). 

Sample Implementation:

```python
weight_urgent = 10
weight_non_urgent = 1
allocations_urgent = [0,1,2]  # Example allocations for urgent experiments
allocations_non_urgent = set(range(len(x)))-set(allocations_urgent)  # Example allocations for non-urgent experiments
# Objective function
objective = [(weight_urgent if i in allocaitons_urgent else weight_non_urgent)*x[i] for i in range(len(x))]
```

#### Variant 2 - solve in 2 stages

Also a good option, has the advantage of faithfully implementing the concept of urgency.
A con will be that it may be suboptimal.

Solve the problem with only urgent experiments as candidates (e.g. by setting constraints for all non-urgent experiments `x[i]==0`,), re-build the problem with the allocated urgents having new contstraints `x[i]==1`,  and re-solve.

### Modelling Deadlines, not letting people wait too much

Recommendation: add an exponentially increasing term to the objective funciton, based on current queue time.
The term can be increasing linearly, sub-linearly, etc, whatever. Recommend exponential, con is we have to explain
then that urgents can be superceded by an experiment thats waiting for a long time.

Viktor- can reset 'waiting term multiplier' on experiment setting change or custom flag definition change.

#### Also put strict intervals for running, based on user input (on creation)

If infeasible, notify owner.

## Priorities

[[CS-BQRT.Priority Based Assignment]]

We recommend to _remove_ the priority system, as it leads to bad incentives like _fastest fingers_ and concequent emergent behavior.

A recommendation of how to replace it is by relying on the following softer effects to balance out the interests of all users:

1. Use the ultimate goal of promoting launches to upweight experiments that are expected to result in a launch. This is an idealistic due to lack of data, but worth calling out.
2. Having upweighted objective function for urgent experiments
3. Using the 'Modelling Deadlines' to upweight experiments that have been waiting for a long time/have hard constraints of max makespan.
4. Use the 'Smoothness of quota spent' to ensure that all teams have a fair chance to fulfill their plans, agreed upon in the planning phase with the central planning commitee.

and have other soft mechanisms to ensure that the most important experiments are run.

This 'get rid of priorities' is a recommendation, but it will require a rework of the [[traffic allocation]] system as well.

### Removing Priorities and Direct Traffic Allocation

Technical design doc [[here]].

### Modelling Priority (If we Really Still Want It)

Getting rid of the priority sistem has a high change of being better, but comes with development costs.
So, here we proposeaan addition to the model that confirms to the current system.

Do as follows:

**Upweight the objective function for experiments with higher priority.**
 Example with sqrt- based objective:

```python
# Multiply weights we get from other effects to weights, based on priority
weights = {exp: weights[i] / (1 + math.sqrt(priority)) for exp, priority in priorities.items()}

objective = sum(weights[i] * x[i] for i in range(len(x)))
```

**Make Sure Higher Priority Experiments Higher Proportion of Traffic They Ask For**

For each pair of experiments $i,j$ and dimensions $d$, with $priority(i)> priority(j)$ either:
i is not scheduled,or, for each dimension d: $y_{i,d}==1$ or $y_{j,d}==0$ . 

As $y$ 's are real, this can be linearized by e.g. $M_{linPriority}*((1-y_{i,d}+0.02)>=max(0,y_{j,d})$, where
$M_{linPriority}$ is a large constant, maybe $50$ in this case.

Interpretation- for each pair of experiments, either 
There might be better ways, but either way we have a possible [linearization](https://msi-jp.com/xpress/learning/square/10-mipformref.pdf) that confirms to the backend implementation.

## L4 Allocation Constraints

This gets in seamlessly with the proposed model, as follows:

First, check overlaps of L4 requests to L2/L3 requests.

### Option 1

Take into account L4 allocation requests at dimensionality reduction time. Then just proceed as normal.

### Option 2

If there are many overlaps, separately create non-overlapping (presumably

# Fundamental gaps with the model above

- Multi week estimation, clusters, etc (see overall scheduling flow bellow)

- Priority system on backend yes/no (also, on scheduler end, shall we have 'soft' priorities)- covered above, but even better if we can get rid of it

- Very small adsets and dimensionalita reduction

- Estimate via adpub simulation direclty?

-

-

# Model -> Interactive Scheduling System

We have already built/are building some elements of an interactive scheduling system. In this seciton we discuss how these elements, and others are supported by the model.

We have the notion of the **current active solution** - this is the solution that would be executed if we would land experiment_info now. This is implemented in the experiment redesign as the Solution object.

## Existing Features

### Long-running experiments and forcing experiments in

The role of these is to ensure continuity, take into account long running experiments, etc

**Long-running/currently running experiments** are boundary conditions to the model: their traffic consumption (for each dimension) is known and goes into the model directly as input: ( set of running experiments with their traffic profiles)
It modifies the MIP in a straightforward way by changing the right-hand side of the capacity constraint on the traffic supply.

$\Sigma_{i \in I} y_{i,w,t}<=availableTraffix_{i}- \Sigma_{e\in LongRunning}trafficMatrixRunning_{e,i}   ,\forall w\in W, t\in T$

**Forcing experiments in**  is supported in an obvious way by forcing some x's to be 1 and re-solving.

### Traffic Estimates, Overlaps, Suggested experiment modifications

## Experiment Overlap

In the dimensionally reduced space, this operation becomes trivial:

```python
def overlap(experiment1, experiment2):
    return np.sum(np.minimum(trafficProfile(exp1), trafficProfile(exp2)))
project_to_adunits(overlap(experiment1, experiment2))
```

Determining overlaps and their rough extend is trivial and this should cover a majority of use cases.

Regarding projecting back to a metric like adunits, see [[Dimensionality Reduction.excalidraw#New Adunit to Latent Vector]].

## Priority Swap, experiment swap, minimal subset to get in

We would expose the functionality bellow to be exposed as a 'consultative one', i.e. just check a what-if scenario as well.
A user looks at the prospective solution, wants to get their experiment in.

#### Minimal subset to get in

From the traffic matrix, directly calculate a minimal subset of experiments to remove, such that this experiment can get in.

**Implementation** solve the same problem as the usual but with the added constraint this experiment is in (
    $x_{i,t}==1$

```
).
```

Objective function is sum(x for x in current solution).

**Output**

**List of experiments** excluded **and** how much **less traffic** non-excluded experiments would get, compared to the **current active solution** . User can negotiate with owners to postpone them.
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

## How many segments will fit in a batch/Max experiment size to fit in a batch

Reduces to binary search+'minimal subset to get in', requiring empty  minimal subset to get in.

# Additional Considerations and Modelling Choices

## Revesiting extensions vs existing traffic

If i booked an experiment 3 weeks ago, and someone tries to extend, should the extension be accepted automatically? TBD

#### Booking in advance can increase weight in the objective function, similar to ' min/max' start date

#### Regularizing factor, preventing flip flops, soft prioritization mechanism

The idea here is to allow more optimal schedules to be computed as we go, but no jarring ones. For example, if we have a bunch of equivalent solutions, we should not flip-flop between them.

**How to do it?**

Persist a 'current solution', which is consultative, and communicate changes to it to customers if they get out of it. This is recomputed every hour.

Connect 'current solutions' over time by adding a regularization term to the objective function, adding a minimization term about $x_{i,w}$ and $y_{i,w,t}$ for the current solution with a small coefficient- this will ensure the solution wont jump about without strong improvement to the optemization function. It should reliably break ties. Details tbd, for example perhaps the regularization penalty should include also $\Sigma_{t=1..T} (x_{i,t})$ to make it softer for regulization

### Final solution and escalations

The final solution is calculated in the same way as the 'current solutions'.

## Experiment Creation

User creates an experiment.
After the preview stage, there is a simple check against the 'current solution'.

# [Draft] Scheduling Flow

A lot of what this section overlaps with the [[redesign]] and [[confilict resolution]] documents.

This is a recommendation on how to proceed in the ideal state. It 

- Batch release Tuesdays.

- Experiment change cutoffs sunday.

- 'final scheduler' run on Monday morning.

- users can escalate Monday.

#### User comms

- ping owners if big changes, with solution diff for major decision changes.

- Make the message such that its clear what can change. In particular, send message about experiments that can be extended/booked and can tAke big chunks of traffic- long running experiments, and unbooked clusters.

- Under above caveats, multi-week estimation is possible, with risks articulated relatively clearly.

[[science.math.Optimization.Simplex]]

\[\[[CS Scheduler] User Interactions]]

![[CSBQRT.Scheduler.Greedy Vs Bin Packing Evaluation Proposal#project-steps-with-dependencies-and-durations-specific-sections]]

# Source code

here is what I have so far for the model itself:
(solver is fico express)

```python
import numpy as np
import xpress as xp

# Initialize problem data (example values)
n_experiments = 1000
n_weeks = 4
n_traffic_types = 200
n_teams = 20


experiment_resource = np.random.rand(n_experiments) * 5
team_performance = 0.01 * (np.random.rand(n_teams))
team_resources = 30 * np.random.rand(n_teams)
team_assignments = [np.random.randint(0, n_teams) for _ in range(n_experiments)]
traffic_matrix = 0.1 * np.random.rand(n_experiments, n_traffic_types)
available_traffic = 100 * np.random.rand(n_weeks, n_traffic_types)
delta = 0.5  # Example tolerance for traffic profile similarity

# Create the optimization model
model = xp.problem("Experiment Allocation")

# Decision variables
x = {
    (i, w): xp.var(vartype=xp.binary, name=f"x_{i}_{w}")
    for i in range(n_experiments)
    for w in range(n_weeks)
}
y = {
    (i, w, t): xp.var(vartype=xp.continuous, name=f"y_{i}_{w}_{t}", lb=0)
    for i in range(n_experiments)
    for w in range(n_weeks)
    for t in range(n_traffic_types)
}
## penalty variables
z = {
    (i, w, t): xp.var(vartype=xp.continuous, name=f"z_{i}_{w}_{t}", lb=0)
    for i in range(n_experiments)
    for w in range(n_weeks)
    for t in range(n_traffic_types)
}

model.addVariable(list(x.values()) + list(y.values()) + list(z.values()))

# Objective function
objective = xp.Sum(
    # (n_weeks - w) * team_performance[team_assignments[i]] *
    x[i, w]
    for i in range(n_experiments)
    for w in range(n_weeks)
)
model.setObjective(objective, sense=xp.maximize)

# Constraints
for i in range(n_experiments):
    model.addConstraint(xp.Sum(x[i, w] for w in range(n_weeks)) <= 1)

for w in range(n_weeks):
    for t in range(n_traffic_types):
        model.addConstraint(
            xp.Sum(y[i, w, t] for i in range(n_experiments)) <= available_traffic[w, t]
        )

for i in range(n_experiments):
    for w in range(n_weeks):
        for t in range(n_traffic_types):
            model.addConstraint(y[i, w, t] >= 0.5 * traffic_matrix[i, t] * x[i, w])
            model.addConstraint(y[i, w, t] <= traffic_matrix[i, t] * x[i, w])

        model.addConstraint(xp.Sum(z[i, w, t] for t in range(n_traffic_types)) <= delta)

        for t in range(n_traffic_types):
            model.addConstraint(
                z[i, w, t]
                >= y[i, w, t]
                - traffic_matrix[i][t]
                * xp.Sum(y[i, w, tt] for tt in range(n_traffic_types))
            )
            model.addConstraint(
                z[i, w, t]
                >= traffic_matrix[i][t]
                * xp.Sum(y[i, w, tt] for tt in range(n_traffic_types))
                - y[i, w, t]
            )

for t in range(n_teams):
    for w in range(n_weeks):
        model.addConstraint(
            xp.Sum(
                experiment_resource[i] * x[i, w]
                for i in range(n_experiments)
                if team_assignments[i] == t
            )
            <= team_resources[t]
        )

# Solve the model
model.controls.maxtime = -1800  # Stop even if no solution is found within time limit
model.solve()

# Output the results
if True:
    # model.getProbStatus() == xp.problem_status.optimal:
    print("Objective value =", model.getObjVal())
    solution_x = model.getSolution(x)
    for i in range(n_experiments):
        for w in range(n_weeks):
            if solution_x[i, w] > 0.5:
                print(f"Experiment {i} is scheduled in week {w}.")
else:
    print("The problem does not have an optimal solution.")
```

```python
if True:
    print("Objective value =", model.getObjVal())
    solution_x = model.getSolution(x)

    scheduled_experiments = []
    unscheduled_experiments = []

    # Determine scheduled and unscheduled experiments
    for i in range(n_experiments):
        scheduled_weeks = [w for w in range(n_weeks) if solution_x.get((i, w), 0) > 0.5]
        if scheduled_weeks:
            scheduled_experiments.append((i, scheduled_weeks))
        else:
            unscheduled_experiments.append(i)

    # Output scheduled experiments
    print("\nScheduled Experiments:")
    res = 'scheduled experiments:'+ ','.join([str(i)+' week '+str(j) for i, weeks in scheduled_experiments for j in weeks])
    print(res)
    # for i, weeks in scheduled_experiments:
        # print(f"Experiment {i} is scheduled in week(s): {weeks}")
    unsched_output='unscheduled:'+','.join([str(i) for i in unscheduled_experiments])
    print(unsched_output)
    # Output unscheduled experiments
    # print("\nUnscheduled Experiments:")
    # for i in unscheduled_experiments:
        # print(f"Experiment {i} was not scheduled.")
else:
    print("The problem does not have an optimal solution.")
```

```python
# After determining scheduled and unscheduled experiments
solution_y = model.getSolution(y)

print("\nScheduled Experiments with Assigned Traffic:")
for i, weeks in scheduled_experiments:
    for w in weeks:
        assigned_traffic = sum(
            solution_y.get((i, w, t), 0) for t in range(n_traffic_types)
        )
        print(f"Experiment {i} is scheduled in week {w} with total assigned traffic: {assigned_traffic:.2f}")
```

