---
id: ov0eqov021a6ru9ip78f982
title: Hyndman Book
desc: ""
updated: 2024-12-15T22:35
created: 1644773126915
---
# Data Skeptic Season

## Matrix Profiles

[Stumpy](https://pypi.org/project/stumpy/)

(Site)[https://pypi.org/project/stumpy/]

[[science.stats.Time Series.Matrix Profile]]
Computes:

- patterns/motifs
- GPU- scaleable
- approximate computation
- on-line(incremental) updates
- finding discord/anomalies
- snippets for summarizing time series
- Time Series EDA

# General References And Articles

\*[Hyndman's online textbook](https://otexts.com/fpp3/)

# Single Time Series Models

### [ETS](https://www.rdocumentation.org/packages/forecast/versions/8.16/topics/ets)

### [AutoArima](https://www.rdocumentation.org/packages/forecast/versions/8.16/topics/auto.arima)

### Multiple Seasonalities

- [TBATS](https://www.rdocumentation.org/packages/forecast/versions/8.16/topics/tbats)
- [MSTL](https://www.rdocumentation.org/packages/forecast/versions/8.16/topics/mstl)

# Kaggle/ State of The Art Stuff

Some comments from the forum for the Favorita case:

## 1th place solution: model Overview

I build 3 models: a lightGBM, a CNN+DNN and a seq2seq RNN model. Final model was a weighted average of these models (where each model is stabilized by training multiple times with different random seeds then take the average), with special dealing with promotion, which I will discuss later. Each model separately can stay in top 1% in the private leaderboard.

LGBM: It is an upgraded version of the public kernels. More features, data and periods were fed to the model.

CNN+DNN: This is a traditional NN model, where the CNN part is a dilated causal convolution inspired by WaveNet, and the DNN part is 2 FC layers connected to raw sales sequences. Then the inputs are concatenated together with categorical embeddings and future promotions, and directly output to 16 future days of predictions.

RNN: This is a seq2seq model with a similar architecture of @Arthur Suilin's solution for the web traffic prediction. Encoder and decoder are both GRUs. The hidden states of the encoder are passed to the decoder through an FC layer connector. This is useful to improve the accuracy significantly.

[Favorita EDA](https://www.kaggle.com/headsortails/shopping-for-insights-favorita-eda)
[Favorita Restaurant](https://www.kaggle.com/headsortails/be-my-guest-recruit-restaurant-eda/notebook)

# [Operators on Inhomogenous Time Series](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=208278)

Interesting bunch of operators. 
It's good to get a good mathematical foothold of them...

