---
id: eocwqvsmylgbvsbcotg4cdq
title: Resources
desc: ""
updated: 2024-12-15T22:35
created: 1641834890562
---
[[science.math.Optimization.Simplex]]

[[science.math.Optimization.JuMP]]

#lowprio
[Some Matlab LP book link](https://drive.google.com/open?id=0B-C_0LZtyGcNaVluTjBvZDlNUGc&resourcekey=0-d9atqT3fimtNzM9F_9fhOQ&authuser=stefanvpetrov%40gmail.com&usp=drive_fs).

# Duality

Suppose we have the following linear program in a 
cannonical form:

$$
\text{minimize } c\cdot x
\\
\text{subject to } Ax \leq b,\\ x \geq 0


$$

Then, let's define the following polytope in the variables $y$:

$$
A^T y \geq c\\

y \geq 0


$$

Then, left-multipying both sides of the primal polytope by the $y^T$, we get:

$y^T b\geq y^T A x\geq c^Tx$

Thus, $y^T b$ is an upper bound for $c^T x$, and if we consider the following dual program:

$$
\text{min } y^T b \\
A^T y \geq c\\

y \geq 0
$$

We get the smallest upper bounds...

