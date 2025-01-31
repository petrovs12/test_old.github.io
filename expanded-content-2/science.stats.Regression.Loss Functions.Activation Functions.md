---
id: qi3oc50iu7x86hce5boovnp
title: GLM's, Link Functions, and NN activation Layers
desc: ""
updated: 2024-12-15T22:35
created: 1646296752080
---
Following [Statistical View Of Deep Learning](http://www.cs.columbia.edu/~blei/seminar/2020-representation/readings/Mohamed2015a.pdf)

In a Linear Regression model, we have:

$\hat{y}(x) = \beta^T x +\alpha$
$y~ N(\hat{y},\sigma)$
Here $\sigma$ is unknown and also to be estimated.

Now, if the error distribution is different.

# Regression/Activation Function Summary

** Heuristically, when applicable, activation function and inverse link functions are the same**.** That is, when the Neural net roughly corresponds to a hierarchical GLM, the last layer may normally have the cannonical inverse link function.**

[[science.stats.Deep Neural Networks]], [[science.stats.Regression.GLM]], [[science.stats.Regression]].

| Regression Type | Target Range      | Link                              | Inv Link                        | Activation Function                        |
| --------------- | ----------------- | --------------------------------- | ------------------------------- | ------------------------------------------ |
| Real            | Linear Regression | Identity                          | Identity                        | Identity                                   |
| Logistic        | Binary            | $logit(\mu)=log\frac{\mu}{1-\mu}$ | $sigmoid(x)=\frac{1}{1+e^{-x}}$ | sigmoid                                    |
| Poisson         | Naturals+0        | $log(\mu)$                        | $exp(\mu)$                      | not commonly used (computational reasons?) |
| Sparse Ordered  | Tobit             | C2                                | $max(0;\nu)$                    | ReLU                                       |

# ReLU ^relu

