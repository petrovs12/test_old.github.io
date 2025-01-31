---
id: ow3g4qveqmtd97qginnkc32
title: Metric/Similarity/ dissimilarity
desc: ""
updated: 2024-12-15T22:35
created: 1642438864125
---
Taken mostly from Dino Sejdinovic's notes at Oxford. 
 Clustering means we want to group similar objects(make a partition).

 consider the following three basic properties,required of a clustering method $F:(D = {x_1,x_2,...,x_n},\rho)->{C_1,...,C_k}$
 that takes a dataset $D$ and a dissimilarity function $\rho$ and returns a partitioning $C$ of $D$ into $k$ clusters.
 Some desirable properties there are:

## Scale Invariance:

$F(D,\rho)$ is invariant to changing of the measurement units of the dissimilarity function $\rho$. Formally, $F(D,\rho)=F(D,\alpha\rho)$ where $\alpha$ is a positive scalar.

## Richness

For any partitioning $C^*= \{ C_1^*,\ldots,C_k^* \}$ of D, there exists a dissimilarity function $\rho^*$ that produces it:
$F(D,\rho^*)=C^*$

## Consistency

If we have a clustering, and then change the dissimilarity function s.t. items in same clusters become no more dissimilar, but the items in different clusters become not less dissimilar, then the clustering should not change

## Kleinberg Impossibility Theorem

We can't have all 3 of these natural properties holding simultaneously.

# K-means ^kmeans

We want to minimize the total in-cluster distance.

$min_{C} \Sigma_{i=1..k} (\Sigma_{j:C_j=k}||x_j-\mu_i||_2^2)$

Idea:

1. Given centroids, can easily assign points (assign to closest).
2. Given clusters can easily find their centroids, by differentiating the objective function (it turns out the centroids work).

We can iterate the steps above until convergence or a predefined number of iterations, is reached.

# K-means ++

This is an algorithm for choosing initial centroids. We first sample uniformly at random and select the 1st point. Then we compute the distance to all other points and sample with probability proportional to the distance squared (or select the furthest). This is great initialization algorithm that comes with theoretical guarantees, as well as working well in practice.

# (K-center)[https://ugtcs.berkeley.edu/src/approx-sp19/scribe-notes-2.pdf]

# DP -means

Above work for a fixed k.
DP algorithm for clustering is one we won't describe, but it can be shown to minimize the objective:

$min_{C} \Sigma_{i=1..k} (\Sigma_{j:C_j=k}||x_j-\mu_i||_2^2)+ \lambda K$ where $\lambda$ is a regularization parameter.

The core of the algorithm is an Expectation-Maximization step.
[[science.math.Optimization.EM Expectation Maximization]]

