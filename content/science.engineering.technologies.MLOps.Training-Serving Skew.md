---
id: 2hwm40ik1vmyxi5nng44w71
title: Training-Serving Skew
desc: ""
updated: 2024-12-15T22:35
created: 1644774378034
---

Training-Serving Skew is a problem, which might happen in Data science projects. A mixture of organizational and computational/latency-driven problems may cause it.

During both Model Development and Serving, we need to do [[science.stats.Feature Engineering]]. But during model development, we have no computational limitations on what features to use, what data to connect to, etc.

Sometimes can do the Feature Engineering in such a way that's unviable for production serving. For example, we might need the full data in order to compute rolling features, we might need to connect to [[engineering.technologies.ML.Spark]] or a bunch of databases, etc.

In this situation, we should re-implement the code that computes the features. Then we have 2 versions of this code, potentially using different 
data stores. This may lead to training-serving skew, i.e. serving predictions we are surprised to serve.

There are ways to solve it on a case-by-case basis. It is one of the problems [[science.engineering.technologies.MLOps.Feature Stores]] aim to solve in an automated way.


[One reference](https://ploomber.io/blog/train-serve-skew/)

