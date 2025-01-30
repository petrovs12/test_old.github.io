---
id: de5lxkarixuwn8hxydq2y2d
title: Places Nearby
desc: ""
updated: 2024-12-07T17:08
created: 1733582868746
---


# Description
Design a Machine Learning system to recommend nearby places you'be interested (mobile).

Question Statement
Design an ML backend for a mobile app that can recommend nearby places you might be interested visiting
The app shows you a list of recommended places nearby, and you can pick from several categories(6) .



You have a POI database of 100M places with rich information about them. Can use any information from device or user profile

You have 1 month of fully logged session data, where the app was running with a naive version.

The system needs to handle 1B queries per day.

Can log/store anythins


=== Possible dimensions to cover during the interview (experienced user should come up with them on their own) :==

What would you optimize for?
How would you measure the quality of your system?
What data would you log?
What specific place information would you need, besides name and address?
What ML features can be good for your system model?
What ML model(s) will you use? Can you compare between them?
How would you train the system?
How would you handle new users (cold start)?
How would you detect a data over-fitting problem?
How would you test/launch a new model?
How would you represent the places database?
How would you improve the speed of the system?
How would you make the system personalized?



# Problem formulation setup

I expect the candidate to ask at least a few clarification questions:
At the very least, there should be some talk of metrics we care about – i.e., clarifying what we mean by using ML to improve the experience. 
IC5+
Good candidates come up with some metrics that we can try to optimize for - e.g., most mention some form of CTR, engagement improvement.
Some candidates come up with directly optimizing place visits – this is fine, as long as this isn’t the only metric they care about. They should be able to briefly talk about challenges w.r.t. tracking such a metric.
IC6+ 
IC6+ should proactively call out what downstream metrics should we be aiming to influence, and if there are tradeoffs to watch out for. They should also be able to talk about why tracking only clicks might sub-optimal for the overall ecosystem point of view.
Red flags:
Jumping into some stage of implementation discussion without framing the ML problem as part – e.g., straightaway talking about what features would be useful here. 
Setting up as some form of using an off-the-shelf solution - e.g., people might have read about a single paper like deep and wide networks for recommendations and just attempt to force fit to this directly, instead of building up logically.


ML System Design formulation
I expect candidates to propose some form of multi-stage ranking: candidate generation + ranking
In general, the expectation is for the candidate to frame this as a supervised learning problem. In some cases, candidates see recommendation, and propose collaborative filtering. 
I try to nudge them away from this direction - usually by asking “do you see any problems with this if we rely on collaborative filtering?”
If the candidate is not able to quickly/proactively propose an alternative formulation, this is often a red flag.
IC4+:
New grads, or people with some experience will often either (1) come up with a single ML task (often click prediction), or (2) connect this with a problem they have previously worked on. Both provide good signal
IC5+:
They should be asking about some infra constraints: e.g., how many users,places are we serving; what kind of logging do we already have.
Able to identify trade-offs with ML tasks while also defining a more complete ML system
IC6+
More proactive discussion about multi-stage setup. Typically good candidates here are able to identify what purposes different stages of multi-stage ranking serve in the wider scheme of the solution: e.g., some candidates identify that there are other business objectives (e.g., diversity, freshness) that can be served via a final, more hand-tunable stage.
Often can talk about and compare some different approaches used in the industry, compare them and propose an appropriate one. 



# Training Data

In general  candidates should be able to clearly identify what constitutes training data for their proposed solution.
IC4+:
Usually if they’re discussing a single task, they should be able to define positive and negative labels for the supervision signal, and they should be able to talk about how the training data would be collected (most candidates are quick to connect the fact that this app has been live for a few months to an assumption that we have logged impression, click data)
IC5+:
Able to identify trade-offs or ways to combine ML tasks (e.g., click, rating, some other downstream action)
Will be able to identify and talk about mitigations for one of the following: feedback loops in using logged data, position bias and so on. 
IC6+
Will proactively think about cold-start problems
Will tie back the choice of supervision signal to the business objective that we’re trying to drive.
Will proactively identify feedback loops, and compare a few approaches to mitigate.

Red flags:
Not demonstrating clarity when talking about what constitutes training data for their solution. If I see a candidate trending towards this, I often explicitly ask “What would a row of training data look like?”

# feature engineering

In general candidates should be well-organized in their approach to discussing features. This provides an opportunity to not only demonstrate breadth/depth of understanding but also the ‘applied’ aspect of ML even at an IC4 level cleanly.
IC4+:
Industry practitioners at this level should demonstrate strong performance in this axis. 
At the very least, candidate should be able to talk about user-only, place-only, and user-place-interaction features. 
In some cases candidates identify a third entity - context. This is generally a strong positive signal and shows organization in thought.
IC5+:
Covers a good breadth of relevant features: counters, user demographics, user metadata, user-place history, time of day, day of the week etc.
Is able to dive deep into a few feature encodings - and not be limited to more hand-wavy talk about embeddings, user-place history in particular.
One common question I ask is how would they encode a popularity feature? (expectation is to talk about time windows, normalization etc.)
IC6+
Able to talk about at least some aspects of sparse features to use 
Proactively call out some aspects of learning embeddings - give a quick overview of a couple of approaches, and touch upon re-training/refreshing trade-offs.
In some cases, candidates will assume that since this is a Meta interview - there is some aspect of social signals available too. I usually don’t find these to add more signal. In cases where time is short, I generally nudge the candidate away from this direction.

Red flags:
Talking about using embeddings as features but not having satisfactory answers to some ways to generate embeddings.

# Modeling

Candidates should generally be able to propose a few ways to model: list out some baseline that they’ll try and what would they try next. In general this should often be portrayed as an experimental process.
IC4+:
Able to dive deep into at least one model of their choice - e.g., if they choose Boosted decision trees, they should not treat it as a blackbox “I will use xgboost”. They should be able to give background on boosted decision trees vs decision trees, some hyperparameters that can be optimized etc.
Can discuss relevant practical aspects around the model choice – e.g., regularization (and how it manifests in their model of choice)
IC5+:
Will be able to justify their choices, tying back the justification to things outside the model learning algorithm - e.g., latency requirements.
Able to talk about practical aspects 
For candidates with relevant industry experience working on ranking/recommendation problems: they should be at least aware of pointwise, pairwise, listwise formulations for ranking loss. 
IC6+
Can proactively talk and compare different ways to formulate a ranking loss. 
Good candidates will be able to talk about more than a just a trivial geo-lookup method for generating place candidates to recommend.
Demonstrate knowledge of industry standards for recommendation systems: e.g., talk about at least one of two-tower networks, deep and wide architecture in depth


# Evaluation

If not arrived at by the candidate proactively, I usually ask: “Let’s assume we have come up with a candidate model to try out now. How will we proceed?”
In general, the expectation is that the candidate talk about both offline and online evaluation. Candidates should propose a few relevant metrics for the problem.
IC4+:
Should not only name a few metrics - but also be able to define them. 
Will know about A/B tests - but okay if they’re not able to go into details (especially for fresh PhD grads).
Can talk about good ways to setup partitioning of train/test/eval set.
IC5+:
Justify the choice of metrics, tying back to business objectives / ML objectives.
Can talk about details of A/B test setup - statistical significance.
IC6+
Can talk about debugging offline/online metric movement inconsistencies
Can talk about good multi-developer (or multiple variant) A/B test setup.

Red Flags:
Confusing offline and online metrics: e.g., track ndcg/precision for a deployed model and taking a decision purely on this basis. 



# from the wiki

Design a Machine Learning system to recommend nearby places you'd be interested in visiting while you are on-the-go (mobile).
Design an ML backend for a mobile app that can recommend nearby places you might be interested visiting # (https://www.internalfb.com/intern/recruiting/interview/questions/?question_id=358450017854744#design-an-ml-backend-for)
The app has 2 basic modes : when you open the app it shows you a list of recommended places nearby, but you can also pick one of 6 categories (e.g. bars, landmarks, food, shop, coffee, hotels) and see recommended places in that category. The following can be given directly or provided as answers to follow-up questions:
You have a POI database of 100M places with rich information about them. you can use any signal from the device or from the user profile.
You have 1 month of fully logged data, where the app was just showing you the closest places (a naive model).
The system needs to handle 1B queries per day.
Possible dimensions to cover during the interview (experienced user should come up with them on their own) : # (https://www.internalfb.com/intern/recruiting/interview/questions/?question_id=358450017854744#possible-dimensions-to-c)
What would you optimize for and tradeoffs?
How would you measure the quality of your system?
What data would you log?
What specific place information would you need, besides name and address?
What ML features can be good for your system model?
What ML model(s) will you use? Can you compare between them?
How would you train the system?
How would you handle new users (cold start)?
How would you detect a data over-fitting problem?
How would you test/launch a new model?
Topic modeling: how would you define topics? How would you learn them?  How would you use them in the model?
How would you make the system personalized?
How would you debug if the system's ML performance is lower that expected?
Examples of how the question might go:
As a note, these descriptions are not prescriptive.  The goal of this section is not to outline the only way for a conversation to go.  The goal is to have an idea of some of the typical ways a question can go, a sense of relevant topics, and some high level guidelines for leveling.  A good candidate can get through the relevant material in several different orders and one of the great things about the ML Pirate is that they frequently will have a suggestion that you haven't seen before.  Also, the leveling advice here is not set in stone.  It's not uncommon to see a candidate who is E4 in some areas and E5 (or E5 in some areas and E6) in others.  All of this should be noted in your summary for candidate review, and your decision should be on-balance of all the evidence.
Problem Set-up:
A lot of candidates jump right into feature engineering while others start talking about what sorts of data they need to log and I usually let them run with it for a bit in the hopes they then step back and talk about the big picture (some do, but if the candidate doesn't, very typical with junior candidates, I usually ask them if they could list all the components of the system and then we can dive into each one which usually gets them back on track).  Once they are talking about the big picture they usually list some of the typical components (possible components: training data, model, evaluation, features, how to apply ML to making multiple recommendations).  For more junior candidates, they may not have the most organized presentation, but you should make sure that the candidate touches on each of these areas at some point in the interview.  At a high level, they should be able to articulate how their ranking / recommendation system works (e.g. does the ML system classify lists?  is it a regression? does it rank by a score / probability? pair-wise? collaborative filtering? how do they get place candidates or do they rank all candidates in the world?).  Some of the options are more reasonable than others, but a minimum expectation is that they can come up with a workable solution and articulate some advantages / disadvantages of any one of the solutions. A typical solution uses an ML model that produces a score which can be used to order a list of candidate places nearby.
One note, collaborative filtering can be a bit of a pitfall if it's used as the main system (but fine if it's part of the features) and can make it hard to get signal on other parts of the interview so I usually try to ask them for alternatives if this is the main thing they come up with.
E5: For an E5 you would expect the candidate to drive the problem set-up and produce several solutions and then be able to talk about trade-offs among the solutions.  As a few examples, they could talk about how a pair-wise system could have some advantages but has a cost in terms of efficiency / complexity.  An ML algorithm that classifies whole lists would be even more intractable.  Another example, they could talk about differences between a regressor and a classifier and how this is related to the kinds of labels we use (if we train the ML model on clicks, a classifier or something that outputs probabilities (like LR) could be used or if we predict time spent a regressor on time spent could be used).  They don't have to cover every area in depth, but an E5 should proactively bring up a couple of areas and be able to go through them and come up with a sensible evaluation of each option with little-to-no prompting.
E6: For this section, the main difference from E5's is that they are usually more organized and you start to see evidence of their ability to scale up-and-down from details about training data / modeling / equations and then back up to the high-level components (business level objectives, how engineers work on the system) and are comfortable moving between these different scales.
Training Data / Measurement:
An important, foundational, part of the problem is the training data and measurement.  Common choices for labeling the data are things like clicks or time spent on a page.  Common measurements include predicting CTR (classifier) or predicting time spent on the page.  Then metrics like PR curves, AUC, RMSE, can be used to eval the ML model.  These metrics have the nice property that they can be computed offline, but some candidates recognize that the business case for the app might have goals that are difficult to measure offline. For example, we might actually care about the amount of time that users spend on the app.  Or we might care about user satisfaction with the product.  Or we might care about whether users actually visit the place.  These might require measurement via AB tests rather than offline.  Another aspect of the problem that can be delved into is the ranking aspect (it might not matter that we get exactly the right place at the top, only that the top of the list is populated with interesting places).   A junior candidate might need some prompting, but they should be able to come up with at least a few of these options.  If they only come up with some offline metrics based on clicks or time spent, I will usually ask how they will choose between the two options.  Poor answers involve an intuition about relative weights, better answers involve thinking about how to use data / AB testing / analysis to make decisions.
E5: For an E5, you would expect the candidate to be able to do drive the conversation to touch on all of these subjects and should also be able to bring up some additional topics like ranking metrics (e.g. NDCG, MAP, etc) and be able to go into detail what these are / why they might be better than typical classification metrics.  Another area that they might jump into here is the difficulty measuring actual business metrics offline and be able to drive a discussion about online vs offline testing and business objectives and what we “actually” want.  For example, it's hard to train / evaluate offline against user satisfaction.  E5's also often proactively bring up the cold-start problem (whereas I usually need to prompt this for a junior candidate).
E6: For an E6 you would expect everything that you get from an E5 here, but more organized / deeper discussions.  For example, I've seen E6 candidates consistently bring up issues with training on data collected from showing the user only a small set of candidates and the feedback loop caused by this in the metrics and how to avoid this by inserting places into the list outside of the top ranked candidates.  Another issue that E6 candidates frequently bring up is the diversity of the recommendations and ways to deal with this (often with secondary systems).  Another depth area could be how product decisions in the app / wider FB could affect the training data and cause issues.  There are other options as well, but the key piece is that an E6 can go deep and talks about things outside of the immediate ML system concerns on different dimensions.
Model:
Once we get to the data they are going to need for their system, the candidate often talks about the model they are going to use.  I find that this and feature engineering are where junior candidates are most comfortable.  Typical suggestions, include logistic regression, GBDT or random forest, SVM, neural nets, and collaborative filtering.  Which model they settle on is less important than their ability to explain it fully and articulate how it could be used to solve this problem and the advantages / disadvantages of their approach.  You also want them to be able to explain at least one alternative approach to the problem (junior candidates often need prompting to get them to consider two options, while senior candidates are comfortable discussing multiple different situations where each model might be useful). I usually try to get a junior candidate to discuss linearity or how they would choose between two options and expect the answer to be data driven.
One note of caution here, there can be issues with using collaborative filtering as the main model (in particular, if you are in a city you've never been to before, this could cause issues with the collaborative filtering approach) and I also find that CF is frequently suggested as a word-association with recommendation / the Netflix challenge.  Make sure that if this is the case, you have them explain why they want to use CF / what potential challenges could be (i.e. we don't want to reject a candidate because they go down an unfamiliar path because they think it's the “right” answer just because the Netflix challenge is famous).  It's usually not an issue if CF is suggested as a feature to feed into the model.
E5: As mentioned above, an E5 will be expected to be contrasting multiple options without prompting and will be familiar with tradeoffs between each of the options and the discussion generally has more breadth and depth (even though any one of the model options could come up for a junior candidate as well).  An E5 will also be very comfortable bringing up complexity / linearity / interpretability and discussing each of the subjects and will have clear data-driven solutions.
E6: An E6 will usually connect the model with other systems they have been describing.  For example, they might talk about advantages / disadvantages of having submodels feed in as features vs allowing a model like a NN to learn the features and potential issues.  They could also talk about difficulties dealing with things like diversity in the results and how post-processing steps (“twiddlers”) might be needed.
Feature Engineering:
Common features vary widely.  So widely that I'm just going to mention a few areas that should come up.  As a note, usually junior candidates are most comfortable with this section.
Personalization - How can we make the recommendations specific to the user's tastes (see taste / topics for several sub-problems)?
Friend's preferences - How can we user friend tastes to influence the recommendation?
Sub-problem: How do we identify the closest friends?
Topics / Preferences:
Sub-problem: What does the candidate even mean by preferences / topics?  How do we represent them? How do we learn them?
Sub-problem: How do we store the preferences?  How do we build features from the stored representation?
Sub-problem: Though this can be a bit strained, if the candidate lists NLP or computer vision as an experience, I sometimes ask how they might extract this information from comments or photos.  If they don't have experience and bring up comments, I'll ask them for a simple example of how to extract a topic from comments.
Popularity
This can be tricky, a subtle aspect of recommendation systems is that you might not want to recommend the most popular places since people already know about those...but you also don't want to recommend unpopular places that aren't good.
Time of day
Closeness
The distance aspect of this problem sometimes gets lost, but it can be interesting to hear how they deal with it.
Is the user traveling?
I expect candidates to be able to translate these sources of signal into actual features and talk about feature representation, esp. for categorical features w.r.t. to various models.
E5/E6: For an E5+ engineer I expect them to really be able to dig into the sub-problems and describe different approaches.  If they have an expertise in a particular area, this is also a chance to bring up a feature which might be able to make use of their knowledge (sometimes this leads to a bit more far-fetched solutions, but that's ok, the goal is more about estimating the depth of their expertise in that area).  But the main thing we are looking for here is that not only can they come up with features to cover core areas, they also can discuss in some depth plausible ways of retrieving different info and scope out some of the difficulties / tradeoffs associated with the more complex features. It's a bit hard to distinguish between an E5 / E6 in the feature engineering section, but usually the signal here comes from connecting features to the wider system in some way.  For example, how do we do feature selection? Detailed understanding of different abstractions for features (statistical modeling?  raw inputs into the ML algorithm?  using other sources besides place rec logs for building features?).  Detailed discussion of the difficulties around obtaining different data and the sorts of biases that could be introduced.
Practical ML:
Usually the emphasis here is more about offline ML training / analysis / evaluation. Once the candidate has outlined a couple of ways to do something (for example, “I could use a logistic regression or a decision tree” or “You can limit the complexity in a tree by limiting the number of leaves”) you can ask them how they would choose between the two options (or how they know what the right amount of complexity is) and this is usually a good way to get them to talk about their train-validate-test setup or cross-validation.  If they don't bring up overfitting immediately, I often ask them why they need to split the data or why cross-validation is necessary or play dumb (“Oh, why did you split your data into two different sets?”).  I also ask for other ways to prevent overfitting (here I expect discussion of regularization appropriate to the model they have chosen).  If they can't provide a decent definition of overfitting / underfitting, how to avoid it with their evaluation practices, and discussion of at least one way of regularizing / penalizing complexity this is a red flag.
E5: An E5 should be able to drive this discussion on their own with almost no prompting.  They should be able to discuss regularization / complexity / overfitting in general and with respect to the ML models they used in their solution + go into details of a few specific approaches they could take.  They should also be able to identify the limits of offline measurements and when they would need to run an AB test to evaluate their solutions.
E6: An E6, in addition to everything covered by E5, you would expect to proactively identify potential issues that could come up in practice.  For example, diversity in recommendations, potential feedback loops, specific problems with business metrics that might come up, issues with multiple engineers iterating on features.
Production Deployment & debugging:
While related to the practical ML section, the emphasis here is on productionizing a model.  I find that new grads frequently have less to say here, but you should still be able to get some signal but it might require prompting.  I always try to ask the candidate about how they would deploy the model and what they would do if they get unexpected results.  The expectation is that they talk about AB testing / a basic roll-out procedure and they should be able to articulate some things that could go wrong.  I find that experienced candidates will have tons of clear ideas about what can go wrong and ways to identify it, but even new-graduates should be able to come up with some potential bugs.
E5: There is some overlap here for the senior candidates and practical ML / measurement.  As mentioned above, you definitely expect them to be comfortable driving the discussion around deploying + coming up with a bunch of different things that can go wrong (a common example that comes up with senior candidates is the tradeoffs between logging features, calculating them offline vs online, and potential bugs between different implementations).  Because detecting problems is closely related to measurement and metrics, there might be some overlapping signal here.  Examples of other issues, changes in the distribution of places in an area over time, changes in demographics, improperly sampled training data, cold start problems, etc.  An E5 will often mention a lot of these areas, but won't have as much depth as an E6 in diving into them / solving the problems.
E6: For E6, I find that candidates at that level have more clarity / depth when discussing the problems.  For example, E6's are frequently able to dig into implications of feedback loops (mentioned above).  In the recommendation problem, the typical example is that if we evaluate on clicks, but only show users our top recommendations, we never get signal on places that are never recommended.  Another typical area is deep discussion on how to deal with the “popular places are already known by the user” problem.
