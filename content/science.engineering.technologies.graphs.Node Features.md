---
id: yy44fsvi5h3oa3wfincuszo
title: Basics
desc: ""
updated: 2024-12-15T22:35
created: 1644941405808
---
## Node Degree

$d_u = \sum_{v\in V} A_{u,v}$

$D =Diag(d)$

## Eigenvector Centrality

It's natural to define centrality as the solution of the recursive linear system:

$e_u = \frac{1}{\lambda}sum_{v\in V} A[u,v] e_v,\forall u\in V$

 The eigenvector centrality vector would be $\lambda  = A e$, where $\lambda$ is the largest eigenvalue of the adjacency matrix. 

### Random Walk probability View

 The eigenvector centrality is the average time we spend in a given node as we do a random walk.

Can solve with the following power iteration:
$e_(t+1) = A e_t$

if we start from $e_0 = (1,1,...1)^T$, then $e_{t}$ will contain the number of length-t paths that end in each node.

## Betweenness Centrality

## Closeness Centrality

## Clustering Coefficient

 This is the proportion of closed triangles in the neighborhood of a node.

Local Clustering Coefficient:
 $c_u  = \frac{\sum_{i\in N(u),j\in N(u)}A[u,v]}{C_{d_u}^2}$

```
    An interesting and important property of real-world networks troughout the social and
     biological sciences are that the local clustering coefficients tend to be much higher 
     than if they were to be sampled randomly.
```

# Ego Graph

An ego graph around a node is the induced subgraph that contains only the node and its neighbors.

Then we can count triangles and other **motiffs** there and characterize the graph like this.

# Graph Level Features

# Bag of Nodes

Aggregate node-level statistics.

# Weisfeiler-Lehman Kernel

Get a hash function $h$ that takes a set of labels and returns a label

1. Assign initial label to each node $l_u^{(0)}$
2. Iterate k times:
   get neighboring labels and hash them w/ $h$. This is the new label $l_u^{(i)}$. 
3. look at the set ${l_u^{(k)}}$ . This summarizes, for each node, info about it's $k$-hop neighborhood.

Compute **histograms or other summary statistics** over these labels and use that as a feature representation of the graph.

# Graphlets And Path-Based methods

## Graphlets

Get graph patterns and count them. Combinatorially difficult, but there are approximations

## Path-Based methods

Run limited-depth random walks from each node, gather stats about how much you've visited all nodes. Gather the **histograpm of the counter** of these nodes...

Can also count occurences of different degree sequences.

# Node-Node Overlap Measures

## Local Overlap Measures

These measures consider only the immediate neighbors of $u$ and $v$.

$S[u,v] = |N(u)\cap N(v)|$

This provides a way to measure how similar 2 nodes are. We usually combine them with the 
assumption that the probability of having an edge is proportional to the similarity coefficient $S[u,v]~ P((u,v)\in E)$

$S_{Sorenson}[u,v] = \frac{2|N(u)\cap N(v)|}{ |d_u+d_v|}$ ^sorensen

$S_{Salton}[u,v] = \frac{2|N(u)\cap N(v)|}{ \sqrt{d_u*d_v}}$ ^salton

$S_{Jaccard}[u,v] = \frac{|N(u)\cap N(v)|}{|N(u)\cup N(v)|}$ ^jaccard

### Importance-aware measures

It's a bit like a [[science.engineering.technologies.Natural Language Processing and IR.TF-IDF]] or other sort of normalizations.

Resource Allocation Index:

$S_{RA}[u,v] = \sum_{u\in N(u)\cap N(v)} \frac{1}{d_u}$  ^resource-allocation-index

So the more 'special' a node in the overlapping neighborhoods of $u$ and $v$ is, the higher it's weight in $S_{RA}[u,v]$

Adamic-Adar Index is quite similar:

$S_{RA}[u,v] = \sum_{u\in N(u)\cap N(v)} \frac{1}{log(d_u)}$ ^adamic-adar-index

## Global Overlap Measures

These are also between two vertices, but they consider the entire graph. E.g. in the 'following fish graph' $A1$ and $A2$ will be pretty similar, though they have $0$ neighbors in common.

<div class="mermaid">
  graph LR;
A1--&gt;B1--&gt;C
A2--&gt;B2--&gt;C
C--&gt;D1--&gt;E
C--&gt;D2--&gt;E
</div>

## Katz Index

The most basic overlap statistics. 
It simply shows the number of paths of all lenghts between two vertices $u$ and $v$, discounted:

$S_{katz}[u,v] = \sum_{i=1}^{\infty} \beta^i A^i_{i,j}$

After some matrix algebra, we notice this index can be written as a matrix as follows:

$S_katz = (I-\beta A)^{-1}-I$

## Leicht, Holme, Newmann (LHN) Similarity Index

This is: Number of Paths of len I/(expected number of paths of len I) were the graph to be randomly generated with the same set of degrees.

To compute the expectation we can do it by sampling the graph.

Alternatively, there is the following analytical expressions:

$E[A[u,v]] = \frac{d_u d_v}{2|E|}$

$E[A^2[u,v]] = \frac{d_u d_v}{(2|E|)^2}*\sum_{u\in V}(d_u-1)d_u$
...
But this doesn't scale for i>3.

There is some more math to approximate using the $i-1$-st smallest eigenvalue

...

S_{LNH}[u,v] = I[u,v]+  \\frac{2m}{d_u d_v}\\sum_{i=1}^{\\infty} \\beta^i \\lambda_1^(1-i)) A^i[u,v]

See more at (2.22) in the book.

where I is an identity matrix
![](/assets/images/2022-02-15-19-41-20.png)![](/assets/images/2022-02-15-19-41-22.png)

## Random Walk Metrics

### Personalized Pagerank

'What's the distribution of nodes visited by a random walker, starting from this node, who teleports back to the starting node with some probability?'

Let us define the stochastic matrix: $P = AD^{-1}$

Then the personalized PageRank with teleport-back probability $1-c$:

$q_u = cPq_u + (1-c)I[:,u]$ 
where I is the identity matrix.

Then $q_u = (1-c)(I-cP)^{-1}e_u$ 

where $e_u$ is the unit vector with a 1 at index $u$ and 0 otherwise.

## Graph Laplacians and Spectral Methods

![[science.engineering.technologies.graphs.Graph Laplacians]]

Laplacians and connected components:
see ![[science.engineering.technologies.graphs.Graph Analysis.Spectral Clustering#^laplacianApproximation]]

<!-- L = A-D

Normalized Version... -->

