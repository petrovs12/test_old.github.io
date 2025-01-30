---
id: q3o99q7h3dy1qotyfytvsn3
title: Likelyhoods and GLM
desc: ""
updated: 2024-12-15T22:35
created: 1642432837032
---
Loss functions can often be expressed as a function of $yf(x)$. That is because we often want to penalized misclassification or 

# Classification

![[science.stats.Regression.Classification.Metrics]]

# Ranking ^ranking-start

## Types ^ranking-metrics

- **Point-wise models**: which try to predict a (matching) score for each query-document pair in the dataset, and use it for ranking the items.
- **Pair-wise models**: which try to learn a **binary classifier** that can tell which document is more relevant to a query, given pair of documents.
- **List-wise models**: which try to directly optimize the value of one of the above evaluation measures, averaged over all queries in the training data.

[Some Medium Article](https://towardsdatascience.com/20-popular-machine-learning-metrics-part-2-ranking-statistical-metrics-22c3e5a937b6) ^ranking-metrics

#TODO- learn some of these

- Mean Reciprocal Rank (MRR)

  ```
  For each user and each relevant item, compute 
  the mean precision of the list __trough__ that item

  ```

## Ranking- Binary Relevance

### Mean Average Precision ^ranking-map

 Define 'precision trough k' to mean 'how many items until the $k-th$ are relevant. The average of these is the Average Precision. The mean of that is the loss of the ranker.

0. **MAXIMIZE**
1. For each query, compute $AP(q)$ (average precision). To compute average precision, compute first $P_1(q) = I(1_{\text{user clicked on 1st result}})$

   $P_k(q) =\sum_{i=1..k} I(1_{\text{user clicked on i-th result}})$

   $AP_k(q) =\frac{\sum_{i=1..k} P_k(q)}{k}$
2. The MAP is the mean of these for a given ranking algorithm.

### Mean Reciprocal Rank ^ranking-mar

The 'performance' is $1/i$, where the highest option we click on is the $i$-th one. Then the avg of that is MRR

0. **MAXIMIZE**
1. Say we produce $k$ options for a query, and the **highest option** ($HO(q)$) the  user interacts with is the $i$-th option. If they don't interact, assume $HO(q)=k+1$
2. $MRR_recommender =\frac{\sum_{i=1..Q}\frac{1}{HO(q)}}{Q}$

## Ranking- Beyond Binary Relevance

 Assume we know the relevances of the documents. Note- this can be used to differentiate signals in ads between look, click, put in basket, purchase, etc.
 So for each document there is a 'relevance ground truth' $rel_d$.
 Now, let a query $q$ return the order $\pi_1,\pi_2,...,\pi_k$

### Discounted Cumulative Gain ^DCG

We discount things, lower on the list.
$DCG_p = rel_{\pi_1}+sum_{i=2..k}(rel_{\pi_i}/(1+log(i)))$
Can also use:

$DCG_{[\pi(1),\pi(2),...]} = rel_{\pi_1}+sum_{i=2..k}(2^{rel_{\pi_i}}/(1+log(i)))$

which puts very high emphasis on highly relevant documents.

## Normalized Discounted Cumulative Gain ^ranking-NDCG

normalize DCG by the ideal DCG.

$ DCG\_{best}(el_1,el_2,...) = DCG(sortDecsending([el_1,el_2,...])) $

$ NDCG([e_1,e_2,...])= DCG([e_1,e_2,...])/DCG(sortDesc([e_1,e_2,...])) $

## Precision at K ("p@K").

 Precision @ 1: if first item is relevant, $P_1=1$, else 0.

## What if no relevant results

If user does more queries, then can find the reciprocal rank, MRR is the mean RR across multiple queries.

^ranking-end

# Huber Loss Functions

L\_{\\delta }(a)={\\begin{cases}{\\frac  {1}{2}}{a^{2}}&{\\text{for }}|a|\\leq \\delta ,\\\\delta (|a|-{\\frac  {1}{2}}\\delta ),&{\\text{otherwise.}}\\end{cases}}
This function is quadratic for small values of a, and linear for large values, with equal values and slopes of the different sections at the two points where {\\displaystyle |a|=\\delta }|a|=\\delta . The variable a often refers to the residuals, that is to the difference between the observed and predicted values {\\displaystyle a=y-f(x)}a=y-f(x), so the former can be expanded to[2]

{\\displaystyle L_{\\delta }(y,f(x))={\\begin{cases}{\\frac {1}{2}}(y-f(x))^{2}&{\\textrm {for}}|y-f(x)|\\leq \\delta ,\\\\delta \\,(|y-f(x)|-{\\frac {1}{2}}\\delta ),&{\\textrm {otherwise.}}\\end{cases}}}{\\displaystyle L_{\\delta }(y,f(x))={\\begin{cases}{\\frac {1}{2}}(y-f(x))^{2}&{\\textrm {for}}|y-f(x)|\\leq \\delta ,\\\\delta \\,(|y-f(x)|-{\\frac {1}{2}}\\delta ),&{\\textrm {otherwise.}}\\end{cases}}}

