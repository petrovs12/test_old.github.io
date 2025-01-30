---
id: x7nmz57bvi5holc20csrajz
title: Clustering Problem
desc: ""
updated: 2024-12-15T22:35
created: 1690467249788
---
Given $64$ input clusters, with (I think) 63 features $f_{c,i}$, the following algorithm does as follows:

1. Partition all initial clusters into 2 subsets:<https://fburl.com/code/9mb3uv3f2>

    For each subset, find a feasible solution of the 'feature balancing problem':
   <https://fburl.com/code/mqq6h3vo>

2. $x_{ij}\in {0,1}$ is the decision variable representing if the $i^{th}$ cluster belongs to the $j^{th}$ group

3. $c_{ij}$ represents the data in the $i^{th}$ cluster and $j^{th}$ feature

4. $\epsilon_f$ is the maximum allowed imbalance for the $f^{th}$ feature

5. $w_i$ is the sum of the $i^{th}$ feature across all data

Maximize 

$$
\sum_{i=1}^{n_{\text{clusters\_input}}} \sum_{j=1}^{n_{\text{clusters\_output}}} x_{ij}


$$

(this is in fact a always $=64$, so optimizing nothing)

s.t.

Assignment Constraint

$$
\sum_{j=1}^{n_{\text{clusters\_output}}} x_{ij} = 1, \forall i \in \{1, \dots, n_{\text{clusters\_input}}\}
$$

$$
\sum_{i=1}^{n_{\text{clusters\_input}}} x_{ij} c_{ij} \leq (1 + \epsilon_f) \cdot \frac{w_f}{n_{\text{clusters\_output}}}, \forall j \in \{1, \dots, n_{\text{clusters\_output}}\}, \forall f \in \{1, \dots, n_{\text{features}}\}
$$

Where $\epsilon_i$ is small for the $l2\_cnt$ and $num\_users$ features, and quite large for the rest of them. So great balancing is not guaranteed for each feature.

# Updated Model

## Objective Function

```
        prob.setObjective(
         xp.Sum(
                (x[i, k]*x[j,k])*interactions[i,j] for i in range(N) for j in range(N) for k in range(K) if (i!=j)) 
d                , 
            sense=xp.maximize)   
```

$$
\text{maximize} \sum_{i=1}^{N} \sum_{j=1, j \neq i}^{N} \sum_{k=1}^{K} x_{ik} x_{jk} \cdot \text{interactions}_{ij}
$$

## Additional Constraints

Added a constraint, forbidding some of the clusters to be too small.

$$
\forall{j \in 1..K} \sum_{i=1}^{N} x_{ij} \geq 3
$$

With 2 it also works.

## Guarding against 'put all interactions in the same cluster'

At some point I hit quite a serious problem, where the optimization would put a bunch of mini-clusters in the same cluster. That would maximimize 'total purity' quite well, but it can in fact create one 'full bqrt' and a bunch of random non-clusters. 
 So I got the following idea:

1. I perhaps want, if I put all clusters in a graph somehow, and embed it in a 3-4d space, I want the 'bounding box' of each cluster to not be too dissimilar in that space. 
2. But linearizing volume is hard, so we can just linearize the perimeters.
3. Implementation in the appendinx.

## 'We don't really optimize anything'

However, we do!

My initial understanding about the de-facto objective function we're aiming to optimize was that 'the number of auctions, for which most of the ads they consist of are from the same cluster'. This is in fact still not quite right, as we in fact want to optimize something like:

1. for each cluster, find all auction it participates in.
2. Write 1 if  ">50% of the ads in this auction are from this cluster, else 0.
3. Take this average for each cluster.
4. Maximize the number of clusters, for which this average> ??
    But these are too many variables, probably
    #TODO- take a look at a 'direct optimization' of this objective function, and see if it's feasible.
   ## Approximation
   Idea:

Let's say that 2 different mini-clusters interact with coefficient k iff they interact in $l$ auctions, then maximum number of auctions any 2 clusters interact in is $L$, and $l/L = k$. See appendix.

Estimate the 'initial cluster' interactions, and try to put clusters with many interactions together. Then the interactions between the mega-clusters.

Possible Objective funcitons, stemming from here:

References: , 

### Max-Variant

## Observations/ Theory

MIP progresses towards 'good' integrality gap, (90% to 10% ish)
This is the one we've chosen.

## Linearization of products of binary vars.

## Drawbacks

Can lead to unbalanced clusters.

### Min-Variant

## Observations/ Theory

MIP progresses towards 'good' integrality gap, (90% to 10% ish)
This is the one we've chosen.

## Drawbacks

Optimization not progressing

### Diameter- Variant

Could be ok, optimization was progressing fine, but optimizes the notion of 'distance' as opposed to 'interaction' (common auctions). But maybe if more thought is spend in the '#interactions-to-distance' thing, can be evaluated. One good part is it considers that 'clusters should be similar' notion. 

### Pre-cluster Without Constraints, then find closest feasible point

Again, dependent on a 'distance' notion. Couldn't very easily find a nice pre-clustering.

## Additional constraints

## 

## 

# Appendix

## Mini-Cluster Interaction Estimation Query

```{sql}

WITH clusters_and_campaigns AS (
    SELECT
        campaign_group_id,
        ad_request_id
    FROM auction_campaign_group_bipartite
    WHERE
        ds = {{ base_input_date_ds }}
),
-- get the ad requests, joined with the
ad_req_with_clusters_joined AS (
    SELECT
        *
    FROM clusters_and_campaigns cc
    JOIN clustered_csbqrt_allocation_v1 cr
        ON cc.campaign_group_id = cr.campaign_group_id
    WHERE
        cr.ds
            = '2023-07-15' -- {{ base_input_date_ds }} --'<MULTI_TABLE_LATEST_DS:cluster_summary_stats_multifeatures_v1&auction_campaign_group_bipartite&clustered_csbqrt_allocation_v1>'
),
-- sample
ad_req_with_clusters_joined_sample AS (
    SELECT
        *
    FROM ad_req_with_clusters_joined
    WHERE
        FB_NECTAR_SAMPLING_PCT(CAST(ad_request_id AS VARCHAR)) < {{ sampling_pct }}
),
--- join to find number of simultaneous shows in an auction
unnormalized_interactions AS (
    SELECT
        t1.ds AS ds,
        t1.cluster_id AS cluster_1,
        t2.cluster_id AS cluster_2,
        COUNT(*) AS count_interactions

    FROM

        ad_req_with_clusters_joined_sample t1
    JOIN ad_req_with_clusters_joined_sample t2
        ON t1.ad_request_id = t2.ad_request_id

    WHERE
        t1.cluster_id < t2.cluster_id

    GROUP BY
        t1.cluster_id,
        t2.cluster_id,
        t1.ds
),
max_interactions AS (
    SELECT
        MAX(count_interactions) maxint -- note, if I put the max it's buggy...
    FROM unnormalized_interactions
)
SELECT
    ds,
    cluster_1,
    cluster_2,
    CAST(count_interactions AS DOUBLE) / CAST(max_interactions.maxint AS DOUBLE) interaction_coef,
    count_interactions AS count_interactions
FROM unnormalized_interactions,
    max_interactions
ORDER BY
    interaction_coef DESC

```

## Cluster 'range' constraints implementation

```{python}
import numpy as np
from sklearn.manifold import MDS
from sklearn.preprocessing import MinMaxScaler

# Assuming your similarity matrix is called similarity_matrix
# similarity_matrix = np.array([[1, 0.8, 0.4], [0.8, 1, 0.7], [0.4, 0.7, 1]])  # replace this with your data
similarity_matrix = interactions
# Convert similarity to dissimilarity
max_similarity = np.max(np.max(similarity_matrix))
dissimilarity_matrix = 1./np.sqrt(1.01-similarity_matrix)# somewhat arbitrarily

# Normalize dissimilarity between 0 and 1 (optional)
# scaler = MinMaxScaler()
# dissimilarity_matrix = scaler.fit_transform(similarity_matrix)

# Create MDS model
mds = MDS(n_components=4, dissimilarity='precomputed')# 4 - arbitrarly, tried 3 and 5, didn't want too large one

# Fit and transform data
cluster_dimensionality_embedding = mds.fit_transform(dissimilarity_matrix)

# print(cluster_dimensionality_embedding)
# idea- if we try to force the clusters not to be
# Normalize low-dimensional data to 0-1 range
scaler_low_dim = MinMaxScaler()
cluster_dimensionality_embedding = scaler_low_dim.fit_transform(cluster_dimensionality_embedding)

print(cluster_dimensionality_embedding) 
    if add_cluster_dissimilarities:
        embDim = cluster_dimensionality_embedding.shape[1]
        # New decision variables
        max_coord = {(k,l) : xp.var(lb = 0.0) for k in range(K) for l in range(embDim)}
        prob.addVariable(list(max_coord.values()))
        min_coord = {(k,l) :xp.var(lb = 0.0) for k in range(K) for l in range(embDim)}
        prob.addVariable(list(min_coord.values()))
        # max_coord = prob.continuous_var_matrix(keys1=n_clusters, keys2=Dim, name='max_coord')
        # min_coord = prob.continuous_var_matrix(keys1=n_clusters, keys2=Dim, name='min_coord')
        # Add constraints
        for k in range(K):
            for d in range(embDim):
                for i in range(N):
                    prob.addConstraint(max_coord[k,d] >= cluster_dimensionality_embedding[i,d] * x[i,k])
                    prob.addConstraint(min_coord[k,d] <= cluster_dimensionality_embedding[i,d] * x[i,k])
        # Dimensionality balance threshold
        dimensionality_balance_threshold = 5
        # Add dimensionality balance constraint
        max_range_emb_sum = xp.var(lb = 0.0)
        prob.addVariable(max_range_emb_sum)
        min_range_emb_sum = xp.var(lb = 0.0)
        prob.addVariable(min_range_emb_sum)
        for k in range(K):
            prob.addConstraint(max_range_emb_sum >= xp.Sum( 
                max_coord[k,d]-min_coord[k,d] for d in range(embDim)
            ))
            prob.addConstraint(min_range_emb_sum <= xp.Sum( 
                max_coord[k,d]-min_coord[k,d] for d in range(embDim)
            ))
        prob.addConstraint(
            max_range_emb_sum<=eps_cluster_embeddings*min_range_emb_sum
        )

```

