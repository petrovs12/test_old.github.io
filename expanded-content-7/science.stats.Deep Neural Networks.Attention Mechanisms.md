---
id: pk4ze0c2o5qijmd3zruo271
title: Bahnadau Attention mechanism
desc: ""
updated: 2024-12-15T22:35
created: 1644708670411
---
Let's start with training inputs $x_1,x_2,...,x_n$ as input sequence and $y_1,y_2,...,y_n$ as target sequence.

Then we will have the following model:

1. Compute $h_i = concat(h_{i,forward},h_{i,backward})$, encoding of 2 LSTM's, one ran forward and one ran backward **only on $x$- the input sequence**.
2. Initialize $s_0$ randomly
3. Define $a_{0,j} = softmax(s_0,h_j$  for $j=1..N$.
4. Define now $c_1 = \Sigma_{j=1..N}h_j*a_{0,j}$
5. Postulate $s_1 = f(s_0,y_0,c_1)$
6. Postulate $y_1 = g(y_0,s_1,c_1)$

Unroll the above in a loop, so it becomes:

1. Define $a_{t,j} = softmax(s_{t-1},h_j$  for $j=1..N$.
2. Define now $c_t = \sum_{j=1..N}h_j*a_{t,j}$
3. Postulate $s_t = f(s_{t-1},y_{t-1},c_t)$
4. Postulate $y_t = g(y_{t-1},s_t,c_t)$

Note now after training we only use $y$ in the last 2 equations, and $y_t$ appears only on the left-hand side of the last equation.
This gives a way to generate $y$.

Simulate 'time flow' with masking.

# Transformer Tutorial from

<https://www.jku.at/fileadmin/gruppen/173/Research/Introduction_to_Transformers.pdf>

### RNN Recap

Output $h^{(t)}$ is a function of input $e^{(t)}$ and the
output of the previous time step $h^{(t-1)}$.
$h(t) = RNN(h(t-1), e(t))$

$h^t$ - is hidden state

If part of a whole, we can say $h^t$ is a contextualized embedding of $e^t$.

## Attention Networks

General Form :
$O=Att(Q,V)$
where all of the above are whole matrices:

![](/assets/images/2022-03-02-17-10-22.png)

![](/assets/images/2022-03-02-17-10-41.png)

Given a set of vector values $V$, and a set of vector
queries $Q$, attention is a technique to compute a
weighted sum of the values, dependent on each query.

The weights in the weighted sums are called **attentions**
and denoted by $\alpha$.

So, then:

$\alpha_{i,j}$ - weight for "query" $i$ on "value" $j$.
$alpha_i$ - attention for "query" $i$.  
$\sum(\alpha_i)=1$.
$\alpha_{i,j} = f(q_i,v_j)$ 

where $f$ is some neural network.

The output $o_i= \sum_{j=1..|V|}alpha_{i,j}*v_j$

### Attention Variants

Unnormalized dot product attention.

Let 
$\bar{a}_{i,j} = q_i*v_j$

$a_{i,j} = \frac{exp(a_{i,j})}{\sum_j(exp(a_{i,j}))}$

$v^{out}_j = \sum_{j=1..}a_{i,j}*v_j$
is then the contextual representation
The scaled version would be:

$\bar{a}_{i,j} = \frac{q_i*v_j}{\sqrt(d)}$

Another version w/ some paramters would be:

$\bar{a}_{i,j} = q_i*\bold{W}*v_j$ where **W** is a parameter matrix.

Problem w/ single- head attention is that softmax is quite 'sharp' and maybe there are multiple 'concepts' to learn (e.g. one is subject-object relation, another subject-verb, etc).

In multi-head attention, we can pre-project the embedding into a smaller space, and then concat the outputs.

