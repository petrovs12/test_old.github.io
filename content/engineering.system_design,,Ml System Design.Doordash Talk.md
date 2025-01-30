---
id: gfobwnkzdeqrs9bfpx3sgdv
title: ML Systems
desc: ""
updated: 2024-12-15T22:35
created: 1644531139053
---
from ![](https://www.youtube.com/watch?v=sEZsIUBIhNk&list=PLmGsNPZGeM5D8fgr2scwe8wZih4SYB7Vt&ab_channel=InfoQ)

Real world ML systems:

<div class="mermaid">
  graph LR;
A(Data Pipeline)--&gt;B(Model Deployment/Management)--&gt;C(Model Monitoring/Evaluation)
</div>

Real world ML systems:
10% algorithms
90% ml systems

How to return the focus to the algorithms:

Robust tools + templatzize best practices

## DoorDash overview

- Last mile on-demand logistics
- 3 sided marketplace (users, restaurants, delivery service)
- 1600 cities by end of 2018

Technology company

Connecting the 3-sided marketplace.

Mostly restaurant delivery.

100000+ resraurants.
300000 delivery drivers.
10^10^6 deliveries.

### Goals of users: ^usergoals

[[seed.Product Management.Personas]]

### Restaurants:

reach and revenie

### Delivery Service:

Flexibility and earnings

### Users:

Convenience and seleciton

Between the above sides, there are multiple ml algorithms:

## Users-Restaurants:

Recyss- recommendation/personalization, search ranking, demand prediction.

## Merchants - Drivers:

Core dispatch algorithm
Hotspots
Batching of orders/etc

Seems like the usual VRP stuff...

# Merchants:

food prep time
parking prediction
selection intelligence (e.g. what things are ppl going to order, how to structure the menu maybe, etc..)
combine demand spikes etc

# Users

lifetime value
promotions
aquisition

# Delivery Service

Supply calculation 
Pay calculation (effort-based)
Incentives

# Offline (batch) to online (on-demand) axis

reccomendation might be offline (in this case) so offline
time prediction -online
demand forecasting in the middle (multiple horizons).

# Training Pipeline

<div class="mermaid">
  graph LR;
F[Common Features Store]--&gt;B
A[(Data)]--&gt;B("Features Extractor")--&gt;C("Model Training Jobs")--&gt;D[(Model Repo)]

</div>

[[Feature Stores]] are great/super important.

They serve as a single source of truth, store embeddings etc.

# ML Performance goals

- Accuracy SLAs
- System SLAs  (latency)
- Debuggability\*
- Time to Ship 

# Debuggability goals

 If some model is giving weird results, what do you do? What tooling do you need so you can quickly decide if it's a data issue, model going stale issue, or something else? What

# Stefan's own musings

Let's have some such structure:

<div class="mermaid">
  graph LR;

D[Model Repository]--model--&gt;I
A[Request]--&gt;B[Load Balancer]--"json_data{user_id:1,restaurant_id:2,type:parking,...,timestamp}"--&gt;C[Predict]
D[(Model Repository)]--Shadow Model--&gt;I

I[Model Service]-.-C

F[(Feature Store)]--"fetch data for entities, last entry&lt;=Timestamp"--&gt;C
E[(Model Log)]
G[("Model Metrics and Monitoring")]
E-.-&gt;G
C--"features, predictions"--&gt;E

A1[Model Metadata]-.-&gt;D
H[S3]---&gt;D


</div>

The model log holds all request, feature values, predictions, and outcomes

## Shadowing models

Run models in parallel, as well as on the different groups. Use the parallel models for counterfactual stuff.

## Use the model log to replay stuff

## Use log for monitoring

[[science.stats.Distribution Drift]]

## Use log to train new models

Thus making the training and prediction processes closer (modulo effect on customer behavior).

# Monitor

- Feature Distributions
- Predictions
- Response times

track summary stats, plot distributions, alert.

# Launching new models

Much faser now, as now the process is as follows:

<div class="mermaid">
  graph TD;
a[Model Ready]--"Model Registry Knows how to serve model"--&gt;B[Register Model Metadata]
B--"Can test as shadow as a stage before AB test"--&gt;C
C["Enable Shadow/experiment"]--&gt;D[Monitor Metrics]



</div>

# Data Preparation

While doing data prep, it would be ideal to integrate with the feature store.

