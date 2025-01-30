---
id: l5ho7tonvgr341v9fzwzhux
title: Clustering-related
desc: ""
updated: 2024-12-15T22:35
created: 2024-10-10T12:55
---
![[ClusteredCSBQRT#Clustering Algorithm Implementation]]

## Others

 **Type C: Another existing delay type is due to delayed custom flag attribution. Some of the custom flags have delayed attribution, for example, some of them are backed with daily dataswarm pipelines, which results in delayed ad allocation requests. In the worst case, it could result in traffic never being present in the experiment.**
  Type A: All newly created ads are assigned to experiments only at least on their second Ad Publisher cycle due to assignment happening in AdPublisher’s prep-processor, while experiment selection logic is in AdPublisher’s post-processor. 
 Type B: All newly created ads are assigned to experiments only after Cluster’s resolution has happened for a given campaign, meaning that if clustering infrastructure didn’t process given AdUnit, it won’t be attributed to any of the running experiments. This decision was done to ensure correctness vs detectability trade-off back then. 

[[Custom flags]]

\*\*  

## Sergei's Doc

[Ads Segmentation for Budget Experimentation: Current State & Platform Metrics](https://docs.google.com/document/d/1S3ebDIR15Hwwoi5wOZWb0y13Hs4OXa4Z6aKJ8eH2LO4/edit#heading=h.452dw81unz18)

## Evidence for a problem

# ~up to [30](https://fburl.com/scuba/ad_metrics/m5nxufcl)% of the traffic is lost.

Noting that MDE scales as 1/sqrt(# impressions), we suffer up to 19.5% increase in MDE.
m,p

## Notes about work up to now

### ML style work

<https://docs.google.com/document/d/12WG05Ova0whF4gwk4_yfJiuHVHxkEH2uJKFbXfzBhSE/edit?fbclid=IwZXh0bgNhZW0CMTEAAR3vw6SWSox7SeqSRzt7-_D2NwlDt_FMBQpPMt-Ud-icQH_fXGPey42ptBY_aem_hdoWibSTN7pCH0DCopYp_Q#bookmark=id.1ci93xb>

Code:

<https://fburl.com/code/ote0tt2p>

Basic nn

With targeting features only.

### ML - better features

#### Research pre-extracted features

Lever
**There are probably much better, pre-extracted features (or embeddings, as [Stefan Petrov](mailto:stefanpetrov@meta.com) suggested) elsewhere at Meta that could be used to greatly improve performance and reduce latency in the ML pipeline.**
risk: research

### Parallels with dimensionality reduction

<https://docs.google.com/document/d/1CGxBUoCRdRDOUJsG6L55l4rxS2OFOBR0y6zsZrc1O_Y/edit#bookmark=id.26in1rg>

As we have stated previously, clustering compresses the information about the arguments based on their co-participation in the auctions, while the dimensionality reduction aims to do such compression based on the traffic requests by our customers. Now, these should be somewhat connected, though connection strength is unclear. 

Concretely, we can create new features using the estimator cleverly.  When the ad starts serving first, we already have access to custom flags, optimization goals, and type types. Based on that, we could find which historical experiments this adunit is eligible for, and using  **cs_bqrt_estimator_eligibility_results_l2_l3**
, find out which other historical adunits (with clusters already assigned) are eligible for the same experiments, perhaps with some weights.

Then we can use this data to map which clusters are most similar to this ad unit, based on the similarity to the ads. 
Then we can add this to any other model (e.g. a classifier based on targeting features as we have now).

So, one lever would be to use the estimator to generate features for an ML clustering classifier.

### Look into options for different graph partitioning algorithms?

lever. 
The digraph algorithm we use has a high dev efficiency barrier. In addition, it does not support e.g. node or edge features, which can be useful (we can put all ML features in there, in theory). However, hard to find such a tool pre-made in- house.

risk:
research time

## Incremental pipelines and  auction purity degradation

One lever would be to run the incremental pipelines more frequently and see what happens.

### Review incremental pipelines?

An intriguing question is why auction purity decreases at all over timé with out identified clusters. This decline may be linked to the cold start problem for new campaigns, where it takes awhile to start properly they properlying them and whether they initially participate in different kinds of auctions before the ranking performance stabilizes. This raises the possibility that extending the data collection period could improve auction purity. There is some existing research on the cold start problem for ads we may want to look at. It’s may important to investigate the trade-off between the frequency of incremental pipeline runs and the degradation of auction purity and accuracy. This makes the tradeoff between latency of assignment (MDE) and auction purity?

We can see the incremental clustering pipeline is here:
<https://fburl.com/code/bkvjebhz>
the implementation is quite old, and the incremental pipelines was build as a parametrization of the older one. on an input adjustment.
<https://fburl.com/code/52b21blm>

it runs every 4 hours:
<https://fburl.com/code/52b21blm>

Lever: change the lookbackhours parameter, should reduce the latency overall.

Risk:
How much testing should we do for this? I feel like we could be taking an auction purity hit here without knowing.
risk: auction purity

# Existing custom flag management

## Custom flag management

Unknowns:
a. Fundamental assumption of the estimator: equilibrium of ad uníts.
b. Custom flag changes:
Lever:
 proposed custom flag change detector
c. Custom flag attribution delay
To investigate

# Dev Efficency

## Investigate Custom Flag Exclusion

Should improve the ergonomics of custom flag work. 

<https://www.internalfb.com/code/fbsource/[b7e8bf1a54add1c1b27b1d47908707fc9197f6a1]/fbcode/admarket/lib/util/budget_qrt/AsbqrtAdAssigner.h?lines=6>

in asbqrtadassigner.cpp

can you point me to the part where custom flags are assigned? maybe guess whlich method does the assignment so i can look at that implementation

Metamate
The custom flags are assigned in the prepareAdSetInfo method, which is called in the constructor of the AsbqrtAdAssigner class. The prepareAdSetInfo method takes an AdCompact object and an AdPublisherBudgetQrtConfigSnapshot object as input, and returns a BudgetQrtAdSetInfo object. The BudgetQrtAdSetInfo object contains a customBqrtFlags field, which is a vector of custom flags. The custom flags are converted to a set of integers using the from and map functions, and then assigned to the customFlagsInts variable.

i see the eligible csbqrts are in the 
adsetinfo 
prepare adsetinfo
<https://fburl.com/code/qmyq55jx>

<https://fburl.com/code/4gel4j0w>
here is where the matching is happening.

* * *

it's counterpart in the estimation-related 
stuff is: 
<https://fburl.com/code/zb0iyowx>

so if we put some exclusion stuff in a table somehow it should be pretty easy to implement in both places (or maybe the logger handles it naturally).

\*\*

