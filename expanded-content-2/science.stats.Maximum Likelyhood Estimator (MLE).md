---
id: fjtu2dinr1f98wdgqla8ble
title: Definition
desc: ""
updated: 2024-12-15T22:35
created: 1644175313621
---
The maximum likelyhood estimator is a method for finding the parameters of a function that maximizes the likelyhood of the data.

If we expand the [[science.stats.Likelyhood Function]] around the MLE $\hat{\theta}$:

$l(\theta) = l(\hat{\theta}) + (\theta-\hat{\theta]})l'(\hat{theta})(=0) - (\theta-\hat{theta})^2 J(\theta)$ maps
where $J(\theta)$ is the observed information[[math.theory.Information Theory.Information (statistics)]] (or the Fisher information $I(\theta)$, depending).

Thus the higher the information, the more concentrated the estimate is around $\hat{\theta}$.

# Asymptotic distribution

$\hat{\theta} \approx  N(\theta,I(\theta)^{-1})$

Relates the information, MLe estimate and the asymptotic distribution of $\hat{\theta}$.

# Iterative estimation

Using [[science.math.Optimization.Newton-Rhapson Method]]

we can do:

$\theta^{i+1} = \theta^{i}-J^{-1}(\theta^{n})*(l'(\theta^{n}))$

where we fix the dimensions as needed ($l'$ in this case will bet the graddient of the log likelihood). 

It's also called the **score** function.

