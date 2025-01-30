---
created: 2025-01-12T23:42
updated: 2025-01-12T23:43
---



robyn_inputs {Robyn}	R Documentation
Input Data Check & Transformation
Description
robyn_inputs() is the function to input all model parameters and check input correctness for the initial model build. It includes the engineering process results that conducts trend, season, holiday & weekday decomposition using Facebook's time-series forecasting library prophet and fit a nonlinear model to spend and exposure metrics in case exposure metrics are used in paid_media_vars.

Usage
robyn_inputs(
  dt_input = NULL,
  dep_var = NULL,
  dep_var_type = NULL,
  date_var = "auto",
  paid_media_spends = NULL,
  paid_media_vars = NULL,
  paid_media_signs = NULL,
  organic_vars = NULL,
  organic_signs = NULL,
  context_vars = NULL,
  context_signs = NULL,
  factor_vars = NULL,
  dt_holidays = Robyn::dt_prophet_holidays,
  prophet_vars = NULL,
  prophet_signs = NULL,
  prophet_country = NULL,
  adstock = NULL,
  hyperparameters = NULL,
  window_start = NULL,
  window_end = NULL,
  calibration_input = NULL,
  json_file = NULL,
  InputCollect = NULL,
  ...
)

## S3 method for class 'robyn_inputs'
print(x, ...)
Arguments
dt_input	
data.frame. Raw input data. Load simulated dataset using data("dt_simulated_weekly")

dep_var	
Character. Name of dependent variable. Only one allowed

dep_var_type	
Character. Type of dependent variable as "revenue" or "conversion". Will be used to calculate ROI or CPI, respectively. Only one allowed and case sensitive.

date_var	
Character. Name of date variable. Daily, weekly and monthly data supported. date_var must have format "2020-01-01" (YYY-MM-DD). Default to automatic date detection.

paid_media_spends	
Character vector. Names of the paid media variables. The values on each of these variables must be numeric. Also, paid_media_spends must have same order and length as paid_media_vars respectively.

paid_media_vars	
Character vector. Names of the paid media variables' exposure level metrics (impressions, clicks, GRP etc) other than spend. The values on each of these variables must be numeric. These variables are not being used to train the model but to check relationship and recommend to split media channels into sub-channels (e.g. fb_retargeting, fb_prospecting, etc.) to gain more variance. paid_media_vars must have same order and length as paid_media_spends respectively and is not required.

paid_media_signs	
Character vector. Choose any of c("default", "positive", "negative"). Control the signs of coefficients for paid_media_vars. Must have same order and same length as paid_media_vars. By default, all values are set to 'positive'.

organic_vars	
Character vector. Typically newsletter sendings, push-notifications, social media posts etc. Compared to paid_media_vars organic_vars are often marketing activities without clear spends.

organic_signs	
Character vector. Choose any of "default", "positive", "negative". Control the signs of coefficients for organic_vars Must have same order and same length as organic_vars. By default, all values are set to "positive".

context_vars	
Character vector. Typically competitors, price & promotion, temperature, unemployment rate, etc.

context_signs	
Character vector. Choose any of c("default", "positive", "negative"). Control the signs of coefficients for context_vars. Must have same order and same length as context_vars. By default it's set to 'defualt'.

factor_vars	
Character vector. Specify which of the provided variables in organic_vars or context_vars should be forced as a factor.

dt_holidays	
data.frame. Raw input holiday data. Load standard Prophet holidays using data("dt_prophet_holidays")

prophet_vars	
Character vector. Include any of "trend", "season", "weekday", "monthly", "holiday" or NULL. Highly recommended to use all for daily data and "trend", "season", "holiday" for weekly and above cadence. Set to NULL to skip prophet's functionality.

prophet_signs	
Character vector. Choose any of "default", "positive", "negative". Control the signs of coefficients for prophet_vars. Must have same order and same length as prophet_vars. By default, all values are set to "default".

prophet_country	
Character. Only one country allowed. Includes national holidays for all countries, whose list can be found loading data("dt_prophet_holidays").

adstock	
Character. Choose any of "geometric", "weibull_cdf", "weibull_pdf". Weibull adstock is a two-parametric function and thus more flexible, but takes longer time than the traditional geometric one-parametric function. CDF, or cumulative density function of the Weibull function allows changing decay rate over time in both C and S shape, while the peak value will always stay at the first period, meaning no lagged effect. PDF, or the probability density function, enables peak value occurring after the first period when shape >=1, allowing lagged effect. Run plot_adstock() to see the difference visually. Time estimation: with geometric adstock, 2000 iterations * 5 trials on 8 cores, it takes less than 30 minutes. Both Weibull options take up to twice as much time.

hyperparameters	
List. Contains hyperparameter lower and upper bounds. Names of elements in list must be identical to output of hyper_names(). To fix hyperparameter values, provide only one value.

window_start, window_end	
Character. Set start and end dates of modelling period. Recommended to not start in the first date in dataset to gain adstock effect from previous periods. Also, columns to rows ratio in the input data to be >=10:1, or in other words at least 10 observations to 1 independent variable. This window will determine the date range of the data period within your dataset you will be using to specifically regress the effects of media, organic and context variables on your dependent variable. We recommend using a full dt_input dataset with a minimum of 1 year of history, as it will be used in full for the model calculation of trend, seasonality and holidays effects. Whereas the window period will determine how much of the full data set will be used for media, organic and context variables.

calibration_input	
data.frame. Optional. Provide experimental results to calibrate. Your input should include the following values for each experiment: channel, liftStartDate, liftEndDate, liftAbs, spend, confidence, metric. You can calibrate any spend or organic variable with a well designed experiment. You can also use experimental results from multiple channels; to do so, provide concatenated channel value, i.e. "channel_A+channel_B". Check "Guide for calibration source" section.

json_file	
Character. JSON file to import previously exported inputs or recreate a model. To generate this file, use robyn_write(). If you didn't export your data in the json file as "raw_data", dt_input must be provided; dt_holidays input is optional.

InputCollect	
Default to NULL. robyn_inputs's output when hyperparameters are not yet set.

...	
Additional parameters passed to prophet functions.

x	
robyn_inputs() output.

Value
List. Contains all input parameters and modified results using Robyn:::robyn_engineering(). This list is ready to be used on other functions like robyn_run() and print(). Class: robyn_inputs.

Guide for calibration source
We strongly recommend to use experimental and causal results that are considered ground truth to calibrate MMM. Usual experiment types are people-based (e.g. Facebook conversion lift) and geo-based (e.g. Facebook GeoLift).

Currently, Robyn only accepts point-estimate as calibration input. For example, if 10k$ spend is tested against a hold-out for channel A, then input the incremental return as point-estimate as the example below.

The point-estimate has to always match the spend in the variable. For example, if channel A usually has 100k$ weekly spend and the experimental HO is 70

Examples
Run examples

# Using dummy simulated data
InputCollect <- robyn_inputs(
  dt_input = Robyn::dt_simulated_weekly,
  dt_holidays = Robyn::dt_prophet_holidays,
  date_var = "DATE",
  dep_var = "revenue",
  dep_var_type = "revenue",
  prophet_vars = c("trend", "season", "holiday"),
  prophet_country = "DE",
  context_vars = c("competitor_sales_B", "events"),
  paid_media_spends = c("tv_S", "ooh_S", "print_S", "facebook_S", "search_S"),
  paid_media_vars = c("tv_S", "ooh_S", "print_S", "facebook_I", "search_clicks_P"),
  organic_vars = "newsletter",
  factor_vars = "events",
  window_start = "2016-11-23",
  window_end = "2018-08-22",
  adstock = "geometric",
  # To be defined separately
  hyperparameters = NULL,
  calibration_input = NULL
)
print(InputCollect)
[Package Robyn version 3.11.1 Index]