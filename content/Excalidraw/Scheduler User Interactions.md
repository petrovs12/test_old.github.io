Interactive Scheduler



# Prospective Solution and Corrective Actions

## Continuum between batch processing, and online processing




### Batch Processing with solution stickiness
We call the current prospective solution the set of scheduled experiments with priorities If the batch to start now. this prospective solution is calculated often and the previous prospective solution is a regular ration term of optimization function.  If a new solution has a significant difference with a previous one for example changing the schedule start time movement the owner is notified.  

# Overall Scheduling Flow

  

This is a recommendation on how to proceed (ideal state, if FEASIBLE).

  

* Batch release Tuesdays.

* Experiment change cutoffs sunday.

* 'final scheduler' run on Monday morning.

* users can escalate Monday.

  
  

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