---
id: 5b73a9fjorxjglun8wti2xq
title: Summary
desc: ''
updated: '2024-10-16T17:11'
created: 1729020515191
tags:
  - excalidraw
excalidraw-plugin: parsed
---
TL;DR: Evaluate the impact of switching from a greedy scheduling algorithm to a bin-packing algorithm by simulating both approaches on resampled historical data, and compare performance metrics to determine if it's worth doing.

![[CSBQRT.Scheduler.Greedy Vs Bin Packing Evaluation Proposal.svg]]

<div class="mermaid">
  flowchart TD
    B[Collect Historical Experiment Data]
    B --&gt; C[Resample Demand for Said Period Using Stratified Block Bootstrapping]
    TDA[True Demand Adjustment Parameter] --&gt; C
    C --&gt; D[Implement Simplified Greedy Algorithm]
    C--&gt;BinPackingPrototype

    subgraph BinPackingPrototype["Implementation of Simplified Bin-Packing Algorithm"]
     FSDR[Feasibility Study on Dimensionality Reduction]
     FSDR---&gt; BinPacking[Implement Simplified Bin-Packing Algorithm]
    end

    D --&gt; F[Run Simulations with Greedy Algorithm]
    BinPackingPrototype --&gt; G[Run Simulations with Bin-Packing Algorithm]
    F --&gt; H[Collect Performance Metrics]
    G --&gt; H
    H --&gt; I[Analyze and Compare Results]
    I --&gt; J[Determine Headroom and Benefits]
</div>

```
1. Data Collection:
 Gather metadata (Resource account, traffic requirement) on all experiments conducted over the past six months .
2.	Demand Simulation:
	Create hypothetical weekly demand datasets by resampling with replacement from the dataset. We can use Stratified Block Bootstrapping to maintain the temporal structure and prevent sampling 200 experiments from the same team in a same week.
3.	Algorithm Implementation:
 	We will develop simplified versions of the current scheduling system. Some features, which are unlikely to be relevant for the comparison, may be omitted to save implementation time, tbd, but these will be called out as needed. As an example, experiment urgency may be ignored. 
    We will implement two versions: one using the greedy scheduling algorithm currently in use, and a dimensionality reduction- bin packing version as an alternative.

4.	Simulation and Metrics Collection:
•	Run multiple simulations using both algorithms on resamples of the dataset under varying demand levels, including scenarios with high demand. For example, we can have sets of resamples with 20%, 50%, 100% more demand than the supply we served each week over the past six months.
We will collect the following metrics for each simulation: 
* Number of experiments scheduled per week
* Total traffic utilized per week.
* Latency Metrics : Makespan, average time in queue, median time in queue, and higher percentiles (70th, 80th, 90th, 95th, 99th), makespan (maximum time in queue).
* Quota Utilization: Monitor the smoothness of quota spending by teams to assess the impact on workflow continuity and potential revenue implications.
5.	Analysis:
* Analyze the collected metrics to determine the performance differences between the two algorithms.
* Assess whether the bin-packing algorithm provides significant improvements in scheduling efficiency, resource utilization, and quota spending smoothness.
* Evaluate the headroom available in the system to accommodate additional demand under the new algorithm.
```

# Expected Outcomes

By following this methodology, we aim to provide empirical evidence on whether adopting a different algorithm would significantly enhance the scheduling system’s performance and justify the investment in algorithmic changes.

# Timeline

# Project Steps with Dependencies and Durations (Specific Sections)

| Step | Description                                                      | Dependencies                               | Estimated Time (in work days) |
| ---- | ---------------------------------------------------------------- | ------------------------------------------ | ----------------------------- |
| 1    | **Data Collection**:                                             | None                                       | 3                             |
| 3a   | **Dimensionality Reduction Prototype**:                          | Requires data collection                   | 4                             |
| 3b   | **Algorithm Implementation: Bin Packing and Greedy Prototypes**: | Requires data collection                   | 2                             |
| 4    | **Simulation and Metrics Collection**:                           | Requires algorithm implementation          | 2                             |
| 5    | **Result Analysis**:                                             | Requires simulation and metrics collection | 1                             |

# Appendix- Methodological Notes

## Stratified Block Bootstrapping

 This resampling method works is standard for time series data, though . Stratification will  ensures that the resampled datasets maintain the original proportion of teams, preventing bias due to overrepresentation.

## Assumption of Increased Demand:

 The simulations assume a higher demand than currently observed to test the algorithms under stress and identify potential scalability benefits.
 We think this is reasonable because: 

- The system has been running at full capacity for  the past months.
- The nature of the current system may discourage experimenters to even try to schedule experiments, due to missing quota, lack of confidence when they may get scheduled, etc. More discussion in a dedicated note. 
- This is the consensus opinion in the org and among clients.

==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'

# Excalidraw Data

## Text Elements

Implementation of Simplified Bin-Packing Algorithm ^HB92faqz

Collect Historical Experiment Data ^ctK7gUqr

Resample Demand for Said Period Using Stratified Block Bootstrapping ^mLHvL8Gt

True Demand Adjustment Parameter ^kG0v47vf

Implement Simplified Greedy Algorithm ^P6yWmQiw

Feasibility Study on Dimensionality Reduction ^zlbNsA4b

Implement Simplified Bin-Packing Algorithm ^BzWB6JE6

Run Simulations with Greedy Algorithm ^wnhhy9D1

Run Simulations with Bin-Packing Algorithm ^uLkLx3Tb

Collect Performance Metrics ^zNToTvjy

Analyze and Compare Results ^iJij7mGr

Determine Headroom and Benefits ^92koSNQU

%%

## Drawing

```compressed-json
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

aBoxvgAaaRyCFDScwQMMwpwGEEAA
```

%%

