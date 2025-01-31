---
id: 5573wmlbn7mhxjg67mipl2v
title: Hierarchical Modelling
desc: ""
updated: 2024-12-15T22:35
created: 1641835799979
---
[[science.CS.theory.Code Transformations.Differentiable Programming.tensorflow]]
[[science.CS.theory.Code Transformations.Differentiable Programming.pytorch]]

[Statistical View on Deep Neural Networks](http://blog.shakirm.com/wp-content/uploads/2015/07/SVDL.pdf)

# Recurrent Neural Networks

## The exploding/vanishing gradient problem

[[science.math.theory.Dynamical Systems]]
[[science.math.mode]]
[[science.stats.Autoregressive Models]]

# Symetries ^symmetries

# Restricted Boltzmann Machines

Some of the best single-model performers in [[Philosophy and Rationality.Incentives for Research and Engineering Advances^#netflix-prize]].

#TODO add pages for the architectures and notes here

# Feed Forward Neural Networks ^feed-forward-nets

# Deep-and-wide networks

Deep Hierarchical model for numeric features, sparse and 'skipping layers' for categorical features and their products...

![](/assets/images/2022-01-17-22-18-25.png)

Lately being used in [[science.stats.Regression.Recommender Systems]]. There are claims they perform well...

In R formula language parlance it's a bit like this:

$x~Bernoulli_logit(f(numeric_features)+categorical_features^2)$
where f is deep [[^feed-forward-nets]] 
or so. The categorical features^2 part could be specied further, of course, and the 
Bernoulli_logit sigmoid layer could be skipped.

You have to specify what feature interactions to directly include.

# Convolutional Neural Networks ^cnn

[[^symetries]]

## AlexNet ^alexnet

# Recurrent Neural Networks

- RNNs
- Machine Translation, text generation
- LSTM,GRU

# Embeddings

 [[science.stats.Deep Neural Networks.Language Models#^word2vec]]
 ![[science.stats.Deep Neural Networks.Prod2Vec#^prod2vec]]

# Deep Learning as Feature Extraction

# Recommendation Systems (DL)

## Deep Content-based Models

### Spotify Example

- [[science.stats.Deep Neural Networks#^cnn]] with audio spectrogram as input data.
- [[science.stats.Deep Neural Networks.Max Pooling]] and global pooling
- 'Bottleneck' layer [[science.stats.Deep Neural Networks.Auto-encoders]]
- [[science.math.Optimization.Optimizers In in Neural Networks.ReLU]]
- Output is the factor vector for the track from a **trained Collaborative Filtering model**. It's a model stack...[[science.stats.Stacking Models]]

# Deep Factorization Machines

[[science.stats.Regression.Support Vector Machines]]
[[science.stats.Regression.Support Vector Machines.Factorization Machines]]
#TODO - skip for now

# Content2Vec ^content2vec

Combine modular sets of feature extractors into 1 item embedding. E.g.
[[science.stats.Deep Neural Networks#^alexnet]],[[science.stats.Deep Neural Networks.Language Models#^word2vec]], [[science.stats.Deep Neural Networks.Prod2Vec]], etc. 

# Frameworks/Libraries

 [[science.CS.theory.Code Transformations.Differentiable and Probabalistic Programming]]
 [[science.CS.theory.Code Transformations.Differentiable Programming.tensorflow]]
 [[science.CS.theory.Code Transformations.Differentiable Programming.pytorch]]
 [[science.CS.theory.Code Transformations.Differentiable Programming.jax]]
 [[science.cs.languages.CUDA]]

