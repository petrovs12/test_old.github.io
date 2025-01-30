---
id: yvil3i20f7gmq40daleffdh
title: Feature Stores
desc: ""
updated: 2024-12-15T22:35
created: 1644588554746
---
Tl;dr
Several perspectives:

1. Implementational
   Layer on top of a DB, supporting many writes, key-based retrieval, last-before-timestamp retrieval.
   Supports writing batch or streaming features.
   read: can ask for a feature x for item/customer/whatever id y at time t easily and get back the correct result.
   FS handles backfilling of these features.
   Useful for embedding maps as well.


2. Semantic
   Have an 'easy and consistent way to write something that generates features ppl or models can use.
   Then create models that take data directly from the feature store, and it's easily portable to production.

Many of the points are from the [FEASTS Docs](https://docs.feast.dev/).

Feature Stores are systems that support the following functionalities: 

1. Consistent Access to Data During Model Ideation, Training, Testing, and Deployment.
   Different roles in the organization have divergent objectives and data sources. It would be best if the path between 'prototype data source' and 'production data sources' is as short as possible.
2. Point-in-time correctness
   When the 'predict' call comes, we need the latest allowable value of the feature for the entity in question. Look below for the [[^timeTravel]]
   [[science.stats.Time Series]]
   [[science.stats.Data Leakage]]
   [[science.math.Stochastic Calculus.Filtration]]

One of the **key value propositions** when compared to a [[engineering.system_design.nosql databases]] like [[engineering.system_design.nosql databases.BigTable]] by itself.

3. Deploying new features into prod is difficult
   For example, if a data scientist has created some long feature calculation pipeline during the script, it's possible to shoehorn this into production.
   But maybe it's computationally burdensome, especially if it's using a bunch of time/data to compute (e.g. rolling windows).
   Then the prod system would have to make additional queries to fetch data for a week back, then aggregate over it- very slow.
   Feature store can be 'Database for kids' in this sense- a database ml ppl can experiment and put scripts/ ETL's for feature calculation without trouble.
4. Features aren't reused across projects/ ppl ^reuseClear what this means

## Challenges with data for ml

 Data pipelines are messy.
 Different between training and serving
 Different data sources between training and serving
 Lack of point-in-time correctness/information sets/ Filtrations

 Models can be developed by DS, then re-developed and maintained by DE/MLE.

### Building Feature Pipelines is hard

- Same semantics, adapted to different requirements, lead to **different production requirements** - distributed compute, strem processing, low-latency transformations.
- Reliable computation and **backfilling** of features is a large investment

### Consistent Data Access

- Redevelopment of pipelines- inconsistencties in data
- [[science.engineering.technologies.MLOps.Training-Serving Skew]] 

## Duplication of Effort

This is covered in the [[science.engineering.technologies.MLOps.Feature Stores#^reuse]] point above

### Data Quality Monitoring

- Logging serving times, computation times
- Checking for [[science.stats.Distribution Drift]]
- Checking for 'Freshness', i.e. have we re-computed the features recently

## How feature stores help

They are usually built on top of existing data stores, eg. DynamoDB, Redis, BigTable, etc.
Normally the underlying storage system should support fast key lookup + timestamp range queries, e.g. BigTable style
[[engineering.system_design.nosql databases.BigTable]]

[[engineering.system_design.nosql]]

Honestly, for ML features, it does seem like something that:

- is key-based
- supports **appends**, range queries, and one can put secondary indices on
  sounds perfect.

## Time Travel Problem and Information Sets ^timeTravel

Issue:
we would like to serve a model at time $T$ for lookahead period $h$, so we would like to use the data up to and including time $T-h$. So all features we use should be 'current' as of that timestamp. 

In other words, when we're making prediction at time $T$ with planning horizon $h$, the **information set** we can use is the one available at time $T-h$.

Some [feature store solutions can help](https://www.tecton.ai/blog/time-travel-in-ml/) with this problem.

# FEATS Overview

![](https://www.tecton.ai/blog/time-travel-in-ml/)

