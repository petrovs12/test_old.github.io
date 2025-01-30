---
id: kovlop79varwc2rf68jw19o
title: Stokes Theorem
desc: ""
updated: 2024-12-15T22:35
created: 1657007830412
---
Connects an integral over $n$ dimensional region to an integral over an $n-1$ dimensional boundary.

Includes as special cases [[science.math.calculus.Fundamental Theorem of Calculus]] and [[science.math.calculus.Green's Theorem]].

## Motivation and Heuristic

Now, imagine we want to calculate the integral $\int_C F\cdot n$. Call this a 'circulation' across the boundary $C$.

Now, we can see that if we 'cut up' C into pieces $C_1,C_2$, it's additive in the bellow sense:

$$

\int F\cdot n = \int_{C_1} F\cdot n + \int_{C_2} F\cdot n


$$

Of course, we can cut more:

$$

\int_C F\cdot n = \sum_{i=1..n} \int_{C_i} F\cdot n 


$$

If we cut an infinitly and make the curves $C_i$ enclose infinitesimal regions, we can reach the limit:

$$

\int_C F\cdot n = \int_R (\int_{C_i} F\cdot n)  dR =\\
\int_C F\cdot n = \int_R curl(F)  dR =\\


$$

Where we just call curl(F) the limit of $\int_{C_i} F\cdot n$ as  $C_i$ grows smaller and smaller.

Now, let's calculate this limit in a 2d setting, assuming we cut into rectangles.

Bellow is the solution in cartesian coordinates.

![](/assets/images/2022-07-05-10-34-17.png)

Very important:
[[science.math.calculus.Conservative Forces]]

