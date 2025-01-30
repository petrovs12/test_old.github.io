---
id: 4yneac4syq7yi0wr45mbato
title: Danzig-Wolfe Decomposition
desc: ""
updated: 2024-12-15T22:35
created: 1654526390452
---


The dual of [[science.math.Optimization.Linear Programming.Stochastic Programming.Benders Decomposition]]

Column generation, roughly speaking;

In a linear program, we have a set of constraints, and a set of variables. Imagine the set of variables is very large, so as to perhaps be untracktable.

For example, in a max-flow problem all possible paths might be considered, and in a graph $G=(V,E)$, the number of paths between two verticles $s,t$ might be exponential in $E$.

We will generate the 'path' variables on the fly, by using the following two principles:


1. If we have an optimal solution for the problem with number of variables, the dual solution $y$ is still the 'correct size' (i.e. in the above case, capacity and balance constraints). Thus we can ask 'hey, in our combinatorial set, can we find an element $\bar{x}$ s.t. $(c-A^Ty)\cdot\bar{x}<=0$ .
The quantity $c-A^Ty$ is called 'reduced cost vector' and is essencially the derivative of the objective function with respect of some variable vector x.
More detail [in the wikipedia article](https://en.wikipedia.org/wiki/Column_generation#:~:text=Column%20generation%20or%20delayed%20column,a%20subset%20of%20its%20variables.)
The reaso for the  changed objective function is that in our constrained optimization problem, as something enters the basis, the other variables need to change values so we're still inside the polytope.

2. The 'size' of the solution, i.e. the number of variables, entering the basis, is limited by the number of rows. Thus the procedure terminates at some point







