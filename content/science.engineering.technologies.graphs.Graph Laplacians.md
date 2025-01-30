---
id: vzj35f8ek0gp3479m4qkvui
title: Normalized Versions
desc: ""
updated: 2024-12-15T22:35
created: 1644927709297
---
Let $G= (V,E)$ be a graph and $w:E->R^{+0}$ be a weight function. Then let the degree matrix D be the diagonal matrix with $D_{i,i}=\sum_{j\in E} w(i,j)$. Let the corresponding adjacency matrix be $A_{i,j} = w_{i,j}$
Then the unnormalized Graph Laplacian is given by:

$L = D-A$

In the unweighted case, all edges have a weight of 1, and non-edges have a weight of 0.

We can show that $L$ is positive semidefinite,that is, for any vector $v$ in $R^{n}$, $v^TLv$ is non-negative.

Symmetric:

$L_{sym} = D^{-1/2}LD^{-1/2}$

Random Walk Laplacian:

$L_{RW} = D^{-1}L$

