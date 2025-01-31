---
id: 5b1ccgvjltzi8cv3gteamm8
title: A/B Testing or Experimental Design
desc: ""
updated: 2024-12-15T22:35
created: 1642360312726
---
From [DataInterviewPro](https://www.youtube.com/watch?v=X8u6kr4fxXc&ab_channel=DataInterviewPro)

Controlled experiments (e.g. clinical trials).

Usually when we run experiments, we want to see difference in certain [[seed.Product Management.Product Metrics.User Based Metrics (Digital Products)]], e.g. ![[seed.Product Management.Product Metrics.User Based Metrics (Digital Products)#^active-users]].

![[science.stats.tests#^ttest]] can be used in the simplest case, or some bayesian setup. 

Type II error (or power). Power = 1 - Type II error.
$sample_size \approx \frac{16\sigma^2}{\tau^2}$ where $\tau$ is the effect size (difference in the metric chosen between the control and treatment group).

As we don't know $\tau$, we can choose the **minimal detectable effect size**, equal to the minimal business-relevant effect size, i.e. the min effect that would justify a switch. 

Normally **decided by stakeholders**.

# Multiple Testing Problems

Bayesian setup, Bonferroni correction, or something else.

Bonferroni correction:
divide significance level by the number of tests.

But sometimes too conservative, i.e. lower recall

Or can control **False Discovery Rate**.

$FDR = E[\frac{falsePositives}{rejectiosn}]$.
This can be calculated, then choose a threshold for FDR, etc.

In a decision-making setup, can optimize the above...

# Novelty and Primacy Effect

User behavior can either be resistent to change, or welcoming it, and we don't know apriori.
If the effect is initially large up/down and then gets closer to the baseline, this is the novelty/primacy effect.

## Run Longer

## Use Only New Users (or equivalent type matching)

Can fix by running experiments on new users, or having the baseline be the behavior or new users when they were new, etc. In the latter case should maybe control for seasonality or other temporal effects as appropriate.

# Interference between variants

 Happens most often when control and treatment groups interact somehow. 
 If they interact like a 'standard' network effect (not competing for resources), we expect the actual effect to be larger than during the test. 
 **Example** FB posts promote more posts, so if small increase in population, will get larger.
[[science.math.Game Theory.Agent Based Models]]
![[science.math.Game Theory.Agent Based Models#^fbepidemology]]

 If 2-sided market, control and treatment groups compete for same resource. If we give better 'weapon' for treatment, after launch it would disappear, as everyone has better "weapon".
**Example** Better matching algo for Uber drivers. (or in the extreme case, prioritize some drivers over others- obviously the treatment group is more priviliged).

## Isolation of effect

Test between "connected components", e.g. New York vs LA (approximately, of course). Also can do temporally etc.
Simplest is geographical splits.

In social network:
test on differennt 'clusters' of people.

**Ego-network randomization**. A more scalable variation of the above.

# AB testing for [[science.stats.Regression.Ranking]]

[[engineering.system_design.ML System Design.Recommender Systems]]

Please also see [[science.stats.Regression.Loss Functions#^ranking-start]].

Comparing two rankings via clicks.
Say 2 algorithms give 2 rankings, Ranking A, ranking B.
Merge-sort-remove-duplicates interleaving the rankings.
Assign first element randomly.
Count clicks from A and B. Better one will on average get more rankings.

