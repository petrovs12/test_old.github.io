---
id: 7d5nu4soz8p87raut7ara43
title: Random forests are a bagging method
desc: ""
updated: 2024-12-15T22:35
created: 1643149185015
---
Bootstrap Aggregation:

Generate many datasets that are statistically similar to your training data, train models on them, and aggregate them together somehow.

 Intuitively, this will reduce overfitting (variance) at the cost of some bias and computation. You're forcing your model to be able to robust to reasonable changes in datasets.

 Due to this, best to use with learners with $high variance and low bias$: e.g. Decision Trees, knn, Nets.

