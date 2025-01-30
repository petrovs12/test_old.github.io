---
id: 8u26uweumi3ae2c2vxfhwlb
title: Random Sampling
desc: ""
updated: 2024-12-15T22:35
created: 1642429651081
---
# Stratified sampling

If we have some set of characteristics, we want to be able to split the set into two subsets, one with the characteristics that are most similar to the characteristics of the other subset.

# Time series sampling

 Split by expanding time windows (information set)

# Recommender System test set split ^recsys-start

 For collaborative filtering if we **don't want to deal with cold starts** directly with this model, use approach similar to stratified sampling. So we just mask some entries in the matrix randomly, should put roughly all items and all users in both the train and test set. Related to [[^transductive-gnn]]

If we want to deal with the cold start in integrated way (idk of possible), then maybe can just split as we wish by rows/columns/connected components etc.
![RecSys traintestsplit](/assets/images/2022-01-17-15-31-56.png) ^recSys-traintestsplit

Cold start problem is related to [^inductive-gnn].

 ^recsys-end

# Graph Neural Nets:

## Transductive

 In transductive learning in graphs, we see the whole graph structure, and want to learn something
 about unobserved node/edge labels/features. ^transductive-gnn

## Inductive Learning

 In transductive learning, we have access to both the node features and topology of test nodes while inductive learning requires testing on graphs unseen in the training. ^inductive-gnn

