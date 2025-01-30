---
id: fm6zyymppjcl8qq9qt9rh8w
title: Markov Decision Process
desc: ""
updated: 2024-12-15T22:35
created: 1643068623932
---



A Markov Decision Process (MDP) is a stochastic process that is characterized by a set of states, a set of actions, and a transition function.

$S$: States

$A$: Actions

$P(s'|s,a)$: Transition function

$R(s,a)$: Reward function

$T$: Terminal states

<!-- We would like to find a policy $\Pi:S->A$ that maximizes the expected reward $E\Sigma_{s'\in S} R(s',a) P(s'|s,a)$.

We can solve this by solving the Bellman equation:

$$\sum_{s'\in S} R(s',a) P(s'|s,a) = \sum_{s'\in S} R(s',a) P(s'|s,a) + \gamma \sum_{s'\in S} P(s'|s,a) \max_{a'\in A} R(s',a')$$

where $\gamma$ is the discount factor.

The optimal policy is then given by the following equation:

$$\Pi(s) = \arg\max_{a'\in A} R(s,a')$$

The optimal policy is a function that maps
 -->
