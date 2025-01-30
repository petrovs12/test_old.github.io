---
id: 9bvrih2okvh0995qrvtosvh
title: "Spectral Clustering: ^ spectral Clustering"
desc: ""
updated: 2024-12-15T22:35
created: 1644941091963
---
Let us have $n$ datapoints and some dissimilarity function on them. We would like to compute a [[science.stats.Unsupervised Learning.Clustering]] on them.
we can use **graph cuts** on a weighted undirected similarity graph $G = ({1,2,...,n},W)$.

$cut(C_1,C_2) = \sum_{i,j\in E, i \in C_1,j\in C_2} w_{i,j}$ where $C_1,C_2$ are arbitrary (disjoint) sets of nodes.

$cut(C_1,C_2,...,C_k) = \sum_{i = 1..k} cut(C_i,\bar{C_i})$ where $\bar{C_i}$ is the complement of $C_1$.

We would like to minimize a normalized version of this cut:

$ratio-cut(C_1,C_2,...,C_k) = \sum_{i = 1..k} cut(C_i,\bar{C_i})/|C_i|$

The reason of doing this is that otherwise we might get too many splits in practice (maybe there's some theoretical reason as well)

## Approximation Via Laplacian Eigenvectors  ^laplacianApproximation

If we define the clusterings as normalized indicator vectors $h$ on the graph, they are orthonormal.  
They also minimize the expression $ratio-cut (C_1,...C_k) = \Sigma_{i=1..K} h_k^TLh_k$.

Were they **not** to identity, it would correspond to computing the eigenvectors.

Which eigenvectors do we take? If the graph was disconnected, there would be multiple eigenvectors, corresponding to the eigenvalue 0.
So we take instead the $k$ eigenvectors,corresponding to the $k$ smallest eigenvalues.

This would gives us a new data representation of the graph, to which we can apply say [[science.stats.Unsupervised Learning.Clustering#^kmeans]] k-means.

