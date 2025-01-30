---
id: 0iacjiq0uf8m2tuv3le5slk
title: Duality
desc: ""
updated: 2024-12-15T22:35
created: 1644233053625
---
Let of have a constrained optimization problem like so: like so:

$min_x f(x)$

$\text{s.t. }  f_i(x)<=0 \text{ for } i = 1..k$

$h_i(x)=0 \text{ for } i = 1..l$

Where g and h are the constraint functions.

The [[math.Optimization.Lagrangian]]  problem
is then $min_{x} max_{h,l} f(x) +\Sigma_{i = 1..l} \lambda_i f_i(x) + \Sigma_{i = 1..k}\mu_j g_i(x)$ 
$\text{s.t. } \mu_i<=0$

The lagrangian is a lower bound of the original problem:
if we define the function above:

$g(\lambda,\mu) = inf_{x\in D} f(x) +\Sigma_{i = 1..l} \lambda_i h_i(x) + \Sigma_{i = 1..k}\mu_j f_i(x)$
where $D$ is the feasible domain of x.

if D is empty, $g(\lambda,\mu) = \infty$.

[[science.math.Optimization.Linear Programming]]
[[science.math.optimization.Dynamic Programming.Approximate Dynamic Programming]]

