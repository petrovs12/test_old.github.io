---
id: hhepdu8myqzsgiydm29fw6x
title: Inner Products and Hilbert Spaces
desc: ""
updated: 2025-01-26T19:21
created: 1644242962056
publish: true
---
A Hilbert Space is a space with an inner product and one where the limits of all Cauchy sequences wrt the norm, defined by the inner product, are in the space itself.

The inner product defines a norm by taking the inner product of an element with itself.

# Kernel Function

Let H be a Hilbert Space.
A function $k:R^d->R^d->R$ is called a kernel on $R^d$ if there exists a feature map $\phi:R^d->H$, s.t. $k(x,y) = <\phi(x).\phi(y)>$, for all $x,y\in R^d$ (or a subset thereof).

# Positive Definite Kernel Matrix (Mercer)

A function $R^d->R^d->R$ is positve-definite iff for any $a_1,a_2,...a_k \in R$, $x_1,x_2,...x_k \in R^d$,k is symmetric and 
$\Sigma_{i = 1..n} \Sigma_{j=1..n} a_i a_j k(x_i, x_j)>=0$
Same as saying for any $x_1,x_2,...x_k \in R^d$, the matrix with entries $M_{i,j} = k(x_i,x_j)$ is positive definite (or semi-definite).

from [Mercer's Theorem (Wikipedia)](https://en.wikipedia.org/wiki/Mercer%27s_theorem)

## Mercer's Theorem

 Suppose K is a continuous symmetric non-negative definite kernel. Then there is an orthonormal basis {ei}i of L2[a, b] consisting of eigenfunctions of TK such that the corresponding sequence of eigenvalues {λi}i is nonnegative. The eigenfunctions corresponding to non-zero eigenvalues are continuous on [a, b] and K has the representation

$K(s,t)=\sum _{j=1}^{\infty }\lambda _{j}\,e_{j}(s)\,e_{j}(t)K(s,t)$

$=\sum _{j=1}^{\infty }\lambda _{j}\,e_{j}(s)\,e_{j}(t)$$

 Where the convergence is absolute and uniform.

So essentially, if K is positive definite in the above sense, there exists a feature map, for which K is the inner product of the output space.

# Reproducing Kernel Hilbert Spaces

## Representer Theorem and Regularization

## Different Kernels and Operations

# Kernel SVM

[[science.stats.Support Vector Machines]]

We have an analogy of the original SVM dual formulation, with a generalized kernel at the place of the inner product function.

# Kernel PCA

[Look at the pretty pics from sklearn](https://scikit-learn.org/stable/auto_examples/decomposition/plot_kernel_pca.html#sphx-glr-auto-examples-decomposition-plot-kernel-pca-py)

# Representation of Probability Densities

Possible, but looks complicated from the lecture notes :D

