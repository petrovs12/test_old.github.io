---
id: b23tv9332b4vujl9mtfzwup
title: Contrastive Learning
desc: ""
updated: 2024-12-07T17:44
created: 1732799248289
---


It's fair to say, because this was my impression before, that contrastive learning is more about the choice of what to consider a negative example in the unlabeled setting or in the setting of unseen data. So, for example, remember in our recommendation learning setting we have some pairs of observations between our user and item, but not others, and then we assume that the unseen items, we cannot necessarily assume that all of them are negative, but we can choose some strategy to select some of them which should be negative and then add this to the objective function, so as to ensure that the classes are being separated and we don't accidentally put the embeddings of two different classes or types of observations on top of each other, closing the embedding space. Because other than that, it just seems like a way to get negative examples when we don't have explicit negative examples, we just have missing stuff.

# determining negative examples
The summary here is as follows: when we have a domain where we have some positive examples but the negative examples are not easily observed or they could also just be missing data, we need to find a way to build out some negative examples. If we do not do this in the embedding space, we could generate a bunch of false positives. For example, if we're classifying movies and just use the observed matrix of movies that a user has watched, we could accidentally put movies in different languages on top of each other in the embedding space because we don't care about the differences between them. 

To generate negative examples, we can use domain knowledge or randomly select items that are not likely to be together. If there is domain-specific knowledge, such as movies in different languages should not be on top of each other, we can use that. Otherwise, it depends on the application. The specific objective function becomes a multinomial cross-entropy objective function over the data points, which are dot products in the embedding space between the inputs. We have the positive examples already present in the data, and we can generate more positives by applying transformations to the input, such as rotating or adding noise to images.

# Data augmentation for more positive examples
![[science.stats.Deep Neural Networks.Data Augmentation Mechanisms]]


# contrastive loss
information noise contrastive estimations.


$\mathcal{L} = -\log \frac{\exp(\text{sim}(\mathbf{z}_i, \mathbf{z}j) / \tau)}{\sum{k=1}^{N} \exp(\text{sim}(\mathbf{z}_i, \mathbf{z}_k) / \tau)}$

Yeah, basically what this does is create a data set, which has each pair as an input and then then just like take the product of them buildings and this is the probability that they match and compares this against whether we think it's positive for example in the usual loss function we have for logistic regression. 


[[science.stats.Regression.Classification.Multiple Labels]]
