---
id: nr3teay0znh86p2329p2n1t
title: Benders Decomposition
desc: ""
updated: 2024-12-15T22:35
created: 1642267024142
---

[[science.math.Linear Algebra.Matrix Decompositions]]

[[science.math.Optimization.Linear Programming]]
[[science.math.Optimization.Linear Programming.Stochastic Programming]]



There is now a nice [Wikipedia article](https://en.wikipedia.org/wiki/Benders%27_decomposition).

Following that, we note:

Starting with:

$$
\text{minimize } c\cdot x + d \cdot y\\
\text{subject to } Ax + By \leq b, \\ x \geq 0,
\\ y \in Y
\\x \geq 0
$$

Now, the x-variables are 'simple', in the sense that they are in a polytope wrt the y-variables.

On the other hand, the y-variables may be a part of a more annoying structure.

Now, let's consider the problem with the y-variables fixed.
It's primal now becomes:

$$
\text{minimize } c\cdot x \\
\text{subject to } Ax \leq b- B\bar{y}
\\ x \geq 0
$$

The dual of that now becomes:


$$
\text{minimize } (b-B\bar{y})\cdot z \\
\text{subject to } A^Tz \geq c 
\\ z \geq 0
$$

In the wikipedia it looks a bit differently...

But okay, now the key part is that the polytope of the dual is the same, regardless of the choice of \bar{y}, only the objective function changes...

Now, remember the 'Minkovski formulation' for a linear problem. Essencially, it uses the fact we have to check only the following:

For a solution value:
1. Check the solution value at the proposed point <= value at every vertex.
2. For each infinite ray of the check if the slope of the objective value has a negative angle with them (if it does, it's unbounded).

Thus, as we solve the subproblems, we either get a solution, or a sertificate of unboundedness (as an infinite ray).

We add the corresponding cut to the master problem.

Namely:
For every vertex in 

Now, remember the criteria for unboundedness.





