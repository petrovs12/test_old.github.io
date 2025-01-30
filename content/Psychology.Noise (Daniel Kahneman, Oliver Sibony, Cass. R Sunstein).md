---
id: 49le7meobdujbfi2q68tzfc
title: What's up with noisy Judgements
desc: ""
updated: 2024-12-15T22:35
created: 1658050673388
---
# Noise and Bias

# Psychological reasons for noise

## Groups amplifying noise

Things not being i.i.d, but error being autocorrlated (or correlated across the social graph via first-move advantage).

Imagine a [[science.engineering.technologies.graphs.Random Graphs#^baGraphs]] graph, and some features related to it.
E.g. how much a song is liked. Then as new members join, they form a judgement, and the current distribution of the
memmbers they attach to, affects this (maybe proportionally to the influence).
Then the noise is obviously not i.i.d.

Chapter 8 of Kahneman's book.

If a song benefited from **early success, it could do very well**. 

Level of success in the social influence condition was **more unpredictable than in the independent condition**.

**Popularity is self-reinforcing**, so it's **manipulatable**.

**Vote manupulation** by telling people what's already **popular**.

### Illusion of Agreement

If no noise audit, people in a company get checked while they are apprentices, but
when they get more experience, they start believing their own hype and 'expertise'.

At the same time there might not be agreement at all.

# Noise in various decisions

- Judges give different verdicts for the same case.
- Medical professionals too.
- Also, on different days

# Causes of Noise

# Singular decisions

In non-repeated experiments, people assume full determinism and then look for causality retrospectively.
That makes it so ppl don't think like they would if they did a repeated experiment.

One-of-a-kind decisions should be treated the same way as 'repeated' ones.

# Occasion noise

E.g. mood affects things a lot.

E.g. Software developers give 70% different time estimates for the same task on 2 consequent days.

Variability in performance things (for the same person) can be caused by variability in their current physical state.

## One is a Crowd

Can sample 'from within'.
I.e. as people 'tell a story' to interpret something and justify decision, make them think about different features of the same thing, and give a second opinion.

- Guesses from 2nd opinion add more value than asking yourself the same question 'naively'
- But if you ask yourself 'correctly' you can get about half the 'new information'.

**Dialectical Bootstrapping**
[[stats.Sampling.Bootstrapping]]

Especially for complex ( ~ high-dimensional) problems.

Vul/Pashler:
**Responses made by a subject are smapled from an internal probability distribution, rather than being generated 
by a deterministic process, taking into account all the knowledge a subject has.**

All of the bellow causes have evidence for affecing judgements.

- Mood
- Fatigue
- Weather 
- Sequencing

**We are not the same person at all times and we're less consistent than we think**.

## 

## Sources of OCcasion Noise

- Mood
  [[Psychology.First Impression Bias]] Good Mood amplifies this

# Your mind as a measurement instrument

# Predictive vs Analytical Judegements

## Judgements and models

## Noiseless rules

# Decomposing Noise

## Bias-variance, and others

# Why not reduce Noise to 0

- People feeling like cogs
- Some non-determinism makes people feel like they're not failures (e.g. like luck in games)

## Rules vs standards

Keep values and facts separate...

# Legal System Noise

## Level Error

Mixed effect models- each judge has a different "constant" to draw from...

## Pattern Noise

Each type of case has a different 'constant' to draw from.
I.e. variance comes from both the item, and the user:
Maybe smiliar to

[Item Response theory models...](https://mc-stan.org/docs/stan-users-guide/item-response-models.html)

The noise here is in the coefficients

[[science.stats.Mixed Effect Models]]
[[science.stats.Bayesian Framework]]

$\text{System Noise}^2=\text{Pattern Noise}^2+\text{Level Noise}^2$

To summarize:

- **Level Noise** is variability in average judgement of judges.
- **Pattern Noise** is variability for a particular case across Judges.

# KNN and Noise

Imagine you are a judge and have to judge a case.
Then you might use a KNN type approach, drawing on your experience + knowledge.

But now, it's a high dimensional thing.
In KNN sparse regions are noisy.

But if you:

1. Sample experience across judges (cases/rows)
2. Sample values across judges (case features/columns)

and then use KNN, you can get a lot of 'pattern' noise (as per the classification above).

# How noise happens

## Matching 'Story' to Number s( Part IV)

Lots of noise there.

## Heuristics, Bias, Noise

Another type of 'group' contagion.
Historical reasons, different [[science.math.Optimization.Objective Functions]] maybe?

## 

