---
id: 4yk3b3gmtofdyi3wluxxqix
title: Regularizations
desc: ""
updated: 2024-12-15T22:35
created: 1641864475560
---
[[science.stats.Regression.Linear Regression]]

# MAP vs MLE

[[science.stats.Regression.Linear Regression]]

Given a dataset X, a common task is to try to estimate the most likely values for the model parameters. To do this, you must find the values that maximize the likelihood function, given X. In this example, if you have observed a single instance x=2.5, the maximum likelihood estimate (MLE) of θ is $\hat{\theta}=1.5$. If a prior probability distribution g over θ exists, it is possible to take it into account by maximizing $L(θ|x)g(θ)$ rather than just maximizing $L(θ|x)$. This is called **maximum a-posteriori (MAP) estimation**. Since MAP constrains the parameter values, you can think of it as a regularized version of MLE.

For example $L_1$ regularization is equivalent to putting a Laplace prior on the parameters, whereas
$L_2$ regularization is equivalent to putting a Gaussian prior on them.

# L1, L2, Ridge, Tikhonov, LASSO

Ridge regression has a closed form solution.

[[science.math.Norms and Metrics]]

# Dropout

![[science.math.Optimization.Regularizations.Dropout]]

