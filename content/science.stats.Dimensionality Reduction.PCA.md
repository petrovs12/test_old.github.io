---
id: fk7io4xo9w2et0sa6v6zq2m
title: Inversion
desc: ""
updated: 2024-12-15T22:35
created: 1641866181295
---
Mathematically, PCA finds a collection of $k<=d$ unit vectors $v_i\in R^{d}$, such that:

1. The variance of the dataset projected into the direction of $v_i$ is maximized
2. $v_i$ is orthogonal to $v_1,v_2,...,v_{i-1}$.

The projection of a vector $x$ onto a vector $v$ is:
$(v.x)*v$. 

Steps:

1. Start with original matrix $X$.

2. Subtract the mean from each row: $\bar{X} = X-\mu$

3. Then the sample covariance is :
   $S_{i,j}=1/(n-1)*(X_{i,:}-\mu_i)*(X_{j,:}-\mu_j) = 1/(n-1)*\bar{X_i}^T*\bar{X_j}$

4. Then the variance of the projection along a vector $v$ is rather: $v^TSv$.

The corresponding optimization problem for the first principal component is then

maximize $v^TSv$

s.t. $v^Tv=1$

Let the principal components be gathered column-wise in a matrix $V = [v_1,v_2,...,v_n]$.
Then $Z=\bar{X}V$ is the so-called **loading matrix**. First $k$ columns give a k-dimensional representation of $X$.

We can invert back to $R^d$ like so:
$x_i = V_{1:k}V_{1:k}^Tx_i$

Optimal reconstruction (in the )

The above suggests there exists a full set of orthonormal eigenvectors for $S$ over $R$. Since $S$ is real and symmetric, the real spectral theorem implies this.

If we write the eigendecomposition of S:
$S = TDT^{-1}= TDT^T$

# SVD

if we write the SVD of $\bar{X} = UDV$, then 
the loading matrix is $Z = XV = UD$

So we can get the principal components via the SVD. Or, rather, the $V$ holds the principal components.

