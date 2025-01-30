---
id: 0vyc75j7zvid0nwjk52gz06
title: LIinearity Of Mean And Variance
desc: ""
updated: 2024-12-15T22:35
created: 1641940201686
---


let $x_1,x_2,...,x_n$ is a random draw.
let $\bar{x}= \Sigma_{i=1..n}x_i/n$
let $E[x]=\mu$
what is $E[\bar{x}]$?
$E[\bar{x}] = E[\Sigma_{i=1..n}x_i/n]=1/n  E[\Sigma_{i=1..n}x_i] = 1/n*nE[x] = \mu$
$Var(\bar{x}) = E[(\bar{x}-E[\bar{x}])^2] = $

$E[(x-E[x])^2]=E[x^2-2xE[x]+E[x]^2] = E[x^2]-2E[xE[x]]+E[x]^2 = E[x^2] - E[x]^2$

$E(\bar{x}^2) = E[\bar{x}]^2+Var[\bar{x}] $

## Variance of Linear Combinations ##

Let $X_1,X_2,...,X_n$ are independent random variables with means
$\mu_1,\mu_2,...,\mu_n$ and variances $\sigma_1^2,\sigma_2^2,...,\sigma_n^2$.


Then:
Linearity of variance
1. $E[\Sigma_{i=1..n}\alpha_iX_i] =\Sigma_{i=1..n}\alpha_i\mu_i$
2. $Var[\Sigma_{i=1..n}\alpha_iX_i] =\Sigma_{i=1..n}\alpha_i^2\sigma_i^2$

## Proof:
The expectation is obvious.


First, let's show that independence implies $Cov(X,Y) = 0$
Independence implies: $E(XY) = E(Y)E(X)$

Then:
$$
Cov(X,Y) = E[(X-E[X])(Y-E[Y])] = E(XY-E[X]Y-E[Y]X-E[Y]E[X]) = \\
E[XY] - E[X*E[Y]]-E[Y*E[X]] +E[X]E[Y] = \\
E[X]E[Y] -E[X]E[Y]-E[X]E[Y]+E[X]E[Y]=0
$$

For Var:
$$
Var(\Sigma_{i=1..n}\alpha_iX_i)  =E[\Sigma_{i=1..n}\Sigma_{i=1..m} a_i a_j(X_i-\mu_i)(X_j-\mu_j)] = \\
E[\Sigma(a_i^2(E([X_i-\mu)^2])-2*a_i*a_j(E[X_i]-\mu_i)(E[X_j]-\mu_j)] - \\
E[\Sigma{a_i^2*Var(X_i)+0}] = \Sigma_{i=1..n}\alpha_i^2\sigma_i^2  
$$

Where we used that $E[(X_i-\mu_i)(X_j-\mu_j)] = 0$ if $i\ne j$.













