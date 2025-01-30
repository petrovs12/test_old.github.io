---
id: qeef4amtt96busfhq693sbx
title: Ads CVR Prediction System
desc: ""
updated: 1733565467544
created: 1733564768377
---


# Description

Advertisers install Facebook pixels on their website and they send signals back to Facebook when a purchase is completed in their website. When advertisers create ads in Facebook, they associate those pixels with their ads to let Facebook know their ads performance in order to optimize better for their ads. Design a machine learning system to predict ads conversion rate (CVR) for e-commerce purchase - how many purchases for particular ads.

# Question Statement

The purpose of the machine learning infra pirate interview is to assess the candidate's ability to build machine learning systems. A machine learning system is the end-to-end system that solves machine learning problem (e.g. image recognition, natural language processing, personalization and ranking, etc). It is often composed of training systems, inference systems, feature systems, logging systems and experimentation systems. A successful machine learning infra interview can cover the high level of everything and zoom in or zoom out at different systems based on candidates' expertise. You must tailor the interview experience to get signals from the candidate's ability to build systems.
 
1/ Problem Exploration
 
All ML infra Pirate questions share the property of design questions. They are very open without right or wrong answers. Solutions are based on assumptions and requirements. We expect candidates could explore more requirements and ask for clarification before jumping into the systems. Here are common questions they could ask

What’s the scale or QPS of the system?
What’s the latency delay for receiving pixels from websites?
Do we design a production system, experimentation system, or both?
Do we need to design a training system, or online inference system, or both?
Tips to interviewers

Set expectation that candidates need to design an end to end system including both training and serving parts. You may deep dive only one of them in 45 mins but we expect candidates to have an overview of end to end.
Ask them to design the production system only, then expand to experimentation system if you have more time. Experimentation covers how to prepare feature injection, how to generate different combination of training data, how to design a better A/B test universe.
2/ High level System Diagram
 
We expect candidates have machine learning workflow knowledge where they know training data preparation, feature generation, model training, model serving, offline and online evaluation. Candidates need to map those concepts into a system diagram and it typically has logging systems, offline feature processing systems, model training systems, online feature preparation system and model serving systems.
 
# Tips to interviewers

ML candidates use to jump into features and models directly. You need to guide them to draw the overview picture before the deep dive.
You could ask candidates about the data flow from request → serving → logging → feature prep → training → online prep → serving ... (not this exact order based on your systems).
3/ Deep Dive
 
This is the most tricky part of the interview and interviewers need to tailor questions based on candidates’ background. It is not uncommon that we don’t have enough time to talk about all systems. You need to unpack each system with right level of details. Here are typical talking points for each system. 
 
# Tips to interviewers

Never ask all of those questions in 45 mins, and time yourself in each system and give right budgets.
Logging systems
 
Logging systems (sometimes we call online joiner) are responsible for generating training data. It is designed to join training labels with features. In ML Pirate, it is training data generation. You can ask a few questions around logging systems

Conversion pixels are sent back to Facebook several hours or even several days after the original impressions are showed onsite. How we can attribute (join) those pixels with features? We used to hold feature vectors in logging systems and wait for joining pixels based on some identifies such as user id, ad id, etc. A good candidate should notice that deduplication is needed before you join features and labels.
How we handle the delay of pixels (e.g. some pixels are sent back together with a large volume)? In this case, we need to shuffle data and make them more uniform, or have a mechanism to handle backlog as regular systems.
Which storage we should use for holding those features? RAM, Flash or disks. There is no right or wrong answers, and it depends on your use cases (e.g. scale, QPS, online training or not). Expect candidates can talk about trade-offs among different storages.
How to make sure that bad training data is not landed? It needs quality check in the training data before landing, and those checks include calibration (positive/negative ratios), feature missing ratio, abnormal feature ranges, size of training data per row, etc.
# Feature systems
 
Feature systems are responsible for feature generation, serving and logging in the production. It is designed to transform ingested data to valuable feature representations. In high level, it could be batch features or streaming features. You can ask a lot of questions around feature systems

What’re feature list and feature formats for this problem? You expect them to come up with several examples of user features, ad features and cross features. Feature formats could be float for dense features and lists for sparse features. We don’t expect in depth understanding of attention features or model based features in ML infra pirate.
How to compress feature data given it takes the most of footprints in training data? Features could be divided into users features, ads features, and other features. We could store metadata of features and explode them when we need them. Id list features could be further compressed with start index and intervals. For example, 100, 101, 102 can be stored as 100, 1, 1. Another interesting observation is that feature values appear together with several patterns. For example, feature 1, 100, 105, 291 may either all 0 or all has values. You can encode this feature id combination (1, 100, 105, 291) pattern into one number to further compress.
How to design a system to count last one hour historical page views? A basic design needs to have a sliding window aggregator and advanced one has special writes (acknowledge writes and recover from failures or backlogs) and readers (immutable structures of optimizing reading).
You have so many data pipelines and how to optimize them from computational point of views. Figure out some data (e.g. impressions, clicks, conversions) are processed by many feature pipelines so you can read once and produce multiple features together. If you decouple authoring and implementation of features, you can run a “complier” to optimize all pipelines globally when you transfer authoring DAGs into execution engine plans.
Similar to training data, how to make sure bad features not landed? You can have similar quality check on them.
Model training systems
 
Few candidates have core ML training infra experiences. You can move on quickly if you identify candidates without experiences. Model training systems transfer features into models and leverage popular deep learning framework like tensorlfow, PyTorch, etc.

Compare several algorithms and their pros and cons. As ML pipeline interviewers, you need to figure out those answers by yourself :)
How to train a big model? It needs distributed training and you could ask the basic idea of model parallelism and how parameters sync with each others. There are many training paradigms for distributed training in deep learning: parameter servers and decentralized training. Ask candidates to explain the data flow for one of training paradigm. As I mentioned above, feel free to skip it if you don’t see they have experiences.
If your model needs updates frequently, how to design an online training system? You need to publish model snapshots from offline training to a storage and load them in online trainers. It is not recommended to update online serving models too frequently to avoid overfitting or bad data, so you need to publish model snapshots regularly and online serving systems can load them. Recurring training design is similar but you can shuffle data within one day.
How to avoid transient failures in long training jobs? You need to have checkpoints and dump models to the disk periodically. When failures happen, you can recover jobs from those backups to avoid restarting from scratch.
# Model inference systems
 
Model inference systems are designed to serve large models in a scalable way. In a small scale, it could be inference library. In a large scale, a remote service is needed. Sometimes, you even need several services - one for computation and another one for storage.

How to serve a big model if the model size is large scale? There are multiple ways for it. Quantization is the straightforward one to compress model size where we use low precision float in model weights. Another idea is pruning weights while training or post training. Sharding model weights in different servers could be the 3rd option.
If you have a remote service, how to make sure it is balanced? You need to select hosts before sending out requests and there are many factors (e.g. workload, complex of models in this request) you need to consider. It is sufficient that they could explain regular load balance.
What systems will behave if the remote service is down? We used to reserve a small scale model in local to prepare remote failures.
# Experimentation systems (Optional)
 
Experiment systems are designed to enable fast experiments iteration. It is used to partition users or traffic into A/B and test online metrics in two groups. From systems perspectives, you could ask

What’s the pros and cons for partitionion''ing by users vs by traffic? Users’ behaviors could be more consistent if they are exposed to the the same test/control group - which is the preferred setup if you have high quality user identities. Partition by traffic is more easier to split them uniformly.

What happens in backend when we create A/B groups? There are many ways to create experiments. Assume we partition by users. The straightforward one is creating 1% users in the test by hashing functions. Alternatively, we can divide all users into small segments (e.g. 100K) and create 1K segments (equivalent to 1% users). The second approach assignment mechanisms leads to unnecessary long-term increases in variance due to carryover effects, but it is cheaper in the post processing with grouping users into segments.

How to protect bad experiments happened? You can design a stage status for your experiments to verify everything before rolling out to global. The same idea is applied to large portion of traffic experiments.

#  Advanced Topics
 
For senior engineers, there are several advanced topics to test the depth of machine learning infra understanding. I just list a few of them.

* Feature offline and online consistency
* A/B test system for infra expensive models
* Design logging systems to experiment different attribution windows
* How to make sure all features are privacy complaint
* How do you debug models if the final prediction is 2x off
* Where are bottlenecks compared a machine learning system with 100 ML engineers vs 2000 ML engineers

...
Feedback and Signals
We are looking for following signals in ML infra Pirate, and encourage new interviewers write feedback in the following format - even though you navigate interviews based on different systems. If we don’t have enough signals in deep dive sections, you can ask some follow-up questions in advanced topics to extract them.

* Problem Exploration. This signal is collected from the problem exploration section.
* Infrastructure Design. This signal is collected from both high level system design and systems deep dive to evaluate candidates’ infra sense.
* Modeling Approaches. This signal is collected from their understanding from features and model arctechitures when you deep dive feature and model systems.
* Storage/Logging. This signal is collected from logging systems and feature systems where you can ask lots of questions around them.
* Training/Testing. This signal is collected from training systems and experimentation systems deep dive.
* Deployment. This signal is collected from model inference system deep dive.