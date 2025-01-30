---
id: ntux0rz9oi75w3fufl720xq
title: Production Training Frequency Optimizaiton
desc: ""
updated: 2024-12-07T15:32
created: 1733576135505
---

Question Statement
This same question can be find in Data Scientist ML Interview Question Bank (link)

--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

ML Interview Evaluation Axes (link):

The purpose of ML interview axes is to enable a standardized rating scale for Senior DS candidates (IC6+) going through different ML interview questions, so that the hiring decisions are made consistently.
Notes.

The axes, and its order listed here, is NOT how the interview flow should be carried out. The specific interview question should lead the candidate through solving a problem in a natural fashion, while the axes are used to take all the signals extracted, and map them into a consistent evaluation criterion.
We don’t expect one interview session to go deep evaluate all sub-axes, given the time constraint. Suggest covering all major axes, while focusing on 2-3 sub-axes (i.e. each sub-axes in “ML Design & Operationalization” and “ML Understanding and Intuition”) to go deep and check other sub-axes for no red flag
Recommended Logistics:

Opening + Warm-up question on ML leadership: 5-10 minutes
Case study with one of the following ML questions: 35-40 minutes
Opening: This will be a ML Analysis Interview - Not looking for all the right answers but generally your process. I want you to make reasonable assumptions and explain them. In general I want you to commit to your answers. We will take the first 5 minutes to learn more about your past experience through a warm-up question, and then dive into the case study right after, and leave around 5 minutes at the end for answering your questions.

Warm-up Question on ML Leadership

Main question: What is an ML related project you feel most proud of? (what was the problem? what was at stake? Who were the folks involved? What was your role? What were the challenges / frictions and how did you overcome them? )

1. tell me about some modeling work that you have done

2. why was it important

3. what was your contribution

--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

Setting Context - Optimize Production Training Frequency
Main question: At Meta, we have many ML models in production (e.g. an ML model to predict click-through probability on ads on Instagram app) that help to select the most suitable advertisement when users are browsing through our apps. Each model should be refreshed (re-trained) at different frequencies, yet the most optimal refresh frequency (e.g. continuous training, hourly, daily, etc ) of each model is unknown. Your task is to propose a solution for this problem.

Supplementation information for interviewer ONLY: Production training frequency is detected by many factors, such as data feature refreshness, resource availability, purpose of the Model ( can even be multi task multi label, aka, MTML), and model improvement (return) of increasing training frequency (input). TC should have a point of view; if not, one of the good ways to prompt it could be “can you think of a reason why we might not want to do Continuous Training”?

Q1[Business Understanding]: What are the most important factors that would help us to determine the optimal training frequency and why they are important?

General goal: Given the context, we are expecting TC to quickly relate the problem to an optimization case through discussion: to set each model at their optimal frequency to yield the best return on resource investment.
Questions & Assumptions:  It’s important for TC to ask clarifying questions and make enough assumptions to continue the discussion. If TC doesn’t clarify enough on how assumptions are made and no questions are asked, it’s important to prompt for example: what are some important parameters to consider before we design the solution?
Some questions & assumptions can be.

How many production models are in question? 
I.e. Are we expecting a large number (in hundreds), where we need an automatic framework for generalization or a small enough number that we can use empirical knowledge.
Are we gated by limited training resources?
In real life, yes; but for this question let’s assume we have unlimited resources for the frequencies TC chooses. But also expect TC to illustrate on what the “optimal” means later on.
Does feature availability affect training frequency?
Again, in real life yes; for this discussion, we can assume feature inputs are available at any time when we are ready to train the models.
Discussion outcome: At the end of the clarification & discussion, the candidate should be at a stage that
Relate this problem to an optimization case.
Understanding the case’s goal is to balance the optimal ROI: determine the gain curve for different training frequencies of a model.
Large numbers of models indicate that we can not experiment through every single frequency of any given model to find their best frequency gain curve.
Therefore, a more generic approach here is needed (ie. clustering similar models based on models’ characteristics, and selectively experiment through)
Evaluation Criteria: A good candidate should be able to
Identify the challenge fast and ask questions, and/or make enough assumptions with good elaborations on reasons for their hypothesis.
Frame the problem space goal well from the business case.
Have some sense of trade-off discussion around one or more of the below areas:
Empirical & product knowledge grouping vs automate framework
Resource and return trade-offs on frequency
Generalization vs accuracy trade-offs
[Bonus] Evaluation Criteria A better candidate could scratch the goals even further by discussing business output such as:
Maximum return vs return natural but resource efficiency, this could typically need to be checked on business/org level goals.
Infrastructure limitations, such as experiment delays etc
Check on establish the measurement & metrics
Q2: [Metrics Thinking]: How do you set up measurements to ensure the success of the project?

Discussion outcome: At the end of the clarification & discussion, the candidate should be able to:
Define top line (north star) metrics to quantify the Biz objective, e.g.: ad-sore / MegaWatt(MW). N.B. Candidates might not use ad-score or MegaWatt(MW) as we typically use at Meta, anything along the lines of “return over hardware cost” is good enough.
TC comes up with a number of secondary metrics for direct measure of the project outcome. E.g. experiment NE gain, accumulative GFLOPS saved, etc.
Evaluation Criteria: A good candidate should be able to
Clearly define north star (topline metrics) for business goal
Clearly define a set of secondary metrics to measure project outcomes, and/or each different component of its success.
Have “guardrail” metrics in mind. I.e. while we decreasing training frequency while maintaining ad-score per model natural, it will also be good to guardrail total fill rate is not dropping (ie. improved efficiency at the spend of impression volume)
Dive deep into ML Foundations
Q3 [ML Design & Operationalization]:  As a starting point, we want a basic generalization approach to group similar models together for experimentation automation: how would you build up the ML hypothetical solution? Assume we have enough meta data on models, such as compute complexity, size, parameters, optimization goals and architecture etc.

Supplementation information for interviewer ONLY: For the purposes of this interview, let’s guide TC to be more focused on “building a clustering model” to generalize the problem, rather than spend time talking about setup up experiments or read results.
Discussion outcome: At the end of the discussion, the candidate would touched following topics (next bullet point)
The following questions to evaluate on [major-axes: ML Design & Operationalization]
What ML problem is this about. (e.g. group similar models based on their characteristics). Hypothetically our production models do share similar characteristics such as input features they use, size, FLOP (floating point operation), ad-score shares etc.
Is this a supervised or unsupervised learning problem?
If supervised, how to get labels (or how practical to get labels)
If unsupervised, focusing a bit later on how to validate the results and how to measure model performance itself
What is the generic flow to build up such a ML model (or sets of ML models)? (e.g. how to prepare the training data, validation, testing)
TC might choose to do PCA before clustering, have them explain the reasoning behind and trade-offs.
If they choose not to do dimension reduction to compress the space, ask why
How to choose the features. (e.g. identify feature groups and discuss reasons to incorporate them into the flow)
How to evaluate model performance (e.g. A/B testing, on session or user?)
What evaluation metrics they would choose and what to measure against? (e.g. elbow measures squared distance)
One specific on clustering: how to choose the best “K”
Validating the effectiveness of a clustering model itself is not enough. For this problem, we should also take the clustering results to check against each model’s loss against historical data, to ensure the outcome of the solution also makes sense.
How do you productize your ML?
If a new “product model” is launching, how do you use your solution to determine its optimal training frequency? (Do you need to do something else in order to expand your framework to newly launched models)
For more experienced TC: how frequent do you want to refresh your model and track model performance degradation?
More ML related sub-questions are here: https://fb.quip.com/ldnFAwmGvjCR
Q4[ML Understanding and Intuition]: Which ML algorithm would you recommend to group models that have similar characters together? How does it work? Most candidates would choose to use clustering techniques, we can expand from here:

[Model Improvement] Which clustering ML method would you choose? For more junior candidates or ML generalists, have them explain roughly how the algorithm works (i.e. how K-mean works). Can also have them explain what distances they might be measuring (e.g. Euclidean, Cosine Similarity, Manhattan)
For more experienced TC or TC with deeper domain knowledge, we can talk about trade-offs between different clustering techniques, such as K-mean vs Spectral vs Affinity Propagation
[Diagnosing Issues]What can go wrong in the production model?(e.g. data corruption, also the past experience debugging the model, such as upstream feature delays, data bias, etc)
Evaluation Criteria: (this should be in alignment with the sub-axes evaluation criteria):
Good candidates would clearly discuss the ML flow covering all the key elements, with a good framing about how to group each discussion logically, and and be able to dive into the details on why they make a specific choice
Weaker candidates may touch most of the ML elements, however, could not reason well why a specific option was chosen.