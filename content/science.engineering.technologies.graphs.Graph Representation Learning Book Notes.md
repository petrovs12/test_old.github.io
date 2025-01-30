---
id: dveq0ejkwt2lhbut7up2rwo
title: Feature Information
desc: ""
updated: 2024-12-15T22:35
created: 1644927461109
---
Notes from [Hamilton's book](https://www.cs.mcgill.ca/~wlh/grl_book/files/GRL_Book.pdf) mostly, as well as some other places...

We mostly deal with Node Level Attributes:

Say we have m attributes for each node, $X\in\mathcal{R}^{|V|xm}$.

In some rare cases we could have Edge-level attributes ay we have m attributes for each node, $X\in\mathcal{R}^{|E|xm}$.

# ML On graphs

## Node Classification ^ nodeClass

Semi-supervision. When we're training node classification algorithms, we do still have the full graph, but we're missing the labels of the 
test nodes. 
Thus, the train and test set are not independent and information from structures and maybe features of the test set is used
during training.

```
Semi-supervised is a standard term for combining labeled and unlabeled data. However, semi-supervised learning still kind of assumes exchangeability (i.i.d. errors), so we can see Graphs

```

## Relation Prediction ^relationPred

 We are given a set of nodes $V$ and an incomplete set of edges between these nodes $E_{train}\subset E$. Our goal is to use this partial information,
  as well as the node labels $X\in R^{|V|*k}$ to predict the mixxing edges $E_{test} = E - E_{train}$.

We might also be required to predict the label of the relation, if there are multiple labels. E.g. Facebook 'friendship' relation is one thing, but for medical stuff there might be much more.

## Clustering and Community Detection ^communityDetection

Community Detection- the analog of [[science.stats.Unsupervised Learning.Clustering]].

For example, also look at [[science.engineering.technologies.graphs.Graph Analysis.Spectral Clustering]].

 Examples:

- Collaboration Graphs

## Graph Classification, Regression, and Clustering ^graphClassification

Doing the same thing on the level of graphs

# Graph Statistics and Kernel Methods

## Node Features

[[science.engineering.technologies.graphs.Graph Analysis.Node Features]]

