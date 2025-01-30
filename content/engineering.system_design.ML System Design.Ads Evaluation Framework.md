---
id: d5wpnm87r8d44vss9aevg4x
title: offline vs online ads testing
desc: ""
updated: 2024-12-15T22:35
created: 1642536498536
---
Design evaluation framework for ads ranking

Source ads: given query; queries are grouped for scalability.

- Sourcing ads is like 'search' a list of ads.
- Then you have several steps of rankings.
- They all go trough same code. 
- $E[CTR]$ , other metrics -> bidding  formula.
- Positioning on page hapens in the end.

Cause you have many steps and need to return ad very fast, every step needs to be fast.

Revenue
OPS - what they make from the sale using the ad.

RoAS = OPS/Revenue

* * *

LTV - lifetime value

Use short-term surrogates. Number of top purchases is correlated with LTV (Accuracy@1).

3 stakeholders:
Advertiser
Ad provider
Shopper.

For each model you have treatment, do statistical testing on the business metrics.

When you're online you know the metrics.

**You need offline metrics (counterfactuals) that it correlates a lot with the online evaluation.
**

Online - AB testing, etc.

Offline - counterfactuals with proxies.

Need very high value of the 'offline evaluation data'.

Humans can create this 'ground truth' data.

Example of automatically create ground truth data is 'clicked and purchased' data..

**Is the offline ground truth data representative of the online use case
**

Rank models against each other- offline proxies.

Offline data is not representative of the online use case.

 Offline proxi metric should 'correlate' with online 'proper counterfactuals', which are impossible to estimate. 

 The correlation should be in the sense of 'ranks between models are monotonous'.

## AB Testing Comment when switching models

  When switching models, leave the baselines as some pct to be able to compare stuff later.

 e.g. tiny percentage of population w/o spam filter.

# Questions

## 

## Reading list/Topics to read

- EducativeIO Grokking ML list
- Attribtuion Modelling for Google and Facebook Ads
- <https://www.amazon.com/Attribution-Modelling-Google-Ads-Facebook/dp/1792911394>

  ## Classification/ranking based approaches

  ## Optimization/Game Theory/ Bidding

  ## Technologies

  He has background in graphs, e-commerce, multi-agent distributed planning, trust,
  etc

## Technology Stack

## What are you looking for in terms of skill set?

 How is the team matching done?

# Onboarding

# Team Integration

# Pct of People Working Off-Site

  How many ppl work 

Commerce Area.

## 

