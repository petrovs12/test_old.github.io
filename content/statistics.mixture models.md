---
id: dxu1kmf3ns7msbr1h2a935h
title: Mean and Variance of a Limear Combination of Random Variables
desc: ""
updated: 2024-12-15T22:35
created: 1688723749933
---
Under independence assumptions, if we have $N$ random variables $X_i$ with means $\mu_i$ and variances $\sigma_i^2$, and non-negative weights $w_i$, then the mean and variance of a linear combination of these random variables is given by:

$Y = \sum_{i=1}^N w_i X_i$

$\mu_Y = \sum_{i=1}^N w_i \mu_i$

$\sigma_Y^2 = \sum_{i=1}^N w_i \sigma_i^2$

Let's call the function that takes a list of $mu$ and $sigma$ values and a list of $w$ values and returns the mean and variance of the linear combination `linear_combination_mean_variance`.

# Mean and Variance of a Mixture of Random Variables

Under the assumptions above,
the mean and variance of a mixture of random variables, where the weights sum to 1, is given by:

$\mu_Z = \sum_{i=1}^N w_i \mu_i$

$\sigma_Z^2 = \sum_{i=1}^N w_i \sigma_i^2 + \sum_{i=1}^N w_i(\mu_i)^2- (\sum_{i=1}^N(w_i\mu_i)^2)$ 

Note that the last 2 terms can be interpreted as the variance of the means of the mixture.

Let's call the function that takes a list of $mu$ and $sigma$ values and a list of $w$ values and returns the mean and variance of the mixture `mixture_mean_variance`. We Assume default $w$ parameter be list of $1/len([\mu])$ of length $len([\mu])$.

# Splitting a distribution into a mixture with the same mean and variance

Let the distribution have mean $\mu$ and variance $\sigma^2$.
This can be done by using the equation for the mixture in the following way:

1. Take as parameters the number of mixtures to split into $L$
2. As another parameter the target variance of each component in the mixtures $\sigma_{comp}^2$.
3. Set the target mean of the means of the mixture be the original distribution mean $\mu$. That would make the mean of the mixture equal to the mean of the original distribution.
4. Then we need same for the variance. We will achieve it by taking the variance of the means in the mixture to be:
   $\sigma^2 = \sigma_{comp}^2 + Var(means)$. This directly gives us the variance of the means, and we can just sample from them and sort.
   Let the function, implementing this, be called **splitDistribution**($\mu,\sigma,\sigma_{component},L=100$), returning list of means and list of variances, size $L$. 

# Modeling 'Mixture of Controls'

Let's have a CS-BQRT batch with relative experiment sizes (as measured by the total SAV in their control segments) 
$s_1, s_2, ..., s_N$., normalized: $\sum_{i=1}^N s_i = 1$.

Then, imagine somehow we have a proper control on the full CS-BQRT Traffic, and the distribution over it's segments 
has mean $\mu_t$ and variance $\sigma_t^2$.

Then let's imagine we did a split of that distribution like in the previous section, and we got $N=100$ distributions,
so $[\mu_{ci}|{i=1..100}],[\sigma_{ci}^2|{i=1..100}]=splitDistribution(\mu_c,\sigma_c,\sigma_c/2,100)$.
where the 'target variance' is arbitrarly chosen here.

## Proposition 1:

The mean and variance of the SAV, obtained by an experiment $i$, would be given by **mixture_mean_variance**(unzip(\[**linear_combination_mean_variance**[$\mu_{c_i}$],[$\sigma_{ci}^2$],[$s_i$])|i = 1..100]).

In words, to get the SAV distribution for a given experiment, we first down-scale w/ experiment size each individual 'user bundle' we found when we split the original distribution into a mixture, and then we mix together the down-scaled segments.

## Proposition 2:

As we do this process for each experiment, then we use their linear combination to get the distribution of the SAV for the whole CS-BQRT batch.

We get the same expected mean as the original distribution, and variance, depending on the level of mixing. 
The variance would grow for more uniform experiment sizes, and would shrink for more skewed sizes. In the limit of one
huge experiment it would grow to the variance of the original distribution (maybe + whatever variance we added when we sampled segments (???)). 

The variance would shrink as we have more and more experiments of the same size, up to a limit.

