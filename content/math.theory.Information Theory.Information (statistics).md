---
id: 8pf6o0au8x29g8khz3ipat7
title: Information (statistics)
desc: ""
updated: 2024-12-15T22:35
created: 1644177838087
---

If we have observed the i.i.d. sequence $X_1, X_2, \ldots, X_n$ with $n$ observations,  $L(\theta) = f(x;\theta)$ is the corresponding [[science.stats.Likelyhood Function]] and $l(\theta)$ is the log-likelihood, then the __observed information__ is:

 $J(\theta) = - \frac{d^2l(\theta)}{d\theta^2}$

So it's the negative hessian of the log-likelihood function. 
It's important, as it's intimitely related to asymptotic distribution of parameters.

[[science.stats.Maximum Likelyhood Estimator (MLE)]]


The __expected__ or __Fisher__ information is instead:
    
$I(\theta) = - E_{X}[\frac{d^2l(\theta)}{d\theta^2}]$

Where the expectation is taken over the data distribution $X$.




