---
id: q6ohp66io3bos4hljha4e3b
title: Expectation Maximization (EM) Algorithm
desc: ""
updated: 2024-12-15T22:35
created: 1644841406388
---

Mostly from the Wikipedia article.


The EM algorithm applies when we have a probabilistic generative model in mind with likelihood $L(\theta;X)$ and further split the parameter vector in two parts: $\theta$, representing 'parameters', and $Z$, representing latent/ unobserved data.

So $L(\theta;X) = \int_Z p(X|Z,\theta)P(z|\theta)dz$

Had we known Z, it would be simply $L(\theta;X,Z)$


#TODO Finish this one

We can keep track of:
$\theta^{(t)}$- current estimates of $\theta$, and 
 $Q(\theta,\theta^{(t)}) = E_{Z~P(Z|X,\theta^{(t)})} (log L(\theta;X,Z))$ - expectation of the log likelyhood of $\theta$, taken over the conditional distribution of Z .

Expectation step (E step): 
1. Find current function Q_{\theta^{(t)}}=Q(\theta,\theta^{(t)}) .
2. Find the maximizer $\theta^{(t+1)} = Q(\theta|\theta^{(t)})$.


Motivation:

 If the value of the parameters $\theta$ is known, usually the value of the latent variables $Z$ can be found by maximizing the log-likelihood over all possible values of $\Z$ , either simply by iterating over $Z$ or through an specialized algorithm for the specific generative structure. For example, if we have an HMM, the MLE estimates for it's latent variables can be estimated by the [[science.CS.algos.dynamicProgramming.Viterby Algorithm]]. Conversely, if we know the value of the latent variables $Z$ , we can find an MAP estimate of $\theta$ by maximizing the log likelyehood. This suggests an iterative algorithm, in the case where both $\theta$ and $Z$ are unknown .
1. First, initialize the parameters $\theta$ to some random values.
2. Compute the probability of each possible value of $Z$, given $\theta$. 
3. Then, use the just-computed values of $Z$  to compute a better estimate for the parameters $\theta$.
4. Iterate steps 2 and 3 until convergence.
The algorithm as just described monotonically approaches a local minimum of the cost function.
