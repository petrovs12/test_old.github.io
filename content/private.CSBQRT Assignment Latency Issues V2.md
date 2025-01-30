---
id: aj8rnlfvph76ndr3u79vo7a
title: CSBQRT Assignment Latency Issues V2
desc: ""
updated: 2024-12-10T09:45
created: 1729262432414
---

### **1. Clustering-Related Issues**

#### **Problem 1: Delayed Custom Flag Attribution (Type C)**
- **Description:** 
  - Some custom flags experience delayed attribution due to dependencies on daily dataswarm pipelines. This delay can result in ad allocation requests being postponed, and in the worst case, traffic may never be included in the experiment.
  
- **Proposed Lever:**
  - **Implement a Custom Flag Change Detector**
  
- **Action Point:**
  - Develop and deploy a mechanism to detect changes in custom flags promptly to minimize attribution delays.
  
- **Risks:**
  - **Research Risk:** Developing an effective detector may require extensive research and experimentation.
  - **Implementation Risk:** Potential integration challenges with existing systems.

#### **Problem 2: Assignment Delay for Newly Created Ads (Type A & B)**
- **Description:**
  - **Type A:** Newly created ads are only assigned to experiments during their second Ad Publisher cycle because assignment occurs in the prep-processor, while experiment selection is in the post-processor.
  - **Type B:** Ads are assigned to experiments only after the cluster resolution for a campaign is completed. If the clustering infrastructure hasn't processed an AdUnit, it won't be attributed to any running experiments, prioritizing correctness over detectability.
  
- **Proposed Lever:**
  - **Change the Lookback Hours Parameter in Incremental Pipelines**
  
- **Action Point:**
  - Adjust the `lookbackhours` parameter to reduce latency in ad assignment, ensuring quicker inclusion in experiments.
  
- **Risks:**
  - **Auction Purity Risk:** Altering the lookback period may negatively impact auction purity if not properly tested.
  - **Testing Risk:** Determining the optimal parameter change requires comprehensive testing to avoid unintended consequences.

---

### **2. Auction Purity Degradation**

#### **Problem: Decreasing Auction Purity Over Time**
- **Description:** 
  - Auction purity declines over time within identified clusters, potentially due to the cold start problem where new campaigns are not properly ranked initially and participate in different auctions before their performance stabilizes. This affects the accuracy and reliability of clustering.
  
- **Proposed Lever:**
  - **Increase Frequency of Incremental Pipeline Runs**
  
- **Action Point:**
  - Run incremental pipelines more frequently to assess their impact on maintaining auction purity and explore extending the data collection period for better stability.
  
- **Risks:**
  - **Auction Purity Risk:** Increased pipeline frequency might lead to further degradation if not managed correctly.
  - **Resource Risk:** More frequent runs may require additional computational resources and maintenance efforts.

---

### **3. Enhancing ML Clustering Performance**

#### **Problem: Limited Feature Utilization in Clustering**
- **Description:** 
  - Current clustering relies primarily on basic targeting features, which may limit the performance and latency of the ML pipeline.
  
- **Proposed Lever:**
  - **Utilize Pre-Extracted Features or Embeddings**
  
- **Action Point:**
  - Integrate more sophisticated, pre-extracted features or embeddings from existing Meta resources to enhance ML clustering performance and reduce latency.
  
- **Risks:**
  - **Research Risk:** Identifying and validating effective pre-extracted features requires thorough research.
  - **Integration Risk:** Incorporating new features may necessitate significant changes to the existing ML pipeline.

---

### **4. Custom Flag Management Enhancements**

#### **Problem: Custom Flag Exclusion and Attribution Delays**
- **Description:** 
  - Delays in custom flag attribution and challenges in managing custom flag exclusions can hinder the accuracy and efficiency of ad assignments.
  
- **Proposed Lever:**
  - **Implement a Custom Flag Change Detector and Improve Exclusion Mechanisms**
  
- **Action Points:**
  - **Custom Flag Change Detector:** Develop a system to detect and respond to changes in custom flags swiftly.
  - **Improve Exclusion Mechanisms:** Enhance the ergonomics of custom flag exclusion processes to streamline management and reduce delays.
  
- **Risks:**
  - **Implementation Risk:** Enhancing exclusion mechanisms may require significant codebase modifications.
  - **Operational Risk:** Introducing new detectors might lead to unexpected behaviors if not thoroughly tested.

---

### **5. Parallels with Dimensionality Reduction**

#### **Problem: Lack of Integration Between Clustering and Dimensionality Reduction**
- **Description:** 
  - Clustering based on auction co-participation is not fully integrated with dimensionality reduction based on customer traffic requests, leading to potential inefficiencies and missed insights.
  
- **Proposed Lever:**
  - **Use Estimator to Generate Features for an ML Clustering Classifier**
  
- **Action Point:**
  - Leverage the estimator to create new features that integrate clustering and dimensionality reduction insights, enhancing the overall clustering model.
  
- **Risks:**
  - **Research Risk:** Determining the optimal way to combine these data sources requires extensive experimentation.
  - **Integration Risk:** Ensuring compatibility between different models and data sources may present technical challenges.

---

### **6. Development Efficiency Improvements**

#### **Problem: High Development Efficiency Barrier with Current Digraph Algorithm**
- **Description:** 
  - The existing digraph algorithm used for clustering has a high development efficiency barrier and lacks support for node or edge features, limiting its flexibility and scalability.
  
- **Proposed Lever:**
  - **Explore Alternative Graph Partitioning Algorithms**
  
- **Action Point:**
  - Investigate and evaluate different graph partitioning algorithms that offer better support for features and lower development barriers, potentially adopting or adapting an existing in-house tool.
  
- **Risks:**
  - **Research Time:** Identifying a suitable alternative may require significant time and resources.
  - **Implementation Risk:** Integrating a new algorithm into the current system could introduce compatibility issues.

---

### **7. Code and Resource References**

- **Existing Work and Resources:**
  - **ML Style Work:** [Google Doc](https://docs.google.com/document/d/12WG05Ova0whF4gwk4_yfJiuHVHxkEH2uJKFbXfzBhSE/edit?fbclid=IwZXh0bgNhZW0CMTEAAR3vw6SWSox7SeqSRzt7-_D2NwlDt_FMBQpPMt-Ud-icQH_fXGPey42ptBY_aem_hdoWibSTN7pCH0DCopYp_Q#bookmark=id.1ci93xb)
  - **Code Repositories:** 
    - [Basic NN with Targeting Features](https://fburl.com/code/ote0tt2p)
    - [Clustering and Dimensionality Reduction](https://docs.google.com/document/d/1CGxBUoCRdRDOUJsG6L55l4rxS2OFOBR0y6zsZrc1O_Y/edit#bookmark=id.26in1rg)
    - [Incremental Clustering Pipeline](https://fburl.com/code/bkvjebhz)
    - [Lookback Parameter Adjustment](https://fburl.com/code/52b21blm)

---

### **8. Metamate and Custom Flag Assignment**

#### **Problem: Complexity in Custom Flag Assignment**
- **Description:** 
  - Custom flags are assigned in complex methods within the `AsbqrtAdAssigner` class, making it difficult to trace and modify assignments.
  
- **Proposed Lever:**
  - **Simplify Custom Flag Assignment through Codemods**
  
- **Action Point:**
  - Implement codemods to streamline custom flag assignments, potentially automating exclusion processes and reducing manual intervention.
  
- **Risks:**
  - **Implementation Risk:** Codemods may introduce bugs if not carefully executed.
  - **Maintenance Risk:** Automated changes could complicate future updates or integrations.


**Summary Table of CRBQPG System Issues and Proposed Solutions**

| **Problem** | **Lever** | **Risk** | **Details** | **Impact** |
|-------------|-----------|----------|-------------|------------|
| **Delayed Custom Flag Attribution (Type C)**<br>Some custom flags experience delayed attribution due to dependencies on daily dataswarm pipelines. This delay can result in ad allocation requests being postponed, and in the worst case, traffic may never be included in the experiment. | **Implement a Custom Flag Change Detector** | - **Research Risk:** Developing an effective detector may require extensive research and experimentation.<br>- **Implementation Risk:** Potential integration challenges with existing systems. | - **Action Point:** Develop and deploy a mechanism to detect changes in custom flags promptly to minimize attribution delays. | - **Impact:** Minimizes attribution delays, ensuring timely inclusion of traffic in experiments and improving experiment accuracy. |
| **Assignment Delay for Newly Created Ads (Type A & B)**<br>**Type A:** Newly created ads are only assigned to experiments during their second Ad Publisher cycle because assignment occurs in the prep-processor, while experiment selection is in the post-processor.<br>**Type B:** Ads are assigned to experiments only after the cluster resolution for a campaign is completed. If the clustering infrastructure hasn't processed an AdUnit, it won't be attributed to any running experiments, prioritizing correctness over detectability. | **Change the Lookback Hours Parameter in Incremental Pipelines** | - **Auction Purity Risk:** Altering the lookback period may negatively impact auction purity if not properly tested.<br>- **Testing Risk:** Determining the optimal parameter change requires comprehensive testing to avoid unintended consequences. | - **Action Point:** Adjust the `lookbackhours` parameter to reduce latency in ad assignment, ensuring quicker inclusion in experiments. | - **Impact:** Reduces latency in ad assignment, allowing new ads to participate in experiments sooner, potentially improving experiment responsiveness and accuracy. |
| **Decreasing Auction Purity Over Time**<br>Auction purity declines over time within identified clusters, potentially due to the cold start problem where new campaigns are not properly ranked initially and participate in different auctions before their performance stabilizes. This affects the accuracy and reliability of clustering. | **Increase Frequency of Incremental Pipeline Runs** | - **Auction Purity Risk:** Increased pipeline frequency might lead to further degradation if not managed correctly.<br>- **Resource Risk:** More frequent runs may require additional computational resources and maintenance efforts. | - **Action Point:** Run incremental pipelines more frequently to assess their impact on maintaining auction purity and explore extending the data collection period for better stability. | - **Impact:** Helps maintain auction purity by more quickly integrating new campaign data, improving clustering accuracy and reliability. |
| **Limited Feature Utilization in Clustering**<br>Current clustering relies primarily on basic targeting features, which may limit the performance and latency of the ML pipeline. | **Utilize Pre-Extracted Features or Embeddings** | - **Research Risk:** Identifying and validating effective pre-extracted features requires thorough research.<br>- **Integration Risk:** Incorporating new features may necessitate significant changes to the existing ML pipeline. | - **Action Point:** Integrate more sophisticated, pre-extracted features or embeddings from existing Meta resources to enhance ML clustering performance and reduce latency. | - **Impact:** Enhances ML clustering performance and reduces latency, leading to more accurate and efficient ad clustering. |
| **Custom Flag Exclusion and Attribution Delays**<br>Delays in custom flag attribution and challenges in managing custom flag exclusions can hinder the accuracy and efficiency of ad assignments. | **Implement a Custom Flag Change Detector and Improve Exclusion Mechanisms** | - **Implementation Risk:** Enhancing exclusion mechanisms may require significant codebase modifications.<br>- **Operational Risk:** Introducing new detectors might lead to unexpected behaviors if not thoroughly tested. | - **Action Points:**<br>1. **Custom Flag Change Detector:** Develop a system to detect and respond to changes in custom flags swiftly.<br>2. **Improve Exclusion Mechanisms:** Enhance the ergonomics of custom flag exclusion processes to streamline management and reduce delays. | - **Impact:** Improves the accuracy and efficiency of ad assignments by ensuring timely flag attribution and easier management of exclusions. |
| **Lack of Integration Between Clustering and Dimensionality Reduction**<br>Clustering based on auction co-participation is not fully integrated with dimensionality reduction based on customer traffic requests, leading to potential inefficiencies and missed insights. | **Use Estimator to Generate Features for an ML Clustering Classifier** | - **Research Risk:** Determining the optimal way to combine these data sources requires extensive experimentation.<br>- **Integration Risk:** Ensuring compatibility between different models and data sources may present technical challenges. | - **Action Point:** Leverage the estimator to create new features that integrate clustering and dimensionality reduction insights, enhancing the overall clustering model. | - **Impact:** Enhances the overall clustering model by integrating multiple data sources, leading to more comprehensive and accurate clustering results. |
| **High Development Efficiency Barrier with Current Digraph Algorithm**<br>The existing digraph algorithm used for clustering has a high development efficiency barrier and lacks support for node or edge features, limiting its flexibility and scalability. | **Explore Alternative Graph Partitioning Algorithms** | - **Research Time:** Identifying a suitable alternative may require significant time and resources.<br>- **Implementation Risk:** Integrating a new algorithm into the current system could introduce compatibility issues. | - **Action Point:** Investigate and evaluate different graph partitioning algorithms that offer better support for features and lower development barriers, potentially adopting or adapting an existing in-house tool. | - **Impact:** Improves development efficiency and scalability of the clustering process by adopting more flexible and feature-supportive graph partitioning algorithms. |
| **Complexity in Custom Flag Assignment**<br>Custom flags are assigned in complex methods within the `AsbqrtAdAssigner` class, making it difficult to trace and modify assignments. | **Simplify Custom Flag Assignment through Codemods** | - **Implementation Risk:** Codemods may introduce bugs if not carefully executed.<br>- **Maintenance Risk:** Automated changes could complicate future updates or integrations. | - **Action Point:** Implement codemods to streamline custom flag assignments, potentially automating exclusion processes and reducing manual intervention. | - **Impact:** Simplifies the custom flag assignment process, making it easier to manage and modify, thereby reducing complexity and potential errors. |


### Clustering Improvements
---


Note- proposed order of execution based on risks, dependencies, and potential impact.

Prerequisite:
Create metrics:
% of impressions / ads lost due to no-one asked for the ad
It seems it’s 0% over the period of 04.11-11.11, but may be much higher when people don’t have quotas/in periods of low seasonal demand.
% of impressions / ads lost due to delayed assignment
At the moment it-s 10-14%.
Number of adpublisher cycles before assignment
See histogram



- *See [histogram](https://fburl.com/unidash/qt22cgk9)*  
- 

| Problem | Lever | Risk | Details | Impact on Latency(if works) | Other benefits | Time Cost to Validate/implement(relative) | Proposed Order of Execution | Supply Gain potential  (in proportion of the total opportunity, basis 1.0) |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
|  **Assignment Delay for Newly Created Ads (Type A & B) Opportunity siz-13% platform MDE reduction (CS only)** | **A1: Fix the pre/[post-processor](https://docs.google.com/document/d/1KVVZluh5Yho4hY7-l39ZNatJOzIr6pn2EYKTWeTWDdw/edit#heading=h.15z6ghftijtt) gap \- implementation issue Short term** | Rollout risk, as it’s on the backend. | Fix the delay of 30 minutes, introduced by the fact part of the assignment algorithm runs in the post \-processor | **(XS-S**)   | **\-** | **S (?) 1-2 week (tbd [Divyanshu Bhartiya](mailto:divyanshub@fb.com))** | **1 (though I don’t know this code, should be the clearest thing to fix)** | **0.007-0.0125 total supply won \[%5-12.5% latency reduction\]- based on 10 hour avg or 4 hours avg** |
|  | **A2: Tricks \- Assign Ads that won’t be part of clusters Short term** |  **Correctness risk:** Some, but can mitigate via a prototype | On the backend, compute if ad will be assigned to **any** cluster, not a particular one. If not, assign normally, and bump probability for cluster assignment (tbd how to keep some ‘opportunity curve’ multiplier to control received size) | **(S in terms of traffic utilization) Non- cluster traffic**  is assigned with near-0 latency.(S in throughput, but key small experiments/users may be unblocked) | **\-** | **S-M 1 week to figure out algorithm/prototype and dry-test 2 weeks to implement/rollout** | **2**  | **0.014-0.042% total supply gain  0.1.5-0.3 (in theory should kill latency for everything but the cluster proportion of the traffic, but we had 16 clusters instead of 14 recently)** |
|  | **Increase Frequency of Incremental Pipeline Runs Short term** | \- **Auction Purity Risk:** Increased pipeline frequency might lead to further degradation- needs research. Might just be hitting the Cold Start Problem for new campaigns  **Resource Risk** DRICU+ | It is an interesting question why the purity is decreasing in the first place. [Living notes](#bookmark=id.fw3eqz3y24hc) on it. \- **Action Point:**  Adjust the `lookbackhours` parameter to reduce latency in ad assignment, ensuring quicker inclusion in experiments.  | (S-XL, depending on observed purity cost tradeoff), Reduces latency in ad assignment, allowing new ads to participate in experiments sooner, potentially improving experiment responsiveness and accuracy.  | – | S (2 weeks total) | **3 (the next ‘eng- only’ idea, will require some thinking how to setup the experiment and figure out the purity counterfactualy, but besides this ‘just run some pipelines’)** | Between 0 and 10.5% supply gain\[0-0.8\], average 0.15? Can be anything.  |
|  | **Increase adcandidate sampling data, especially for new Short term** |  **Resource Risk** DRICU+  |  |  |  | 2 weeks |  |  |
|  | **ML work start: port [brettdaley@meta.com](mailto:brettdaley@meta.com)’s ML Algorithm to the CSBQRT (18 cluster) case. Mid/Long term** |  |  | **(M-L) Baseline ML model; Enabler for tasks  Task:Predict cluster from targeting features only**  |  | **M4 weeks \- 2 for Resurrecting/understanding the algorithm, 2 for porting, evaluation; maybe 1 for figuring out acceptable clustering tradeoffs?** | **4** | **0.0-0.10.7% total supply gain 0.0-0.8 (??) From this point on it becomes very tricky, as we will observe prediction accuracy; Then we need to trade this off vs  estimated auction purity to find the optimal latency.** |
| **)** | **Use Estimator to Generate Features for an [ML Clustering Classifier](https://docs.google.com/document/u/0/d/18WDkgPxYUxHL4aSxCamBjPTOTJ1PbABM_MLk0wxgCNc/edit)** **Mid/Long term** | \- **Latency Risk:** We think the data needed is availablye very quickly(custom flags), but need to confirm. **Integration Risk:** Incorporating new features may necessitate significant changes to the existing ML pipeline.. | Clustering based on auction co-participation is similar to dimensionality reduction \- 'clustering based on customer traffic requests'. Combining these may improve performance of faster attribution models leading to potential inefficiencies and missed insights.  \- **Action Point:** Leverage the estimator to create new informative features for ML- based clustering. Notes [here](https://docs.google.com/document/d/1CGxBUoCRdRDOUJsG6L55l4rxS2OFOBR0y6zsZrc1O_Y/edit#bookmark=id.26in1rg), and [here](#heading=h.irq14zkj66fm). |  (M-L)Information about traffic selection features+targeting is available instantly, so if the same, latency drops to 0\. If similar, can improve latency depending on True positive/False Positive preference rates we can infer from purity considerations.  | (XL) Overlaps with the [**‘Stable Clusters’ idea**](https://docs.google.com/document/d/1JVp9l2Fn6kp2R3u5cJcdsdpuPW07mDeb3M2C3TvY60I/edit#bookmark=id.ebt3z62qg2x1)**,**  which can lead to **multi--week estimation, enabling users to plan ahead.** Relation with Dimensionlaity Reduction.  . Features can be used for exploratory clusters,  Overlaps with [CSBQRT Dimensionality Reduction- Technical Details](https://docs.google.com/document/d/1CGxBUoCRdRDOUJsG6L55l4rxS2OFOBR0y6zsZrc1O_Y/edit#bookmark=id.gjdgxs) Ideas. Lever for exploratory clustered cs budget abtest: [Ads Segmented Experimentation: H2 2024 Roadmap](https://docs.google.com/document/d/12BXlv6XbOR9zAEmhOrmAvL1s1gmBtM92MMDNXUf543Y/edit#heading=h.th8h5wytqc7q) | **S** 1 week for first version-  both data and code are available from previous steps/prior work.; Xx to iterate | 5 | 0.0-0.2 (cumulative w/ previous one) |
|   | **Utilize Pre-Extracted Features or Embeddings Mid/Long term** | . \- **Integration Risks:** Incorporating new features may necessitate significant changes to the existing ML pipeline. | Current ML based attempts to reduce cluster assignment latency relies primarily on basic targeting features, which may limit the performance of the ML pipeline.\- **Action Point:**  Search scuba and similar sources for some ads embeddings that are populated soon after a campaign spawns. Then integrate them. Pointer:https://fb.workplace.com/groups/559293094587077/permalink/1931092827407090/  | **L** Good chance to enhance ML- based cluster assignmént. [notes](#bookmark=id.jhx7l52m62i2). | **(L)In theory, similar to To the ones in ‘use estimator’ lever, but harder to use directly.**  | M-L ?? 2 weeks to integrate first version | 6 | 0.0-0.3 (cumulative with previous |
|   | **Explore Alternative Graph Partitioning Algorithms Mid/Long term** | \- **Research Time:** Identifying a suitable/better alternative may require significant time and resources. **Implementation Risk:** Integrating a new algorithm into the current system could introduce compatibility issues. | \- **Action Point:** Evaluate different graph learning/partitioning algorithms that offer better support for features and lower development barriers, potentially adopting or adapting an existing in-house tool.  | **better performance of incremental pipelines** (latency down, purity up) If the mini-clustering clustering can take into account additional features(e.g. targeting) to compensate for decreased \# of auctions to train on.  | **Lever for [Ads Segmented Experimentation: H2 2024 Roadmap](https://docs.google.com/document/d/12BXlv6XbOR9zAEmhOrmAvL1s1gmBtM92MMDNXUf543Y/edit#heading=h.th8h5wytqc7q)  Exploratory clustered csbqrt.**  | **L-XL3 week initial investigation, as can only reuse data from previous steps, not code.** | **7** |  |
|  |  |  |  |  |  | **18 weeks total** |  |  |
| **Delayed Custom Flag Attribution**   | **Implement a Custom Flag Change Detector** | ?? | \- **Action Point:** Develop and deploy a mechanism to detect changes in custom flags promptly to minimize attribution delays. | Indirect; it's a step to understand our traffic better (e.g. if people chanlge on purpose in key moments). |  |  |  |  |
| **Hard for customers to avoid traffic overlaps, even if they want to**  | **Implement a Custom Flag Change Detector and Improve Exclusion Mechanisms** | \- **Implementation Risk:** Enhancing exclusion mechanisms may require significant codebase modifications; but maybe lightweight design is possible.  | \- **Action Points:** **Design Custom flag Exclusion Mechanisms**: [Notes](#bookmark=id.vq5oyanyliq3) | \- **Impact:** Makes it easier for users to resolve conflicts without escalating to us. |  |  |  |  |
|  | **Handled in the MIP Model Via The 'y' variables** | Covered in [CSBQRT Scheduler Model Migration One-Pager](https://docs.google.com/document/u/0/d/11kMu0IPEZIIF7tjrZmPmEc4JiMsiwJKP10XGSN7WOps/edit) | \- **Action Points:** Do [Greedy vs Bin Packing Eval Proposal](https://docs.google.com/document/u/0/d/1BJ4nF19_p9cVetWi-sNA35t6FEbGDySJ6CJei1cVyZU/edit) To determine feasibility  |  10-15% increase in **\# 'not bad'** experiments admitted. |  |  |  |  |





# Framing as ML System Design Problem


## Problem Statement



## Problem exploration
The interviewer should be able to answer: Did candidates proactively explore the problem space, both product requirements and possible ML approaches?
What are signals and what are not: Does the candidate jump right into feature engineering right after hearing your question? Or the candidate tries to understand more context on business needs and 1) justifies business metric to target 2) explore ML approaches to maximize the goals? The focus should be on how to connect business needs to ML decisions and discussion on product features alone is not sufficient.
Per level guidance:
E4 PhD new grads will do simple exploration such as defining one ML task (e.g., predict clicks) before going straight into the solution with one approach they know about. E4 practitioners will often be more resourceful by connecting the problem to similar projects they have worked on.
E5 will identify success metrics (both business and ML) and define a relatively complete ML system often with multiple ML components/tasks (e.g., candidate selection + ranking for ranking, measurement + detection + enforcement for integrity). They can identify trade-offs with complex objectives. They can go much deeper into one or multiple of the tasks as needed.
E6, in addition to demonstrating the E5 traits, will explore product requirements to understand what characteristics of the ML system are most important. They know different approaches used in industry to solve this kind of problem, can compare them and propose most appropriate for this specific problem. They can call out caveats/risks in deriving a complex design.
 

 # Product requirements, goals and non-goals:

  not all  adunits need to be assigned right away. we cannot afford to gain certainty about which cluster things belong to.
  Cluster auction purity (and selection bias guardrails) should not decorate quickly.
  e want to have a off-line evolution framework, which can backfill some data and compute hypothetical characteristics on the basis of hypothetical adunits assignments to clusters.
### Bonus
  If we can get rid of the sharp corners around the clustering, that would help.
  If we can create closer around custom flux or otherwise exploratory clusters, that would help.





## (Training) data

Interviewer should be able to answer the question: If a candidate is given a task to train a model at FB, will they be able to identify a good way to collect training data?
What are signals and what are not: Do they proactively look at how to label the data? For example, collect explicit/implicit user feedback, use human raters, build active learning systems. Can they choose appropriate solutions for the given task and justify the decision? Do they consider the constraints/risks with proposed methods (in using human raters, do they consider labeling consistency; in using user clicks, do they consider position/existing-ranking bias)? Do they proactively think of cold-start or assume data already prepared like a Kaggle problem? 80/20 split for training data, while often given as an answer to training data questions, DOES NOT provide signal on training data, but can be discussed in the offline model evaluation section.
Per level guidance:
E4 can clearly identify the training data composition. For example, what should be the definition of positives and negatives for a classification task. They will at least propose one reliable way to collect training data (human raters or user engagements)
E5 will have a strong understanding of training data composition, and can provide trade-offs between different options. For example, provide trade-offs for using click vs comment as a positive event. They try to identify ways to use user engagement as training data and can handle standard data noise and/or cold-start problems.
E6 will proactively think about in-depth cold start problems in the business context and provides reasonable solutions for it. They can drive more advanced topics such as explore/exploit and active learning techniques, and proactively catch issues such as feedback loops that affect training data.
## Feature engineering
Interviewer should be able to answer the question: If a candidate is given a task to train a model at FB, will they be able to identify and design the most important ML features for the particular task?
What are signals and what are not: Almost every candidate will tell you that you need to use user demographics as a feature for almost every problem, so that doesn’t provide a lot of signal. Do they generate features as a list, or they have some structure in mind (user, content, user-actor features)? Do they try to identify what would be the most important features for this specific task, like breakdown of past interactions per user or user-suggestion, or only propose to use features that will work for any problem? Or their features don't align to an end-to-end solution, for example using features in logistic regression that needs complex pre-processing; or using high-dimensional categorical features with not enough training data or low model complexity.
Per level guidance:
E4 PhD new grads, typically without too much product experience, will produce more generic features but can explain how they would help the prediction and can develop richer features with discussion/guidance. E4 practitioners will be more resourceful in coming up with different types of features but may have limited depth in feature designs (e.g., sparse feature representations / going into details of sub feature models). Both archetypes will be able to represent the features as signals for the model, for dense and low density categorical features.
E5 will have better insight into what features are needed for the product asked and know a good set of common ML methods for feature representation. They know how to represent high dimensional features, like for computer vision, text embedding, sparse features, and can go deep in one or a few types of their expertise (their representation might not be optimal for every data type). For example: candidates with NLP background should be able to contrast TF/IDF with n-grams vs simple embeddings like word2vec vs complex models like BERT. Candidates with a general ranking background should be able to discuss much on different types of engagement history features.
E6 will be able to organize features well into categories and identify good features for each category specific to the product requirements/scenarios. They can discuss the tradeoffs of these features on the model evaluation and perf at training/inference, e.g. using lots of sparse features, different forms of sparse feature interaction, and using super large embeddings. They could go into depth for building complex submodels or scaling to very large feature systems. In some cases, they can proactively propose new product ideas that can lead to new feature signals.
## Modeling

Interviewer should be able to answer: Do they have enough knowledge and experience to identify the root cause and solve issues with model training?
What are signals and what are not: Can a candidate justify the decision to use a specific model (logistic regression, BDT, NN) or they propose to use a model they used on the previous project, or tell to try all and choose one that gives best performance? It’s fine for TC to know only about NN, and not be able to compare to other models. In this case they should be able to go into details of NN architecture, like do they think about 2 layers or 30 layers networks or ResNet, is it CNN or FC? How deep their knowledge is? Is their knowledge limited to knowing different functions to call in Keras and some metaparameters to tune? Or they know how regularization works, and how it affects the model when applied?
Per level guidance:
E4 new grad PhD will be able to go into details of their model of choice, including optimization and regularization, how it works and other details. E4 practitioners will be able to match their model choice with feature design but typically have limited depth on the modeling details. They will know the common parameters for sweeping but may not know in detail how the model is optimized with these parameters.
E5 will be able to justify their decision of the model based on latency, accuracy, data complexity. They either know multiple classical approaches and deep knowledge for one of them, or they know different architectures for NNs, and can go deep into details of layers, normalization/regularization methods, and loss functions.
E6 will cover E5 expectations, and also be able to identify good technical solutions to explore/exploit and cold start, or go into other advanced topics, like reinforcement learning, and semi-supervised learning
## Evaluation
E5 will know a good set of metrics relevant for this problem, and can justify the decision to choose one or a few over others. They should understand metric properties well and have rich experience with A/B tests, or can go very deep into properties of the metric of their choice. They should demonstrate experiences in monitoring and debugging online behaviours (e.g., post-launch performance variance, degradation specific to the problem setting, creation of alerts)
E6, in addition to E5 expectations, will have good knowledge of metrics used for this kind of problem in industry. They can propose good metrics to use in A/B tests, and proactively connect them to product/business goals. They know about potential A/B testing problems and how to deal with them (dilution, bias, feedback loops). They can design more advanced measurement strategies such as prevalence measurement, deletion test. They might know how to approach evaluation of recommender systems as contextual bandits to understand incremental value of recommendations and better account for feedback loops.
