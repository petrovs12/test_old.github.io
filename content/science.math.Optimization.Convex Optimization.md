---
id: af0sfqez1fj39ho0ze432zx
title: Duality Gap
desc: ""
updated: 2024-12-15T22:35
created: 1641835000693
---
The  [[math.Optimization.Lagrangian]] dual yields a **lower bound** of the objective value of the optimization problem.

[[science.math.Optimization.Linear Programming]]
[[science.math.Optimization.Semidefinite Optimzation]]

Not sure what this is and why it's interesting...
[SOS tools](http://www.mit.edu/~parrilo/sostools/)

If the gap is 0, then the solution is optimal.

# A saddlepoint/ game characterization

**The primal and dual objective values can be characterized as a game where the 'minimizing' and 'maximizing' 'players' switch their order:**

$p^* = inf_{x\in D} sup_{\lambda,\mu} L(x,(\lambda,\mu))$ : first choose x, maximize result wrt the lagrangian multipliers

$d^* = sup_{\lambda,\mu} inf_{x\in D} L(x,(\lambda,\mu))$ : first choose lagrangian multipliers, then minimize result  x

NOTE - in the notation above, the OUTSIDE optimization happens FIRST, and the INSIDE optimization happens SECOND.

Therefore weak duality corresponds to the max-min inequality:

$ sup_{\\lambda,\\mu} inf_{x\\in D} L(x,(\\lambda,\\mu)) &lt;=inf_{x\\in D} sup_{\\lambda,\\mu} L(x,(\\lambda,\\mu))$, which holds for general functions, not just 
the [[math.Optimization.Lagrangian]].
That is, the 2nd player has the advantage.

# Optimiality conditions

[[science.math.Optimization.Convex Optimization.KKT Slater Complimentary Slackness]]

