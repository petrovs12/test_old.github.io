---
id: n31m04iiup3ihi8hw1w8wkw
title: Ads Assignment Latency Machine Learning Approach
desc: ""
updated: 1733824695899
created: 1733820350918
---

# ML System Design for CSBQRT Ad Assignment Latency Mitigation

## 1. Problem Exploration

**Business and Product Context:**  
The core product goal is to reduce the latency in assigning newly created ads to wxperimental clusters. Currently, new ads wait on average xx (18?) hours to gather auction data before being assigned to an experiment. This delay limits cold start experimentation and leads to overall to supply loss. Business success here is measured in terms of improving time-to-assign (enabling cold start experimentation with clusters- otherwise assignment by excluding them for clusters can be applied), increasing supply gain (ads participating sooner in experiments-> more impressions, assigned to a non-dummy csbqrt experiment), and maintaining or improving auction purity (i.e., the correct and stable assignment of ads to well-defined clusters).

**KeyRequirements Constraints:**  
- **Latency Reduction:** We want to classify or cluster ads into experimental groups quickly—ideally much sooner than the current xx-hour wait.
- **Maintain Experiment Quality via Auction Purity and Traffic Selection Bias:** Speeding up assignments should not degrade clustering quality, leading to higher impression shifts and loss of the 'launchability' property.
- **Handling Cold Start:** Newly created ads have no historical auction data. The system must make effective guesses without waiting, using other signals (e.g. ad-side data).
- **Risk: Long-Term Stability and Re-Training Over Time:** The system periodically reclusters. The stability properties of this reclustering are unknown. It's an instance of the 'optimal ML retraining problem'- how to balance system KPI's(auction purity) with operational costs and introduction of label instability, induced by the reclustering. Due to the specific  algorithm, used when we re-cluster, there are intuitive reasons to believe the new (mini)clusters are similar to a permutation of the old clusters. If this is the case, this could make many parts of the system, simpler and easier to work with and more sensible- nice understand work item here. It also affects the scheduler and other experiment types a lot.


- **Risk: Incremental clustering properties are unknown** 

  - sability of the incremental request is another unknown- how different would the incremental assignment be as a function of incremental training? Why do we have indications that the incremental requesting somehow changes the decision rule of the assignment (brett's claim). The current 4 hour tradeoff was based on some heuristics, but I don't know of a comprehensive tradeoff investigation for this.  
  - The trade-off between frequency of incremental pipeline runs and auction purity degradation is unclear.  
  - The cold start problem for new ads may be linked to the decline in auction purity over time.  

**High-Level ML Approaches Considered:**
1. **Pure Auction-Based Clustering (Status Quo):**  
   Wait for auction outcomes and cluster ads based solely on co-participation. 
   [**Risk/Unknown]:Additional further limitations, the digraph algorithm used only returns final labels at the moment.  if we also return some intermediate characteristics, such as the probability distributions of cluster assignments, centroids,  and other  intermediate results of this bipartite reclustering calculation, we can this data could be used downstream to find a similarity between new ads and existing clusters.

2. **Feature-Rich ML Classification Models:**  
   Incorporate pre-extracted embeddings, ad targeting features, and historical traffic demand (ad-experiment eligibility matrix) signals to predict cluster membership for a new ad with minimal waiting.
   Balance the decision rules, based on the distribution of the predicted cluster - if no clear winner, wait for more data/fall back to the current bipartite algorithm.
   In terms of modelling, can use nearest neighborhood search, or Logistic regression variation. Brett used a shallow NN (2 layer) with sigmoid at the back for logistic regression.

3. **Approximate Nearest Neighbor (ANN) Search in Embedding Space:**  
   Use representation of the new ads in a feature space using existing embeddings (computed when adpub or even adindexer runs) and find “nearest” known clusters in that embedding space.
   The embedding space may be a concatination of:
    - targeting features
    - Traffic characteristics wrt csbqrt demand (i.e. which experiments in the last 6 months are eligible for this ad)? is this vector similar to a particular cluster?
    - adunit embeddings from adpub/adfinder/adindexer.


**Trade-Off Analysis:**
- Reducing wait time might affect auction purity if we rely on partial signals. A balance is needed between early assignment accuracy and resource costs (e.g., more frequent incremental updates).
- Embeddings and richer features can improve early predictions but introduce complexity in integration and maintenance.
- Deploying advanced ML methods (NNs, graph-based partitioning) could yield significant latency improvements, but requires proof of concept research, and then careful evaluation of complexity, resource overhead, and stability under reclustering.

---

## 2. Training Data
 Ideas on getting more relable labels:

 Can run digraph training on only ads, which have spend >xx% (30%? of their budget already) to determine auction co-participation clusters - these labels may be higher quality?

Can do one parallel single reclustering, then modify the incremental pipeline to only take 'mature' adunits- perhaps this way the labels will be higher quality.

 Remove 'balancing' partitioning part from the incremental pipeline - if needed, can split downstream.

 Use elbow (or another) method to determine best number of clusters?
  

---

## 3. Feature Engineering

**Feature Categories:**
1. **Ad-Level Features:**  
   - **Targeting Metadata (e.g., demographic constraints, placement targeting)**
   - **L4 embedding?** Precomputed embeddings of advertisers or campaigns that characterize their historical performance and audience.
   - **Creative and Content embeddings (?):** maybe an embedding for the creatives is available somewhere? 
   - **Time Since Creation / Cold Start Indicators:** Features that indicate how fresh the ad is, i.e. how stable the auction distribution it has is likely to be- maybe weight these higher.
   The complexity: find them?
   
2. **Historical Performance and Similarity Features:**  
   - **Nearest-Neighbor Advertiser Similarities:** Embeddings from known retrieval systems (e.g., from broader Meta ad retrieval pipeline) to find closest campaigns historically assigned to stable clusters.
   - **Latent Dimensionality Reduction:** Apply PCA or learned embeddings from incremental pipelines over months to represent ads in a stable cluster space, reducing reliance on short-term auction data.

3. **CSBQRT Traffic Demand Features:**  
   - **Estimated Traffic Overlaps:** Predicted intersection of this ad’s targeting with past experiments, derived from stable historical embeddings of experiment-level traffic requests.  
   - **available** in cs_bqrt_estimator_eligibility_results - like tables
   - **Check correspondance of traffic demand asks and ad embeddings** -if there is some 'simultaneous diagonálizatin' of the two, the door for 'pure-ish clusters around custom flags'is open.

**Q:** Why not use pre-existing advertiser unit embeddings for bin packing?
**A:** Need non-negative and ideally volume preserving embeddings for bin packing- no such requirement for assignment (distance/dot product is fine).

---

## 4. Modeling

**Model Choice Justification:**

**Candidate Models:**

1. **Embedding->dot product with cluster embedding**  
   - needs quick embedding of the ad
   - probably infra readily available (do it by hand, but also laser knnn, faiss, alacorn, etc can find similar ads based on the embeddings and check their clusters)
   - if we want to use traffic requirement embedding, have to do it ourselves 
   - naive assignment idea: in adpub, do embedding, dot product w/ current cluster embeddings, if one dominates, assign; add some 'calibration' weights to preserve cluster volumes
   - Can do variations of this using any combination of features- ad embeddings, ad-csbqrt traffic ask embedding, pure targeting features; in latter case may need some 'metric learning' module somewhere.
2. **Shallow Neural Networks or Gradient-Boosted Decision Trees:**  
   - Easy to implement, handle mixed feature sets, and fast training.  
   - With careful regularization and engineered embeddings, can achieve good initial accuracy.
    - Brett used a shallow NN with sigmoid at the back for logistic regression.
    works with all features above; labels are crucial though; 
3. **Ditch Digraph and go for Graph Neural Networks (GNNs) or somethign that can take node features:**  
   - If fully integrated, GNNs could use node/edge features from the auction graph plus external embeddings.  
   - More complex and resource-intensive but might provide the best long-term synergy between auction data, node features, and cluster assignments.
   - **Filament2** is a similar solution in spirit, but not sure if pure adunit-side stuff is available there. Maybe a combined approach? 
---

## 5. Evaluation

Need to setup a nice evaluation framework to compare how changes to the model affect the latency, auction purity, and traffic selection bias. May want to do it in conjunction with checking stability. 1-2 month eng project?
**Semi-Online Metrics:**
- **Clustering Accuracy and Purity:** How often do we predict the correct final cluster assignment for an ad well before the 4-hour window elapses?
- **Latency Reduction:** Measure the percentage of ads assigned in under X minutes and correlate with business impact (faster experiment inclusion).
- **Stability Metrics:** Track consistency of cluster assignments over reclustering cycles. Evaluate how stable predictions are over several weeks.

**Online (A/B) Metrics:**
- **Experiment Responsiveness:** Time-to-first-inclusion in experiments. This ties directly to the product goal: faster ramp-up for new ads.
- **Auction Purity / Conversion Proxy Metrics:** Does assigning ads earlier degrade the quality of the experiment outcomes or user experience? Use CTR or downstream conversion metrics to ensure no purity loss.
- **Supply Gain or Incremental Revenue:** Evaluate how many additional impressions/auctions are effectively included due to earlier assignment.


---
