---
id: txfiztxrkpzqwjf461isesm
title: Accuracy, prediction, recall, ...
desc: ""
updated: 2024-12-15T22:35
created: 1641861967307
---
#FalsePositiveRate
#AUC
#ROC
#accuracy
#precision
#recall
#FPR
#TPR

[Note From Google](https://developers.google.com/machine-learning/crash-course/classification/precision-and-recall)
true\\predicted | PositivePred | NegativePredicted
\---------\|----------\|---------
 PositiveTrue | TP | FN
 NegativeTrue | FP | TN

 $Accuracy = (TP+FP)/(FN+TN+TP+FP)$ Is simply the proportion of correct predictions.

 $Precision = TP/ (TP + FP)$ Is the proportion of correct positive predictions out of all positive **cases**.

 $TPR=Recall = (TP)/(TP+FN)$ Is the propotion of correct positive predictions out of all positive **cases**.
 TPR- true positive rate.

$FPR= FP/(FP+TN)$ Is the proportion of false positive out of all  negative **predictions**.
ROC - Receiver Operating Characteristic curve plots TPR against FPR for different thresholds.

At 0:
all predictions are negative, TP = FP = 0, hence TPR=0,FPR = 0.

At 1: all predictions are positive, TN = FN  = 0, hence TPR =1, FPR = 1.
![](/assets/images/2022-01-11-01-56-55.png)

# Likelihood/log-likelihood

## Cross-Entropy

### Binary

### Multiclass/Categorical

### Multilabel

### Normalized Entropy

Makes it possible to compare the performance of different algorithms across tasks/classes.

I guess it is the normal entropy, but normalized by the maximum possible entropy for the given dataset, makin'g it possible to compare algorithm performances across datasets...


Normalized entropy
Normalized entropy just normalizes the cross entropy and log loss constructs. It normalizes the log loss with a baseline: the log loss of a constant predictor (model) that always outputs the probability of a class to be the average rate of that class appearing in the corresponding data set. e.g. if the ratio of examples of clicks in a data set is 0.6, then the constant predictor predicts 0.6 for a click, and 0.4 for not-a-click.

Normalized entropy is the  
```
NE(D,M)= (L(D,M))/L(D,M_{const})
```
where L(D,M) is the log loss of model M on dataset D, and L(D,M_{const}) is the log loss of the constant model on dataset D (predicting the average).


The log loss of the constant model is one measure of how difficult the dataset is. A constant model scores high if the dataset is dominated by one single class and low otherwise. 

Normalized entropy allows us to refer to the loss from a similar range regardless of the dataset used, e.g. 0.75, 0.83. In practice, we always report relative N.E. difference, e.g. 0.2% N.E. reduction, which would give the same result if we hadn't done the normalization (because the normalization baseline is the same if the data set is fixed).

(See also [1] https://www.nist.gov/system/files/documents/2017/11/30/nce.pdf. )



# Multivariate


