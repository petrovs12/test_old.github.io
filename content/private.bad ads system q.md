---
id: jeu2gkw5ixzqikl6mqh53p4
title: Bad Ads System Q
desc: ""
updated: 2024-12-07T10:46
created: 1733564480568
---


Description
Build a system to run ML models on new ads to detect bad content. Include new posts as an extension.

Question Statement
Asking The Question:
Build a system to run ML models on new ads to detect bad content (
e.g. spam, hate speech, misinformation, etc...
) . Include new posts as an extension.



Ads content is uploaded to Facebook. We wish to use ML to apply a set of standards at scale. Ads contain a mix of text and images (video/links are out of scope). The system makes a determination at the time of upload.



Requirements:

Support O(10M) ads/day, O(1B) posts/day
Decision latency of a few minutes


There is a lot of potential ground to cover

Ask the candidate to give a broad system overview
Dig deeper into the signal axes based on candidate expertise


Gathering Signal


Problem Exploration
What kicks off a processing? Is it only at creation time?
Who coordinates the downstream actions?
Definition of “bad”?
How many models need to be evaluated? 
What is the size of the text and image models?
How much memory per node?
Support streaming or batch inference?


Modeling Approaches
Establishing an objective and tying it to the system goal
Labels with clear definition (human review / inferred labels)
Objective: classification, return scores or probabilities
Single-class vs multi-class, Model architecture
Trade-offs in modeling complexity (e.g. [[science.stats.Regression.Linear Regression]], [[science.stats.Support Vector Machines]], [[science.stats.Unsupervised Learning.KNN]], [[science.stats.Deep Neural Networks]])
Update velocity, ability to deal wi

e.g. text n-grams, image embedding, account counters, etc...
Establishing thresholds, principled prec/recall trade-offs
Infrastructure Design
Component responsibilities and APIs
Request handling, routing, ad/image/text processing, inferrence, monitoring
How model requirements are supported by hardware
Full set of models? Candidate generation for expensive ones?
All modalities in one place? Split by modality/needs?
Scalability considerations (of models/of requests) 
Load balancing, handling backlog of requests
Caching and reuse of features/scores
Tradeoffs between compute cost and staleness 
Storage / Logging
Storing requirements for full set of features and/or metadata, scores
Monitoring health of system (throughput, latency, error rates, etc...) and ML (feature coverage, score ranges, etc...)
Collecting representative data for model training
Tradeoffs of storing vs re-computing
Handling drift/feature edits
Training / Testing
Training data provenance (features, labels)
Success metrics and how they tie to our objective
e.g. recall @ 90% precision for auto-decisioning, precision @ 90% recall for 
Training time and compute cost
Offline experimentation capabilities
Methodology for statistically significant lift offline
Random vs temporal partitioning of train/test data
Representative testing dataset
Deployment
Pre-deployment tests
Online experimentation using A/B tests
System & ML metrics
Handling lack of labels
Back-tests
Multiple engineers deploying at the same time
Monitoring and alerting after deployment
Leveling


Expect ~70% of the following positive signal

E5
Problem Exploration
Defines the classes and labeling strategy, but may not dig deep into the business needs. Explores the technical requirements (e.g. QPS, memory footprint). Clarifies upstream and downstream SLAs and expected APIs.
Modeling Approaches
Should be able to pick an approach such as multi-class classification, choice of architecture typically motivated by exposure rather than deep understanding. Should understand the importance of all relevant modalities and talk about feature engineering for at least one (e.g. n-grams or one-hot encoding for text, representation learning for images, graph features for associated account).
Infrastructure Design
Expect to see clear component responsibilities (e.g. requests enter a queue, coordinator assigns jobs to worker nodes and communicates with clients async, worker nodes support micro-services with pre-processors & models, results are logged to a DB for long-term and a cache for immediate use). Should consider how to scale horizontally.
Storage / Logging
Expect to see a sane DB schema for the metadata, reliance on a document store for the text and images, potentially an extensible schema for the features. Should have identified a reasonable set of infra stability metrics (e.g. throughput and latency) and basic ML metrics (e.g. feature availability).
Training / Testing
Candidate should be able to talk about acquiring features and labels. Typically use out of the box metrics (e.g. accuracy at score of 0.5). Expect to see isolation of the train/test dataset (often via random split). Ideally also discuss importance of class imbalance.
Deployment
Expect to see a rigorous online evaluation process (e.g. using canaries to assess changes in compute cost, A/B test on a sub-population to evaluate lift) which may be used both at launch and during online serving. May make some naïve assumptions about online evaluation without labels.
E6
E5 expectations plus a deep discussion in 2-3 of the following:

Problem Exploration
Exploration of the business needs, may clarify whether decisions or raw scores are more appropriate. Understand whether arbitrary additional calls may be made (e.g. reprocess old live ads). May clarify parts of the advertiser experience.
Modeling Approaches
Explanation of model outputs (e.g. score = likelihood). Differences in modalities is understood (e.g. greater compute cost of image models, greater memory footprint of text models). Expect to see a discussion of how to support complex feature engineering. Expect to see a discussion about trade-offs between different modeling architectures.
Infrastructure Design
Identify the need to support both streaming (e.g. during ad approval) and batch (e.g. re-generating features for training/offline testing). Discussion of extensibility (e.g. new feature extraction, model types).
Storage / Logging
Understand the interdependency between evaluation data and training data, discussion of what inputs/processed features/outputs to store and for what purposes. Expect suggestions on how to monitor model failure modes, performance changes over time.
Training / Testing
May talk about how to improve offline evaluation (e.g. handle sampling bias) or tradeoffs between size and freshness. Expect some discussion about the statistical power and predictive power of tests.
Deployment
Should have a clear solution on how to evaluate online and experimentation best practices. Explanation of the success metrics. May discuss how to support concurrent tests. May discuss long-term performance monitoring or model lifecycle management.

[[engineering.technologies.ML.Cold Start Problem]]
[[Ads Serving System]]

[[]]