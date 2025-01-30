---
id: mbmeszld9dd53iu8gs5n0bp
title: Vectors
desc: ""
updated: 2024-12-15T22:35
created: 1641835038170
---
Summary from [here](https://minireference.com/static/tutorials/linear_algebra_in_4_pages.pdf).

Also this is interesting [cheat sheet](https://www.cs.cornell.edu/~tomf/notes/cs421-cheat-sheet.pdf), which is a bit more concise and goes somewhat deeper.

A vector $\vec{v}\in R^n$ is a tuple $(v_1,v_2,...,v_n)$.
A matrix 

$$
A=\begin{bmatrix}
a_{11} & a_{12} & \cdots & a_{1n}\\
a_{21} & a_{22} & \cdots & a_{2n}\\
 & \cdots\\
a_{21} & a_{22} & \cdots & a_{2n}\\

\end{bmatrix}
$$

# Vector Spaces ^vector-spaces

moo

# Distances and Norms ^norms

# Determinant ^determinant

# Matrix Inverse ^invers

$A^{i}$:= solution of the equation $A*A^{-1}=I$.
If A's columns is orthonormal, then $A*A^{T}$.

# Matrices and Linear Transformations ^linear-transformations

![[^Vector-Spaces]]
[[science.CS.algos.matrixChainMultiplication]]

[[science.math.Linear Algebra.Inverse Matrix]]

# Similar Matrices, Eigenvalues and Eigenvectors ^eigenvectors

 The set of eigenvectors $\vec{e_1},\vec{e_2},...$ of a matrix $A\in R^{n x n}$ is a set of vectors $\vec{v}$ such that matrix multiplication is simple scaling:
  $A\vec{v}=\lambda_i\vec{e_i}$.

  Scaling factor can be different for each eigenvector. These scaling factors are called eigenvalues $\lambda_i$.

$(A-I*\lambda{i})*\vec{i}=0$

Certain matrices (if all eigenvalues are different, i.e. have multiplicity of 1), for which all eigenvalues are different, can be written as:

$A = Q*\Lambda*Q^{-1}$
where $\Lambda$ is diagonal matrix with eigenvalues and $Q$ is orthogonal matrix with eigenvectors.

$Q=[e_1,e_2,...e_n]$. 

Proof:[[science.math.Linear Algebra.Change Of Basis]]

## QR Decomposition ^qr-decomposition

A $QR$ decomposition is a decomposition of a square matrix $A$ to a product of a orthonormal matrix $Q$ and
upper- triangular matrix $R$ such that $A=QR$.

### Orthgonalization by Gram-smidth

Let $A = [\bold{a_1},\bold{a_2}...]$.
Then let:

$u_1 = a_1, e_1=u_1/||u_1||$

$u_2 = a_2-(a_2\cdot e_1)*e_1, e_2=u_2/||u_2||$

$u_k = a_k-\Sigma_{i=1..(k-1)}(a_k\cdot e_i)*e_i, e_k=u_k/||u_k||$

In words:
To find the vectors:

1. Take the first vector and normalize it. This is $e_1$
2. Take the second vector, figure out the part, orthogonal to $e_1$, and normalize it. This is $e_2$
3. Taking the $k$-th vector, figure out the part, orthogonal to $e_1,e_2,...,e_{k-1}$, and normalize it. This is $e_k$
4. Repeat till $k=n$ (inclusive)

Then, $a_k$ is a linear combination of $e_1,e_2,...,e_{k}$.

# SVD ^svd

[[science.math.Linear Algebra.Singular Value Decomposition]]

[[science.stats.Dimensionality Reduction.SVD]]

SVD is in a sense a  generalization of eigenvalue decomposition, but can be applied to non-square matrices.

More concretely, if the singular values are $\sigma_1,\sigma_2,...,sigma_n$, then
$\sigma_i^2$ are the eigenvalues of A^T\*A=A^2$ .
[SVD from wikipedia](https://en.wikipedia.org/wiki/Singular_value_decomposition)

Relationship between SVD and [[science.math.Linear Algebra#^qr-decomposition]]:

 Suppose that $A$ has full column rank and let $A=QR$ be a $QR$ decomposition for A.
 There exists a SVD of A s.t. $Q=U$ iff $A*A$ is diagonal.

(Source)[https://math.stackexchange.com/questions/2348807/is-there-any-connection-between-qr-and-svd-of-a-matrix]

![Visual summary](/assets/images/2022-02-04-13-59-52.png)
(Another correspondence)[https://intoli.com/blog/pca-and-svd/]

# PCA ^pca

[[science.stats.Dimensionality Reduction.PCA]]

# Jacobian and Hessian ^jacobian

[[science.math.Optimization.Gradient Descent]]
[[science.math.Optimization.Second Order Optimizers]]
[[science.math.calculus]]

Jactobian is the 'first' derivative of a function $R^m->R^n$, i.e. the 'gradient' [[science.math.calculus.Gradient]], while Hessian is the second derivative.

# Cholesky Decomposition ^cholesky

[[science.math.calculus.Numerical Methods]]
It's the "sqrt" of a matrix.

