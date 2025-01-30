---
id: gt3g8vi7miytuy1hmtnmkrb
title: AdaBoost
desc: ""
updated: 2024-12-15T22:35
created: 1643148261706
---

From [Wikipedia](https://en.wikipedia.org/wiki/AdaBoost#Statistical_understanding_of_boosting)


AdaBoost refers to a particular method of training a boosted classifier. 
A boost classifier is a classifier in the form

$F_{T}(x)=\sum _{t=1}^{T}f_{t}(x)$
where each $f_{t}$ is a weak learner that takes an object $x$ as input and returns a __value indicating the class__ (NOT probability!) of the object. In the two-class problem, the sign of the weak learner output identifies the predicted object class and the absolute value gives the confidence in that classification. 

 Similarly, the $T$th classifier is positive if the sample is in a positive class and negative otherwise.

Each weak learner produces an output hypothesis, $h(x_{i})$, for each sample in the training set.

 At each iteration, a new weak learner is selected AND assigned a coefficient $\alpha_t$

  Similarly, at each iteration, every sample is also assigned a weight $w_{it}$, denoting the weight of the sample in the next iteration. This is set equal to the current error $L(y_i,F_{t-1}(x_i))$

The final classifier is the weighted sum of the weak classifiers, $F(x) = \sum_{t=1}^{T} \alpha_t h(x)$

## Standard Error function:

The standard error function is exponential loss:
$L(y_i,x_i) = e^(-y_*C(x_i))$ by abuse of notation,
so 
$L(y,x;w=1) = \Sigma_{i=1..n}e^{-y_i*C(x_i)}$

That would be with default weights.
Now, if we define $w_{it} = e^{-y_i*C_{t-1}(x_i)} $ we can see that the 'outliers' get higher cost next time...

## We also can fit $\alpha_t$ together with the new classifier... 




