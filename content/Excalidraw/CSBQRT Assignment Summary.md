Assignment Summary

# Priorities
- Experiment priority is selected when booking an experiment via UI;
- We recommend booking highest available priority;

## [#](#ordering-of-cs-experimen "Copy link to heading")Ordering of cs experiment subtypes

- Long running experiments
- __Small experiments__
- Clustered csbqrts
- Regular CS-BQRTs

Within each priority, ordered by creation time.

  ![[Pasted image 20240902123206.png]]

## [#](#small-experiments-go-tro "Copy link to heading")Small Experiments go trough the Scheduler

Small experiments go trough the [scheduler](https://www.internalfb.com/intern/wiki/AdsInfra/Experimentation/Advanced_Experiences/Advertiser_Product_Evaluation_Area/BQRT_Internal_Details/CSBQRT_Scheduler/), others will start at the desired dat.
**

### AdUnits, Segments, and Eligible Experiments

  
  

We assign lottery tickets (called segments) out of each paceable units to experiments.

There are 50 of them, so each lottery ticket corresponds to 2% probability mass to get the paceable unit assigned to the experiment (see [here](https://www.internalfb.com/intern/wiki/AdsInfra/Experimentation/Advertiser_Product_Evaluation_Area/User_Documentation/Budget_QRT_(BQRT)/AS_CS_BQRT_User_Guide/Mathematical_Formulation_of_the_Data_Generating_Process/) for 30 second overview).

Let’s say, the following table depicts an empty array of size of 50. 

This array gets created in the BQRT backend against every AdUnit.

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeSpYgpIlbIxjwDVnqFottgqDfnVIRZ8sKeru1u6q3K36QlFFyv9Ww10LvLRv2KYy-fx9CCAURPfRDpHUdcZvMrFTskJciP12RD3ggo03_rhvSeggymokwCWYQ6MIj_aMwqVz-7fCaX3UOV1eb8aARWRJCi?key=2XIUSFl8eOXjflPBumxCVw)

Suppose five CSBQRT experiments are eligible for an AdUnit.

Sort those experiments by their priorities, and then fill the array block with those experiment Ids as many as their #segments, until it reaches the end of the array.

  

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdnGif53glTe34Fxx49PYer97jN5IdFv_sD8SPp0p3GObzTmlDyCipbdITj2FH77_Xh9lyWYhODHYk69HDgVyACJ7a3Ssp1EuwLMYGhSwqbFVsBBIOu-t0XtVIxjnAHaVQemLymcUD0PUSERrTpoPgIPqLQ?key=2XIUSFl8eOXjflPBumxCVw)

So, an for each paceable adunits, an experiment will get  requested if 50-cumsum(requested by  experiments with higher priority)<requested, else max(0, 50-cumsum) (with the obvious abuse of notation.

In the example above, EXP c and b will get what they requested, 5 and 10, and experiment c will get 35.

**

[https://www.internalfb.com/intern/wiki/AdsInfra/Experimentation/Advertiser_Product_Evaluation_Area/BQRT_Internal_Details/Ads_Group_Based_CSBQRT_Assignment/](https://www.internalfb.com/intern/wiki/AdsInfra/Experimentation/Advertiser_Product_Evaluation_Area/BQRT_Internal_Details/Ads_Group_Based_CSBQRT_Assignment/) 

for an up-to-date description of the assignment algorithm.

  

### Long-Running Experiments 

  

[Deterministic CS-BQRT](https://docs.google.com/document/d/1dtC5N-BdzYpUmh5HVt7Y2zSqC0m8KSaDz3DAzT79ZGU/edit#heading=h.fufvvqq4cd50) implemented a way to account for long-running experiments at assignment time as follows, for each paceable unit:

  
1. We keep track of batches up to max_experiment_length-1 in the past when doing assignments.

2. Going from the oldest batch, explicitly assign lottery tickets to segments in order of batch,priority.

3. If an experiment has finished, it deallocates the segments it booked.

  

The above algorithm ensures that long-running experiments are assigned 'as if it's the batch they started in', so they neither grow nor shrink excessively.

		}}



**
