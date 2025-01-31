---
id: gn5lfmb6z9zf8am27oj06wb
title: Delta Method
desc: ""
updated: 2024-12-15T22:35
created: 1644175732312
---
 Suppose we have $X_1,X_2,...,X_n$ i.i.d. and with mean $mu$ and finite variance $\sigma^2$. Then from [[science.stats.Central Limit Theorem]] we know that
 for

 $\bar{X} = 1/n\Sigma_{i=1..n} X_i$ 

 $\frac{\bar{X}-\mu}{\sigma/\sqrt{n}} \approx N(0,1)$.

This tells us something about the distribution of $\bar{X}$. Now, sometimes we want to know the distribution of
$g(\bar{X})$ for some X. Delta method allows us to do so by doing a Tailor-expansion around $\mu$:

$g(\bar{X}) \approx g(\mu)+ (\bar{X}-\mu)g'(mu)$

$E(g(\bar{X})) = E(g(\mu)) + E(g'(\mu)(\bar{T}-\mu)) = g(\mu)+ g'(\mu)E(0) = g(\mu)$

$Var(g(\bar{T})) = Var(g(\mu))(==0) + Var(g'(\mu)(\bar{T}-\mu))=g'(\mu)^2*Var(\bar{X}) = g'(\mu)^2*\sigma^2/n$

# Fisher Information, CI and Asymptotics

[[math.theory.Information Theory.Information (statistics)]]

In statistics

# Laplace Approximation

