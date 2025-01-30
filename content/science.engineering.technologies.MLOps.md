---
id: 75gu8z9zdj1gxlyzy4c4s6g
title: MLOps
desc: ""
updated: 2024-12-15T22:35
created: 1642030099420
---
[MLOps tool list (probably biased)](https://juliapackages.com/p/mlops) 

 As part of the model serving infrastructure in a given system, we could have a [[engineering.system_design.load balancer]], or more generally, a dispatcher, which, for each incoming request, determines which model to serve.

 The disparcher then returns the modelid, and we keep track which model id/configuration is served for each request. 

 Then after the data is in DWH, we can use [[science.stats.tests#^ANOVA]], [[science.stats.AB Testing]], [[science.stats.tests#^t-test]]

 We can also use [[science.math.Optimization.Optimal Control.Reinforcement Learning#^bandits]] in the dispatcher in order figure out what to send.

# summary

- Scaling machines up and down
- increasing/ decreasing batch size, increasing latency in exchagne of efficiency etc.

# 

