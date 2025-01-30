---
id: zk082knnzo6b41r8n7u6l71
title: ML Interview Newsfeed
desc: ""
updated: 1733576043220
created: 1733575939227
---


Data Scientist ML Interview - Newsfeed (Sp)


This will be a ML Analysis Interview - Not looking for all the right answers but generally your process. I want you to make reasonable assumptions and explain them. In general I want you to commit to your answers.
ML Leadership: To start lets get some background! - What is a project you feel most proud of? (what was the problem? what was at stake? who were the folks involved? what was your role? was there friction in that project and how did you overcome it? )
tell me about **some modeling work** that you have done
why was it important
what was your contribution
Describe basics of newsfeed to candidate - show pic!

thousands of eligible stories, need to choose say 10 of them and display in order of relevance
used to be a fixed formula - (time)

most recent but maybe you have lots of friends and so best is not 
how can we improve our ranking? .... 
Without really getting into metrics / objectives - Qualitatively - what determines as a good story selection? 
define objective function for users (eg, engagement, time spent)
can you think of any tradeoffs?
higher engagement with fewer stories vs lower engagement across more of selected stories
time spent on / offsite
individual post / story engagement vs global
What loss function would you use?
For the sake of argument say we want to model with P(click) and rank ads by P(click) - Now that we have a metric? What model will you use? describe high level
what is your training data? what are the inputs and outputs?
Candidate should reason through different kinds of features:
User 
Session
Ad
Engagement
Content
User-Ad
Context / Placement
Global Popularity/Current Events
how would you evaluate it? 
Offline - historical data (training, test, validation, verification sets)
Online - A/B test live data
Define objective function for model evaluation (log loss, ROC AUC, Precision & Recall, Accuracy, F1 Score, RMSE, Normalized Entropy)
can you describe the tradeoff between ROC AUC & LogLoss
Given the model you picked - What are some ways to potentially boost the online performance of a model? <TC should give strong intuition for why>
Regularization
Feature selection
Clean label data
Feature engineering 
what features would you want to build for your model?
how will you use them in your model?
normalize them? (eg z-scaling, logarithmic input features with a linear response )
Categorical vs scalar?
[Especially if candidate selects collaborative filtering] What about for new users? cold start?
Most popular stories in their network
KNN
What can go wrong? Assume the candidate model does not perform as well in production as on training data <overfit>
training data corrupted or not representative of live data
Unbalanced training data
positional discount
temporal effects (eg Superbowl in training data)
Interface or feature changes requiring re-training
training data goes stale, discuss when to retrain
user fatigue and novelty effects
mix shift in demographics
data inconsistencies between training and evaluation pipelines
Overfit to clicky users
Issues with the model - lets say the data is good
 overfitting  -what is it?
how to detect?
regularization (penalizing learned weights from training examples with extreme deviations but good fit)
Issues with the system
Model performance runtime/slow UI
Low diversity / lack of good variety
Clicks to offsite reads






Key Parts of the Interview - Can this person lead analysis on a team of ML engineers
Clear ML approach that is appropriate for the problem
Able to describe the pros and cons of specific methods (e.g. collaborative filtering v.s. classification, Trees v.s. Linear)
Able to get concrete in how they would implement a feature in their model / how a model would interpret a feature (e.g. time)
For Trees - how would you handle a feature (like time) where data that comes in is outside the distribution
For Linear - what are the various ways you would encode the raw timestamp
t0-post time; exponential decay or logrithmic 1-hot encoding
C(time of day)
time since last login
For collaborative filtering - how would you deal with cold start?
Able to discuss training setup
Chronological training data is important
How to tune hyperparameters
detect overfit in the training data
[not a focus] Lip-service to online test setup
Able to diagnose production issues with ML models




