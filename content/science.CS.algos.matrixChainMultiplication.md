---
id: jc7fz2ex3fqzi93cwczirfu
title: Matrix Chain Multiplication Algorithm
desc: ""
updated: 2024-12-15T22:35
created: 1641824235344
---
### A little bit of a tricky problem insofar as dynamic programming goes.

[[science.CS.algos.dynamicProgramming]]

2 matrices $M\in \mathcal{R}^{n,m}$ , and $N\in \mathcal{R}^{m,p}$ are multiplied. 
The result has dimensions $n\times p$. Naive multiplication will be O(n*m*p) time. Reason is that 
we have to do $np$ scalar products, of $m$ elements each.

Now, with [[science.CS.algos.StrassenAlgorithm]], we can reduce the problem to $O(n^{log_2 7})$ time.

So, if we have a chain of matrices to multiply, how do we find the optimal order of multiplication?

Notice we can do bottom up dynamic programming. First say $i$ is such a matrix __last__ matrix in the 
chain in the sense that all other matrices have already participated in a multiplication.

In that case, we know the sizes of the matrices left:
namely they are $n_1,n_i$ and $m_i,m_L$ so nrow of first, ncol of last, and the middle one.

Let 
$$C(i,j)= \text{minimum cost of multiplying } A_i\times A_{i+1}\times A_S{i+2} \times...\times A{j}$$ 

![](/assets/images/2022-01-10-15-39-33.png)

 We're done.







