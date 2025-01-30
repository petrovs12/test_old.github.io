---
id: 5547lsxfks8wis33z5k1v4q
title: TimeSeriesData  obbject
desc: ""
updated: 2024-12-15T22:35
created: 1657742582796
---
like ts in R, or mts in R.
just a pandas dataframe with some additional stuff. 

Can convert from and to a pandas DF

# Forecasting with KATS

10 Basic forecasting models

1. Linear
2. Quadratic
3. ARIMA
4. SARIMA
5. Holt-Winters
6. Prophet
7. AR-Net
8. LSTM
9. Theta
10. VAR

  \-- Not obvious how to do 
  k-step ahead out of sample predictions with KATS.

# <https://facebookresearch.github.io/Kats/api/_modules/kats/models/lstm.html#LSTMModel.predict>

However, BackTester is a way to do this...

# (KATS Backtesters)[https://facebookresearch.github.io/Kats/api/kats.utils.backtesters.html]

The **frequency** parameter is usually in the 'fit' function.

Probably kwargs in the Backtest model are passed to the 'fit' model, or maybe the 'predict' function.

Actually kwargs is just passed to the parent class constructor.

 I think it's pased to both, maybe...

# Inferring frequency

 Kats uses [pandas infer freq function](<>)
 <https://pandas.pydata.org/docs/reference/api/pandas.infer_freq.html>

# NB : Use Cross Validation

rolling vs expanding window, etc...

# KATS - out of sample step-ahead forecasting

<https://facebookresearch.github.io/Kats/api/kats.models.arima.html>

Here inthe arima, there are **start_params**, and iteration limit...

# KATS Prophet

In the ProphetParams, there is somethign about holidays...

There is a [PR request](httpshttps://github.com/facebookresearch/Kats/pull/129) for this..

From [here](https://bytemeta.vip/repo/facebookresearch/Kats/issues/167)

```{python}
from kats.models.prophet import ProphetModel, ProphetParams

air_passengers_ts = TimeSeriesData(air_passengers_df) reg = np.random.randn(len(air_passengers_ts))

pparams = ProphetParams(extra_regressors = [{'value': reg, 'name':'reg1'}])

pmodel = ProphetModel(data=air_passengers_ts, params=pparams)

pmodel.fit()

pmodel.predict(steps=20, extra_regressors = [{'value': np.random.randn(20), 'name':'reg1'}])`
```

# Low-hanging fruit..

## General

0. Use log1p -> exp(x)-1  to avoid predictions bellow 0...
1. Featurization:
   Use Patrons forecast as a feature in a regression/auto-regressive model
   Moving averages over different time windows:
   Previous 3 working days, mean and median for last week month, quarter, same quarter last year, a same week last year (if available).
   1/ (#days after last holiday). #days since the start of the semester and until the end of the semester.

# of days since the start of last lockdown.

Using patrons forecast for that date (as a version of a model stacking).

 \-- Observation weights not included in Prophet At the moment

- Use Arima as Baseline model

# Solving the 'bad observational periods' issue

1. for each time series, fit [Gaussian Mixture model](https://scikit-learn.org/stable/modules/mixture.html) to check for 'abnormal periods'. Alternatively, they may be defined manually.
2. For each time series, mark the 'abnormal' periods that have mean &lt;=1/3 of the mean of the cluster of largest values, as missing/NaN.
3. Inpute the NaN's with <https://pypi.org/project/autoimpute/>, spline feature.

## Event and Holiday Modeling

Add events. For the prophet model, can do it directly in the prophet constructor.

## External regressors w/ LSTM

Add external regressors as an extension of the input vectors...
Should be easy to also add the the out of sample several-steps ahead things.

## Split and aggregate

Notes from 
[Best DL Learning MNodels for TS](https://towardsdatascience.com/the-best-deep-learning-models-for-time-series-forecasting-690767bc63f0)

there is an implementation of N-Beats in darts

<https://github.com/QData/spacetimeformer>

