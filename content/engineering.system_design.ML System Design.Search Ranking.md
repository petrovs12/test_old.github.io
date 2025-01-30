---
id: gb8iikrlf7bz1imcburae7a
title: Problem Statement
desc: ""
updated: 2024-12-15T22:35
created: 1646303114356
---
General Query, return results

## Scale

## Personalization

## Internationalization

# Metrics

## Online Metrics

### End To End Metrics

### User engagement

 [[seed.Product Management.Product Metrics.User Based Metrics (Digital Products)]]
 [[seed.Product Management.Product Metrics.User Based Metrics (Digital Products)#^ctr]]

### Query Succcess

 Dwell time, not re-doing search after short time.

 [[seed.Product Management.Product Metrics.User Based Metrics (Digital Products)#^task_success]]

# Offline Metrics

 Classification metrics
 [[science.stats.Regression.Classification.Metrics]]
 AUC, precision, recall, etc.
 Ranking Metrics: 
 ![[science.stats.Regression.Loss Functions#^ranking-NDCG]],
 ![[science.stats.Regression.Loss Functions#^ranking-map]],

# Architectural Components

 Draw the usual Picture - think about multiple models etc.

# Document Selection Algorithm

 We can give multiple semi-independent scores of different aspects of the user-query-document match.

1. Intent-document match
2. Document Pagerank
3. Keyword Match
4. User-Document Topic Match
5. Location Match 

   We will have independent models, estimating all these scores, and combine them w/ some function to estimate the best score.

# ML Architectural Parts

## Query Rewriting

### Spell Checking

### Query Expansion

Add synonyms and nearby phrases.

#### Query Relaxation

Remove redundant words (e.g. **good italian restaurants** --> **italian restaurant**).

### Query

## Query Understanding

### Intent Understanding

 Embed query?
Create an 'intent' embedding for the query- 'earthquake' is 'news-y', 'food' is 'local', etc.
Can see the intent dataset by manual labelling and then proceed.

## Inverted Index Lookup

## 

# Relevance Scoring Scheme

Create different models for relevance for:

1. Terms match
2. Document popularity
3. Query intent match
4. Personalization match

And maybe do a function on that to decide what to show

# Feature Engineering

The 'agent types' in this system are:

1. Searcher
2. Query
3. Documents
4. 'Context' (includes session length, current intent, etc)

In addition, we can think about 

- Searcher-Document Interactions
- Query-Document Interactions

## Searcher Features

Demographic data. Historical intents. Interests.

## Query Features

[[seed.Product Management.Product School Book#^companygoals]]
Keywords, query embedding. Temporal features (time of day).
Query historical engagement.

## Document Features

Document Embedding. Pagerank/popularity measures.

