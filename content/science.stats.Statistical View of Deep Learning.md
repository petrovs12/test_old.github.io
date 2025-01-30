---
id: 81rnzprypbm72cx2zaha4f6
title: Statistical View of Deep Learning
desc: ""
updated: 2024-12-15T22:35
created: 1646297244003
---



From [S. Mohamed's review paper](http://www.cs.columbia.edu/~blei/seminar/2020-representation/readings/Mohamed2015a.pdf) we know that if we have a glm model:


$\hat{y} = \beta^T x+\alpha$
$Var(\hat{y}) = \sigma^2$
$E(y) = Link^{-1}(\hat(y))$

Where $\bf{\beta},\alpha,\sigma$ are parameters to esimate.
Link functions are listed here:[[science.stats.Regression.Loss Functions.Activation Functions]]