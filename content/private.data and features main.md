---
id: lpx4buusod8pp0nqg6ijwl9
title: Data and Features Main
desc: ""
updated: 1733608651142
created: 1733608641457
---

Ads Data & Features Whitepaper

This document provides principles and best practices for collecting valuable data and organizing it in a way that’s friendly to feature processing in a privacy conscious manner. Additionally, it lays down the principles on how we should collect and process our data while adhering to best practices to ensure expressiveness, timeliness, and ease of use.


Abstract
This technical white paper aims to set the foundational 2 year strategy for the data and features for the Facebook ads. It is updated at least every 6 months to stay up to date to the current academic and industrial landscape. Additionally, it is updated according to the findings of the latest production applications. This paper serves three goals:
It lays the principles of how we process and manage data within ads ranking. 
It sets the basis for investments from multiple teams in ads including personalization, ads infra, and signals and influences their 2 year roadmaps. 
It helps us maintain a continuum in our roadmaps. Since many of the problems discussed here span multiple halves, this document serves as a northstar guiding our investments and trade-offs.

























Table of Contents
Abstract	2
Table of Contents	3
Motivation	5
Notation	5
Guiding Principles	6
Document Structure	7
Raw Data Collection	7
Types of data	7
Onsite and offsite user data	7
Advertiser data	8
External data	10
Human annotated data	11
Data Health	12
Out of scope	12
Storage	13
Discovery	13
Feature SLAs	13
Access patterns	14
Training Data Storage	15
Schema	15
Out of Scope	16
Value and Cost	16
Definitions	16
Value and cost of new data sources	17
Value and cost of new features from existing data sources	19
Value and cost of existing features / existing data sources	20
Value in retrieval	22
Value and cost of training data	23
Learning Representations	23
Discussion	23
Current state	27
Ideal State	28
Standardized feature engineering techniques	29
Mapping to a taxonomy	30
Entity and attributes extraction	30
Knowledge graph	31
Trust, sentiment and quality	32
Content descriptors	33
Verticalization	33
End-to-end feature learning	33
Leveraging more types of events as supervision	34
Feature Processing Infrastructure	34
Ads data processing	35
Key numbers	35
Current state	35
Ideal future state	36
User data processing	36
Key numbers	36
Current state	36
Ideal future state	37
Backfill	39
Current state	40
Ideal future state	40
Training Data Processing Infrastructure	40
Desired Properties of Training Data Platform	40
Current State	41
Ideal State	42
Feature Management	43
Current State	43
Ideal State	44














Motivation
Our ads delivery system relies heavily on machine learning.  As the system matures, the gains we get from each individual launch is decreasing as we harvest gains from all the low hanging fruit.

As the saying goes - our models are only as powerful as the signals they consume and the quality of the labels they are trained on. Thus, in order to re-accelerate growth in ads, we need to improve our feature engineering and serving capabilities. This will ensure that we are utilizing our signals to their full potential, and prevent regressions before they happen. Additionally, we need to develop tools and processes to manage and value our signal sources to cope with the dynamic technological, product and legal landscape.
Notation
Since “data”, “features” and “signals” are overloaded terms we will use the following definitions to avoid confusion. In this document, “data” refers to raw inputs to our system, e.g. web-pages, ad content etc. “Features” refers to processed data, while “signals” are an amalgamation of the two.
Guiding Principles
The writing of this document is guided by the following six principles. We hope these principles can provide clear directional guidance, yet are not too prescriptive. It’s also our endeavor that listing these principles can facilitate meaningful directional debates and inspire people.

More data helps. This is one of the most basic principles of ML that has been proven to be correct in various domains and has powered advances within and outside Facebook. Our competitors also understand the essence of this principle and have invested heavily in building their own data moats such as map data, SSO across apps etc. Finally, this principle has become even more relevant with the spectre of signal loss goading us to reassess our sources of information.
Understand the quality and deficiencies of your data. As the saying goes - your model is as good as the data it trains on. Thus, it is imperative that we build tools to gain visibility into the quality of our data, monitor regressions and strive to improve its quality wherever possible. 
Evaluate the costs as well benefits of new data. In spirit, this principle is the counterbalance to [P1].  We should carefully consider the cost versus value trade-off of adding new data. Here, the definition of value can be broad, for example offline model training metrics (like NE) or online metrics (e.g. ads score) at global level or segment level. Cost here includes collection cost, processing latency cost, processing computation cost, storage cost, etc. Since machine learning is the high interest credit card of technical debt [link], we should periodically reevaluate our choices and stress test our data dependencies. 
Build flexible frameworks to store and process data. Build flexible frameworks to store and process data. Our feature processing framework and storage layer should provide an expressive language for ML engineers to express and test their ideas. In addition data should be collected, processed and stored in a privacy compliant way, allowing us to react to changing user preferences (e.g. as point deletions) and regulatory landscape.
Sooner is better than later.  Feature processing should allow us to have feature latency of seconds / minutes after a relevant event.
Carefully curate the feature space. The final principle goes hand-in-hand with [P4] and addresses the long term health of our feature set. It advocates building systems and processes to manage our features, infrastructure footprint and respond nimbly to the ever-changing regulatory landscape.
While we believe that these principles can guide us in the right direction, we caution the reader against considering them as rigid dogmas or from applying them in isolation.
Document Structure
This document has 2 parts. The first part deals with raw data. This includes
Aggregating data from various onsite and offsite sources. [Link]
Data storage for easy access during training and inference. [Link]
Value estimation for current and potential data sources. [Link]

The second part encompasses myriad components needed of data processing such as
Modeling techniques to generate features [Link]
Infrastructure for processing user and ad side features [Link]
Infrastructure for creating and storing the training datasets containing features [Link]

We have built two additional abstractions that can aid navigation. The project view and executive summary extracts actionable recommendations from the paper into a list of prioritized projects that will be used to guide our future investments. Furthermore, we have prepared an infrastructure view that focuses on infra investments.
Raw Data Collection
Data pillar covers all raw data acquired through onsite and offsite events across products, human annotations or through web crawlers. This includes user data, advertiser data as well as data from external sources. We also discuss freshness and continuity, storage, retention, deletion policies and organization of data based on access patterns.
Types of data
In this section we study data sources based on their origin, i.e., internal user data, advertiser data, external data and human annotations. We acknowledge that there are other ways to partition this data, e.g., based on context, freshness.
Onsite and offsite user data
Key Numbers
The following table provides a list of user-side data sources. Refer here and here for a more detailed view with statistics produced by the Signals team.

Ads
Catalog
IG business posts
Pixels
Search queries
FB business posts
FB pages
Marketplace products
Events
IG profiles
Groups
Video
App events
In app browser
Hashtags
Mobile apps
Saved events
Organic posts
Location data
Offline conversion / store events
Server-to-server events


Current State. There are large gaps in our picture of user data. For example, most of our user features [link] are derived from 4 data sources - pages, pixels, ads, apps. Thus, we are over-reliant on OBA data which faces headwinds from signal loss [link]

Ideal State We should establish an inventory of all data sources which tracks the ranking usage and processing techniques of each data source.  For data sources that are not yet studied, we should onboard and standardize the most important data sources onto delivery infrastructure to unlock opportunities for feature engineering.  The onboarding process should be guided by data value prediction.  We defer the discussion on prioritization and measuring value to the value of new data sources section later in this doc.

With the increasing risk of losing offsite data sources, we should gradually reduce the dependency on offsite data sources, and invest more on onsite ones.  There is a lot of untapped onsite data scattered across users’ interactions with groups, marketplace, events etc. This may produce compounded returns as we build a complete picture of our users by aggregating data from different sources. 
Advertiser data
Key Numbers 
On any given day we have ~3.5M active accounts running ~15M campaigns with ~25M ad IDs, leading to ~17.5M landing pages. Interestingly, the ads in our system have a very short half-life, i.e., 20% of ad IDs active on a given day are not active the following day and 36% of ad IDs active on a given day are not active 2 days later.

Current State There are multiple sources of ad data that can be grouped as follows
Visual signals such as 
Creative image
Video thumbnail
Video creative
Story creative
Landing page screenshot
Textual signals which include
Creative text
Crawled landing page
Comments on the ad
Information about the entity running the ad such as
Advertiser information
FBPage promoting the ad
Information about the campaign and account
Performance data
Counters and ratios derived from user interactions with ads.
Raw ad ids, accounts, campaigns that users have interacted with
Advertiser supplied data
Targeting criteria specified by advertisers provide value insights about their domain knowledge.  Currently we have simple ad-side features which represent high-level advertiser targeting criteria like “is targeting age”, “is targeting custom audience”, etc.  We should learn from advertiser targeting criteria in finer granularity.  Features that are useful for targeting are generally also useful for ranking.  There’s already efforts in place to reach out to advertisers [link]. On the other hand, there have been discussions about the potential risk of gaming the ranking system by influencing ranking from targeting, which is a factor to be aware of when exploring targeting criteria as ranking features.
Besides targeting criteria, pixels and mobile app events are other examples of advertiser supplied data.  They are typically considered as user-side data, but even if offsite events are anonymized, the metadata associated with those events provide valuable ad-side information, for example pixel title / description, product catalog, travel destination specs, etc.  
CRM data, or other types of advertiser-side transaction data, is another area that we haven’t explored yet.  Advertiser’s CRM data organize advertisers’ knowledge and facts, including the type of business, organic engagements and transactions happening on the advertiser side. They allow ads ranking systems to gain more domain knowledge about advertisers. In offline conversion project, there was an initiative to encourage advertisers uploading more CRM data to Facebook, but the initiative has not been executed yet.  To attract advertisers to provide CRM data, we will need a framework to consume CRM data (even at low volume) and demonstrate the performance gains to advertisers, e.g. individual-advertiser-level submodeling.  Externally, some big advertisers (like Walmart) have been providing CRM data to Google to boost their ad performance on Google.
Most of the raw content associated with ads is already available in Ads Deep Understanding Service (ADU) along with derived signals (e.g. optical character recognition for ads’ images) produced by the business integrity team. There are a few notable exceptions such as stories, video content, transcriptions of videos etc. though there are no technical blockers towards onboarding them.

Ideal State In order to build a holistic view of all ad side data we need to aggregate detailed information about the entity that is promoting an ad. Towards this end, we need to develop a directory of information about our advertisers such as their location, nature of business, trustworthiness etc. In an ideal state, this line of work will culminate in a business graph that can be used for ranking and product applications.  We should also provide advertisers ways to share their domain knowledge in addition to targeting and metadata in offsite events.
External data
This area covers data that is external to our family of apps like web data (e.g. wikipedia, web crawl), location-based signals such as weather outlook, temperature, precipitation etc.

Current State There are 3 web crawlers at Facebook
Integrity crawler: Used by the business integrity
Share scraper: This is triggered to generate previews for shared content. 
Product Intel crawler or theFind crawler: No longer supported
Ads ranking also has a crawling infra that is based on the integrity crawler [link] that executes the smart pixel extraction javascript on all crawled pages. This crawler has a capacity to crawl ~100M pages/day and it uses url normalization to dedupe crawled urls.

Wikipedia and wikidata [link] are a rich source of human curated facts. This data is currently downloaded and sanitized by the knowledge graph team [link]. Additionally, this team also aggregates entities from other external data sources like movie catalogs resulting in an entity database [link]  of ~120M named entities.

Location-based signals also constitute an important external data source that includes the state of a specific geographic region (granularity level is flexible, e.g. geo tile, zip code, city, state, country, etc.) over a specific time window (past, present, or prediction for future). The data can be related to human behavior [link] (e.g. popular products in a region, trending twitter hashtags, stock market trends, etc.) or environmental [link][link] (e.g. temperature, weather outlook, precipitation status, natural disaster, etc.)

Ideal state We need to be able to take advantage of the rich information on the web in the form of anchors which provides information about a page that is not under the control of the author of the page in a very succinct form. For this we would need to grow our crawling capacity by at least one order of magnitude. Interestingly, previous efforts to use crawled data to augment pixels have shown positive results which further supports this direction [link].

We also need to build ads specific knowledge bases to augment the ones built by the knowledge graph team. This is because we need to build an understanding of non-standard entities like cars and product names which are beyond the purview of wikipedia based entity lists.
Human annotated data
Human annotations are another valuable data source that is generated by asking experts to generate labels such as classifying a document to a taxonomy node, detecting the language of a document, identifying entities, sentiment analysis, etc.

The benefit of human annotations is two fold. First, it allows us to abstract out the task of classifying a piece of content into a label in an independent model that is grounded in human annotations.  By using the output of these models as input to other models, we reduce the amount of information the subsequent model needs to capture. Second, it effectively adds more supervision into the subsequent model through it’s input features. This is an effective technique to increase the amount of supervision provided to an ML model.

An increasing number of teams across Facebook are investing heavily to efficiently generate large scale human annotated data. An overview of the current Facebook and industry labeling ecosystem is available at [link]. Across FB these efforts generate over 1.5B+ labels per year using an equivalent of 37K FTEs of effort. Ads ranking is a relatively new entrant and generates 10M+ labels a year at ~40c/task. This requires in-house investment to maintain our own human eval platform [link] to efficiently collect labels whilst ensuring desired quality.


Ideal State. We also need to build the right platform to efficiently generate custom model training data with the right user data/privacy protections built directly into the system. We also need to improve our efficiency of driving platform KPIs that represent the maturity of our evaluation platform towards optimizing for our labeling needs [link]. We should aim to build a platform that can seamlessly combine ‘at home’ raters for labeling non-sensitive data at low cost, and also support utilizing contracted employees for sensitive data like advertiser information.
Data Health
In our ML systems, we need to monitor continuity of our data streams in terms of volume and also detect sudden distribution shifts as they may indicate broken system components. In such cases we need to be able to react in a timely manner to identify the source of the problem, quarantine problematic data so that online training models do not get damaged (e.g. have severe calibration issues), and if the models do indeed get damaged we should be able to revert to a healthy and recent snapshot.

Current State Many of our V0 models are not retrainable as-is due to missing features, meaning that the features used by the model were discontinued one way or another while the model was actively deployed.  Unless the features are intentionally discontinued and experimented with, we have no way to verify the impact of feature loss in a running model.  This status quo should be unacceptable to all of us.

There are some basic tracking metrics [link] for feature coverage and value (e.g. mean of dense features). Unfortunately, these are not actionable since they lack source information.

Ideal State All production features should be monitored for data loss. There should be safeguards against removing features from code that are being actively used. If data loss indeed happens, owners of models that use such features should be alerted. Training should potentially be paused until the cause of the data loss can be mitigated. Features that are scheduled to be deprecated should be prevented from being included in new models. A special case of data health is freshness. For time sensitive features such as the number of ads clicked in the last hour, we need to also monitor for the freshness of data they use.
Out of scope
We omit discussion on data loss and refer interested readers to Damien’s excellent summary [link] of its impact and planned mitigation efforts.
Storage
Discovery
Discovery refers to our ability to find existing signals we’d like to use for modeling or product features.

Current State.  We maintain a list of features in feature metadata with basic stats about features and their usage. However, this data lacks key attributes like descriptions, code-pointers etc. Metadata UI only lets us search by feature ID or match feature names, not descriptions. When we have in the order of thousand engineers working on ML systems, it is imperative that we document all the features, as the naming of features might not be self explanatory. 

Ideal State. We would like to have a repository of well annotated feature metadata that is easily searchable. Additionally, we need to track the lineage of features, to build a complete understanding of how data flows through our system. It should contain information about feature status, start date and end date (if applicable), coverage, outage information. Most of these requests fall within the purview of the signal lineage project [link] and should be prioritized to aid dev-efficiency.
Feature SLAs
When we decide to use any feature in a production model, we need to know what SLA that feature provides in terms of freshness, coverage, immutability or expected change rate (e.g. live taxonomies), deprecation schedule as well as the SLA of its dependencies.  These will guide the model owner in making informed decisions depending on their own goals.  It is also very important for the model owners to know how long each feature will continue to be supported / produced / kept up-to-date once a deprecation warning has been given. This duration needs to be larger than a typical model launch cycle.  Both model owners and feature producers need to agree on this. 

Current State. We maintain model-to-feature dependency in feature metadata.  We do not make any guarantees about how long a feature will be available. We have many production models that simply cannot be retrained as is due to hard deprecated or otherwise unavailable features.

Ideal State. We’d like to have SLAs attached to each feature so that model owner knows what they’re signing up for by including that feature in a model.  We do not want to impose additional burden on producers of features by having them maintain many versions of their feature just because it’s difficult to have model owners switch to a new version of the same feature. There needs to be an agreement between producers and consumers of features. Features should also declare their freshness and coverage properties and if they expect these to change in a live setting.
Access patterns
Another grouping of training examples is by user.  When we’d like to build user representations or simply extract user features based on user’s prior activity, it is quite beneficial to have the ability to access all examples from the same user in chronological order. Our ML training data is somewhat chronologically ordered at an event level which is not conducive to extracting user features.

Current State. When we extract user features that are based on 90-day time window, we run a dataswarm job that goes through each day of data, re-keys the data by user id and any other information we need to materialize the feature and then joins these 90-days worth of data on user ID. Once the joined data is materialized we compute our feature.  Next day, we do this all over again.  Furthermore, due to the heavy downsampling, we typically have less than 10% of examples users ever saw. The reason we downsample so much is because we log all the 1000s of features for each example. However, to extract new features, we do not need the vast majority of the features we currently log per example.  For example, if we’d like to compute “# of impressions from advertiser X in the last N days”, we only need to keep track of advertiser id and timestamp for each impression user ever saw.  We should easily be able to store these without any downsampling as we’d store many fewer bytes per example.

Current GFF master table is an event store, not keyed by user id.  It’s partitioned across day and hour slices.  Materializing a single user’s history is not a cheap operation in this storage scheme.  Furthermore, due to the immutability of hive tables, it is not easy to add features retroactively (a.k.a. backfill).  Currently, we resort to generating many side tables that need to be joined for adding new features. Using features from side-table for experimentation necessitates a discrepancy between experimental code and production code working from the main training table, thus creating a surface for inconsistencies. Streaming version of the GFF master table also creates separate codepaths for generating the same feature from streaming data source vs batch data source.

Ideal State. We should have a central user data vault for user activities keyed by user id that supports incremental updates, low latency fetches of data for a single user for serving, range queries along user and time axes, and appropriate subset operations on the variety of data we store depending on product needs (as opposed to “all-or-nothing”). 

We should build proper ACLs and APIs for this repository.  We should be able to access this data store without impacting production, meaning we should have an instance of this for feature extraction that is not used by production.

Training Data Storage

Current state. In our current ML training infra, we can characterize the mapping between models and training data as a 1-to-N relationship. Each model typically has its own copy of the training data, constructed according to its specific needs which we call pipelines. Beyond the prod training data pipeline, a model may associate with other (N-1) versions for experimentation. Ads training data currently takes up about 430 PiB [link]. The duplication factor is about 5X right now with data sharing majority of features with varying labeling settings. 
This duplication buys us fast, sequential reads of materialized sets of training examples in our ML training jobs. But this comes with increased storage and management costs. Experimenting with new pipelines is non-trivial as it has to be materialized first. Compliance (event deletions, feature deletions, etc) becomes an additional burden where each compliance work item needs to be replicated across all the pipelines big and small. Plus, we have to verify that each pipeline implemented the solutions correctly and avoided any pitfalls.

Ideal state. In an ideal scenario, we would like to build a solution to flexibly balance pre-materializing data in storage and computing the training data at training runtime. This solution will enable predicate-based transformation on a single copy of master training data.  The master training data will store all features in a native column-oriented database that can be fetched easily and used in lambda-style transform predicates. The implementation of a new training dataset becomes a matter of writing waterfall of lambda-style transform predicates. The underlying infra will intelligently optimize a balance among data storage, training compute, and network cost, based on a global view on all training jobs’ data needs. 

Compliance solutions can be implemented only once internally of the training data solution (more specifically at the optimization layer). The system will ensure all training data needs are correctly accessed by the training jobs with the corresponding policy. 
Schema
Schema refers to the organization of the training examples and representation of the relationships between them.

Current State Our training tables have a flat schema where each row is a training example and we don’t keep track of any relationships between examples.  Due to our aggressive downsampling, we typically log less than two examples per request on average.

Ideal State   One relevant relationship between examples is if they were presented to the users for the same request. This can benefit some efforts like “learn-to-rank” on the slate of impressions presented to a user and possibly extract set based features (e.g. the category of the preceding post is “apparel”). If we are to invest in set based ranking as opposed to pointwise ranking, we need to develop mechanisms that allow us to generate set based features for model training and have the data to operate on to begin with.
Out of Scope
We omit discussion on data retention, deletion and privacy and point interested readers to the F3 white-paper for details on this topic.
Value and Cost

Understanding the value and cost of data & features is critical for Facebook to make strategic decisions on what data to protect, grow and deprecate from the feature perspective, and also important for both engineers to prioritize the data sources for exploration and technique innovation and iteration. 

In this section, we discuss the approaches to assess the value and cost of a data source and/or a group of features, in both ranking and retrieval.
Definitions
The value of data and features may vary under different scenarios. For example, data that currently has no value doesn't mean that it won't have value in the future after it grows to a certain amount. Another example is that the feature shows no value globally doesn't mean that it cannot help improve its relevant segments. To capture all types of the value for Ads data and features, here, we are defining the value as follows: 
Current Value: The current value that the data & feature is able to introduce.
Potential Value: The potential value that the data & features is able to introduce on its own segments. The segments can be further extended to its own active user segments, relevant segments etc. This value is aimed to estimate the potential of the data sources to guide the data growth.
Resilience Value: The potential resilience value to mitigate signal loss. e.g. OBA opt-out segment.
Infra Cost: The infra cost of data sources and features includes storage cost, computational and pre-processing costs.  It is important to always consider infra cost when evaluating the value of data & features.
In the long feature value realization process, different methodologies can be used to evaluate these types of values in the following stages:
Raw data sources
Offline experiment on newly generated features
Feature in production
Though the final value of the data and features in production is quantified by Ads Score/Value, we can measure the value at each stage with intermediate metrics, e.g. calibration, offline NE and O2O metrics.  We will dive into the three stages in sections below.

Current State: For the three types of value above, we are currently formulating the guidance of methodologies for each stage [link]. Most of the methodologies can be applied on any set of features. To simplify some of evaluation methodologies, we also explored better engineering solutions, e.g. adding the OBA opt-out breakdown in the QRT visualizer, writing an offline potential value evaluation on the active user segment for certain data sources, building reusable current value evaluation solutions on Bento and/or Kong platform. 

We lack visibility into the infra cost of data and features.  The problem is being tackled with a system, Monocle [link, link], which is in early development, and designed to measure and track the end-to-end infra cost of all ML artifacts including training data storage cost, feature storage cost, model training computation cost, Feature generation computation cost, etc.
 
Ideal State: Though the three types of value have captured the major aspects of the data/features, we should establish an even more complete view of the value for the data/features to capture their potential from different aspects. One example is the resilience value which can be further refined based on different offsite signal loss scenarios.  
On the infra side, we should have a more automated process to evaluate different types of value for each stage. Depending on which stage the feature engineering effort is at, the corresponding solution should be easily plugged in with minimal customization effort to evaluate the value. 
Specifically on the data source level, if we can establish the regular evaluation on the realized value from the data sources, it will be helpful to understand how data evolvement affects the feature value along the time, hence guide better decisions on how Facebook should grow their data sources. 
Value and cost of new data sources
Current state. We need to estimate the value of a given data source when prioritizing new onsite data sources. We will focus on estimating the predictive power of features since we don't have a foolproof solution to measure their incremental value. A potential solution is to associate newer data sources to existing ones to get a sense of their value. This would be challenging for entirely new sources like groups, for which we lack analogous counterparts in delivery.  

As an example, by mapping a piece of content from any data sources to MegaTaxon taxonomies, we could marginalize the impact of feature engineering using a zero-shot megaTaxon model to measure the predictive power of a new data source in explaining organic conversions at a category level [link]. The following plot generated by this method shows the trade-off between the MAPs for some data sources, and their ability to forecast users’ offsite behavior.


For new sources, if one is willing to create some elementary features, a plausible solution would be to pipe these features to a few important models and assess the incremental ad score.  For example, in this study, we extracted primitive factors (tokens, event types, event time, domains, brands, MegaTaxon categories, phrases, etc) from each data source (page and pixel engagements), tested the primitive factors on a TUM style model, and relied on NE improvement of the TUM model to estimate the value of the data source.

Additionally, one can also plot feature breakdowns against prediction error instead of the label itself. This would get to the incremental benefit of using the new feature as a unary feature in the model. If we take it even a step further, we can try to model the residual error with few new features with some existing ones to capture the possible interactions as well. Both of these measurements can be easily performed using the miscalibration and residual learning frameworks developed by ads personalization team. However the main drawback of this approach is that our ability to measure potential modeling accuracy improvements from new features depends on our ability to augment our training data with a series of test features and build models using them. Thus, these methods are adequate for feature engineering but insufficient to assess the value of a data source since they conflate the strength of the signal with the quality/effort that went into feature engineering.  Another drawback specifically associated with miscalibration analysis is that it usually requires matching with an existing feature (e.g. miscalibration analysis on a “user engaged brands” feature requires matching with an ad-side brand feature), which introduces a series of challenges, like hard to do miscalibration analysis for one-sided features (e.g. users’ recently engaged groups, which doesn’t have an ad-side match), large number of possible matching configurations (e.g. matching results can be binary, count, recency, scores, etc).

Ideal state. We need to develop better tools to estimate the incremental value of data. This is a notoriously hard problem that is ripe for an ingenious solution.  In our view, since there are a small number of (~20) data sources, most of our effort should be focused on extracting value from them after we have developed a reasonable (not necessarily perfect) ordering of their importance.

Estimating the incremental value of data sources can be considered as a multistage process: First stage can be simple statistics like coverage or richness of the data; second stage may be some analyses like the one mentioned above or calibration analysis, to roughly sort the data sources for prioritization for onboarding onto our feature processing infrastructure; third stage may include applying some standard processing techniques to extract basic features from the data source (e.g. id, token and phrase representations).  Ideally the whole multistage process should be automated under a flexible and scalable framework. 

The infra cost of new data sources is relatively straightforward: it can be easily estimated from data volume.  The infra cost is another factor that needs to be considered when deciding the next data source to import to feature processing platform. 
Value and cost of new features from existing data sources
Current state. During the development of new features using existing data sources, it is important to quickly estimate the usefulness of the new features, so that feature developers can interactively iterate on the feature engineering techniques, and have confidence that the new features are adding incremental value.  To estimate the usefulness of new features (i.e. feature verification), besides the straightforward approach of injecting features and then training models with new features, there are cheaper approaches like calibration analysis [link], residual modeling [link], and analyzing feature importance.

On the implementation side, we’ve formulated an e2e feature engineering playbook [link]. This playbook is aimed to onboard non-ads engineers to ads feature engineering processes so that they can evaluate the value of their data sources without having deep knowledge of the ads world. This playbook will be migrated to F3 after F3 becomes more mature and has more rich feature representations for adoption. 

On the flip side, when it comes to accounting for the infra costs of features, our current view is quite superficial. For example, the feature cost tool [link] provides storage cost estimates in AdLogger for features already in production. We currently do not track the cost in intermediate storage layers such as UP2X, ASX, ZippyDB.  We do not have a good handle on the computational and pre-processing costs and also lack these insights for newly proposed features. For example, the value from a high cardinality features must be tempered with the cost of generating and logging the feature. It is instructive to note here all resources are not fungible. E.g. if we are pushing the limits of online training without a backlog, replacing a set of features with pre-trained components might be beneficial (e.g. TUM style transfer learning).

Ideal state. Ideally, feature development should be an interactive optimization process.  This requires the feature verification process be more tightly coupled with feature development.  When a feature is configured, there should be automation to immediately provide samples of feature values, perform feature verification and report estimated feature usefulness. Meanwhile, we need a feature verification process that is even faster than current options, and more accurate in terms of estimating the impact of new features.

The ability of quickly and accurately estimating the impact of new features is even more important with the introduction of modern feature frameworks, because they allow us to apply a whole library of feature engineering techniques on any data sources, easily creating hundreds of feature variants, and we need a solution to find the optimal feature setting. 

There is a lot of work that needs to be done on accounting the cost of features. We need to build tools to estimate the cost of features. Ideally, such a system should be built into F3 enabling us to track costs when new features are proposed. Consequently, we will be able to track our launches not only in terms of what ad-score gains we got, but also what it took to get those gains. By establishing a resource-to-adscore exchange rate, we can make better judgements about how promising future launches are.  As mentioned earlier, the infra cost of features will be tracked by Monocle in the future [link, link].

Value and cost of existing features / existing data sources
Current state.  Assessing the value of a group of features in ranking is very difficult in the current system.  A straightforward approach is the feature ablation experiment - retraining models by replacing the interested features with other features which otherwise would be selected by feature selection, and testing the feature ablated model in an online experiment.  
This is a ridiculously expensive and tedious process.  As an example, estimating the ads score contribution of location signal required training 45 models (5 versions x 9 model types), 1 month engineering time (building automation and resolving various issues during model training), 1500 QRT segments, 2 month experiment time, and AdFinder memory for the 45 models: [link]. Nowadays, the online experiment resources, including QRT segments and AdIndexer/AdFinder memory resources, are extremely tight due to the heavy use of MasterCook, Signal Loss and many other types of experiments. The coordination of experiment resources and schedule introduce additional heavy engineering effort.  In addition, this approach captures the main models where the features are mostly used, but not all ranking models, hence lead to a lower-bound estimation of the value of the features.

Besides the high cost and tedious process of feature ablation experiment, another challenge is that a handful of features usually do not move global metrics, thus it’s hard to reliably measure their ads score contribution.  The problem becomes more fundamental when measuring the value of vertical-specific features (i.e. features that are meaningful for certain verticals only), because by definition they are unable to move global metrics.  Any vertical-level measurements are potentially unreliable as well, due to low detectability with vertical-level traffic, and traffic / budget shifts.

Given the high infra and engineering cost of the feature ablation experiment and the non-detectability of a small set of features in online tests, the recommendation is to leverage cheap solutions, i.e. feature zero-out experiment, to measure the upper-bound. One example is the features derived from the Marketplace signal: As a cheaper offline methodology for feature zero-out experiment, revenue-attributed feature importance method [link] can be utilized for quick offline estimation to prioritize the online experiment.

The value of existing data sources as features can be measured as the value of the set of features derived from them. We refer interested readers to [link] for more details about assessing the value of existing data sources. As a short summary, the recommended solution is a combination of feature ablation experiment and feature zero-out experiment, one capturing the lower-bound while the other capturing the upper-bound, from which we derive the true value. This solution has been taken to measure the feature value for offsite pixel, offsite app, onsite ads engagement and onsite organic engagement signals [link]. For the finer-grain data sources under those groups, depending on how critical the value understanding is, cheaper approaches have been proposed for further estimation [link]. 

Ideal state. We need to reduce the cost of feature value evaluation experiments.  There are at least three strategies to achieve so:

The first strategy is to improve the process of feature ablation experiments by centralizing and automating the process of preparing models with replaced features.  Although feature ablation experiment is the most accurate approach to measure the incremental ads score contribution of features, the process is very expensive even with sufficient automation.  Challenges with model serving infra cost, QRT segment resources cannot be easily solved with this strategy.

The second strategy is to use cheaper online experiment approaches to approximate feature ablation experiments.  The inaccurate feature zero-out experiments fall into this category, and we can make a series of improvements on feature zero-out experiments to make it approximate better towards feature ablation experiments.  For example, use feature imputation instead of feature zero-out [link].  Another interesting idea is to drop out features during model training to make the model robust against corrupted features and maintain reasonable performance in feature zero-out experiments.  

The third strategy is to rely on offline metrics to measure feature values, like feature importance, O2O metrics, incremental NE gains, etc.  Ideally these offline metrics should be tracked overtime.  Obviously the offline metrics won’t be very accurate in terms of measuring the ads score impact of features, but they are much cheaper to collect and still provide reasonable insights.

For the second and third strategies, studies are needed to establish the relationship between cheaper feature valuing approaches and the more reliable feature ablation experiments.  Signals Value team has done this for a few key data source groups as mentioned above, but the relationship may evolve over time, therefore, we might still need to re-run these experiments periodically. In addition, the relationship was on data source groups and not on each data source individually. If accurate estimation is needed, we may need to run such experiments on the dedicated data source. 

For experiment-based approaches mentioned in the first and second strategies, we need to significantly improve the detectability of our ad-score measurement system, so that it is sensitive enough to measure the (usually small) ad-score changes when accounting for the values of features, especially for vertical-specific features and/or any ranking changes that impact only small subsets of traffic.  
Value in retrieval
Current state. Measuring end-to-end gains through retrieval features is somewhat more difficult than measuring gains through modeling. This is because unlike modeling where can easily replay the impact of a better model through offline training, we don’t have infrastructure to benchmark retrieval changes. Additionally, debugging the retrieval flow is tricker since it entails a large number of ads per request. 

Online tests for retrieval changes are fraught with danger because of traffic and budget shifts. This precludes traditional measures like QRT/BQRT/CSBQRT which don’t offer any means to measure the impact of scaling a retrieval strategy.

Ideal state. Since there are multiple work-streams focused on retrieval we should build tools and infrastructure to measure the value of retrieval changes. For example a potential solution could be to build infrastructure and augmenting logging to be able to simulate our retrieval stack. This would enable us to test different retrieval strategies in a controlled environment.

Another approach to running retrieval experiments is to use the final prod prediction as ground truth and trying to maximize top N value in retrieval. This can be done using a properly instrumented production system by sending requests that tests the new behavior and compares it to prod and measures if the test is better at capturing higher value from the retrieval stage.
Value and cost of training data
Learning Representations
This section details the current methodologies for building representations from raw data and proposes some future directions. This is probably the most critical and controversial section in this document.

Before we proceed further, it is instructive to distinguish two types of representations - elementary and derived representations. The former (elementary) are pre-defined in the raw data or can be obtained through simple operations for example AppId or EventType. On the other hand, the latter (derived) need non-trivial manipulation to be extracted; often through another model. For example, ad categories and brand names are extracted by models deployed in ADU.
Discussion
Building our feature engineering strategy is green-field territory, thus it behooves us to crystallize our design principles before diving into specific technologies. In this section we will discuss 5 questions that will have strong implications on our proposed ideal state.
Why can’t we use raw data directly in our models?
Using raw data in the models is computationally prohibitive as the following back of the envelope calculation demonstrates. Each user typically interacts with ~10 offsite and ~10 onsite events in a day. Collecting this data over 90 days leads to ~O(1000) user events. Each of these events is associated with O(1000) sparse ids e.g. words on the ad landing page. Thus, a typical user representation consisting of all historic interactions for a user would have a cardinality of O(1M) which would restrict us to simplistic models (e.g. sum-pooling) during inference or offline aggregation which cannot use the ad’s context to attend to important events. On the other hand, we can greatly reduce the computational burden by using derived representations which can be built out of the delivery loop. Additionally, the cost of extracting these representations can be amortized over multiple user profiles. For example, we can use an expensive model to classify a web page (once) and use the top categories in the user profiles of all users who viewed this page.
Should we use sparse ids or embeddings for building representations?
The strongest argument in favor of using embeddings is their higher information content. For example, a single embedding can potentially encode all the information about a document while a sparse id will typically capture only one aspect of the document. However sparse representations are superior in some contexts:
Retrieval: It is significantly faster to intersect posting lists than nearest neighbor queries. Also, sparse representations let us encode business logic, exclusions and expansions more conveniently than embeddings.
Aggregate counters: One can easily collect counters to summarize user behavior while aggregating embeddings needs expensive memory networks or recurrent architectures.
Updates: Embeddings’ high information content becomes their Achilles heel when it comes to updating them with better representations in production. Whereas, sparse representations, owing to the information bottleneck can be swapped on the fly to measure the impact on all models. This is particularly important as we expect smaller incremental gains from the second generation of content technology, thus we need the ability to update all models without having to re-train them.
Logging: It is cheaper to log sparse representations than embeddings. e.g. BERT is 768 dimensions versus, each FBPage has less than 3 categories.
Advertiser / user facing features: These have to be in the form of human understandable sparse representations.  Embeddings are simply unintelligible.
Matching features: Edge features that are produced by matching user-side and ad-side sparse features have been proven to be helpful.  This type of matching features are difficult to produce from embedding representations.
Calibration analysis: Calibration analysis is a cheap and fast way to validate feature usefulness commonly used when exploring new feature ideas.  Although it is technically possible to do calibration analysis on embedding features (e.g. doing calibration analysis on every dimension of the embeddings), it is a lot more straightforward to apply calibration analysis on sparse representations.
Easier to debug: Sparse representations are interpretable thus it’s easier to detect data corruption or validate correctness from sparse representations.
In some cases, for the purpose of denoising data, we might even generate embeddings from sparse ids! To summarize, we propose to build both types of representations depending on the application and deployment infrastructure.
Should we build human understandable sparse features?
Conceptually, interpretability is not an important consideration for ranking models, thus learning non-interpretable latent representations is more flexible. However, there are some scenarios where latent representations don’t work. For example,
Business applications. When we are enforcing rules/special handling some segments of traffic. For example: zero out gender from HEC ads
User control. A fixed human understandable space is indispensable for soliciting signals from users. e.g. blocking ads from sensitive categories.
Engineering efficiency. Unlike academic problems, typical ranking problems have an additional degree of freedom - they can change the inputs. Interpretable models let us determine gaps in our understanding and fill them through focused effort. e.g. we can look at mis-calibrated segments and conduct human eval to understand missing features and signals.
Distant supervision. Across various product ML teams there’s a desire to be able to train increasingly larger models.  For example, feed would like to train models with massive embeddings (100x).  What we don’t talk much about is how we’re going to provide increasingly larger supervision for such models - let alone how we’re going to train these models in a timely fashion.  Even if we solved the training speed problem, we still have the supervision scaling problem.  For ads, we’re already using ~1 month of data to train ctr_mbl_feed models.  100x supervision simply doesn’t exist.  We cannot increase the user engagement rate arbitrarily through quality improvements.  Therefore, to be able to train larger models, since we cannot add more supervision through the label term, we need to look at other avenues for additional supervision.
One such avenue is through supervised features.  We can train smaller models to predict certain characteristics of ads.  For example, we could have a model that detects the language of an ad and use the output of that model as a feature in the main ranking model.  In a way, we’re reducing the cognitive load of the main model through packing more information into a single feature (i.e. the language feature).  The key here is that we can train this language model with explicit supervision once and then use this model’s output as a feature in the main model.
Interpretable representations can be improved by asking raters to judge their accuracy. This gives us an intermediate objective instead of having to work with the whole ranking system as a blackbox. Refer to the human annotations section for details on the current state of procuring this supervision signal.

Externally, both representations are popular [link][link][link][link] though learning human understandable representations is the cleaner solution. 
What kind of supervision can we use to build representations?
The crux of this question is whether there is value in collecting human supervision or can we solely rely on self-supervision and behavioral signals. Clearly, the latter is easier from an operational perspective but injecting human supervision can be particularly useful in the following scenarios
Behavioral signal is not enough. Behavioral signals suffer from bias due to our delivery system.
User data is noisy. We have an incomplete picture of users’ interactions which is further complicated by their shifting moods and context.
Internal / external evidence. There are several papers that demonstrate that small amounts of carefully chosen domain specific labeled data trumps fully unsupervised approaches [link ]. Even at FB, some teams (including ads content understanding, and BI) have tried using fully unsupervised models like BERT as feature extractor without much luck.
The north star would be systems that use unsupervised learning (e.g. BERT, URU) to develop an understanding of the data (through pre-training) and subsequently refine this understanding using small amounts of carefully sampled labeled data.
Should we build explicit user representations (vs. bags of previously engagement events)?
This question up-levels our earlier discussion to the user level (ref. Question 1). A good mnemonic for this would be a feature that estimates whether a user is interested in, say, running shoes. From a ranking standpoint building sub-representations is an anti-pattern. Whenever possible we should use granular features in our models and allow the model to figure out how to utilize this information. On the other hand building explicit user representations creates an artificial information bottleneck. Fortunately, the scale argument that thwarted our earlier attempts to learn directly from raw data (ref. Question 1) doesn’t block us here, since every user has a smaller number of derived features from events in his history. 

The above rule of thumb does not apply if there are product considerations that necessitate building explicit user representations for example for targeting audiences.
Should we learn a single embedding vector for users or ads?
Embeddings are dense representations of users/ads/items/entities in a multi-dimensional vector space.  When learning representations, we choose the size of the embedding and the number of embedding vectors we’d like to generate which dictates the granularity of the representation. One can also generate multiple embedding vectors for the same object.  One way to do so is to generate embeddings for different types of data related to the same entity (e.g. users’ ad clicks vs page visits vs pixel fires) to capture different facets of the object in question.  Another option is to pool all data together and generate multiple embedding vectors that incur a penalty for being similar to each other (see Multi-Task-Vectors for user representations).  The former let's capture the value of each type of data separately.  The latter captures the interactions between the multiple representations for a given goal and tries to explicitly learn diverse representations.

On a different axis, there’s the question of learning the embeddings as a byproduct of model training process or learning embeddings as a separate task and using the learned embeddings as features in a subsequent model.  In the latter, there is also the question of fixing the model that generates the embeddings frozen vs letting the model update.  Fixed embedding model ensures that it is in sync with the subsequent model at all times and that the learned representation is stable / fixed.  This is the mode User History Modeling (a.k.a. TUM) is operating under.  Updates happen through training new embedding models and generating the representations under new feature IDs that are consumed by subsequent models.
Current state
Features based on transient ids
Learning on a transient id space is the cause of many of our most stubborn and long-standing problems. Such an id space makes it hard for the model to understand all but the most frequent ids leading to cold-start issues. In order to accommodate a large id space we use hashing to share embedding for multiple ids which conflates signal across unrelated ids.
Ad ids are our predominant ad side representation which brings with it another set of challenges. Since the AA migration effort, this id is generated by hashing the content of the ad which ensures that identical ads map to the same id. However, this does not account for multiple variants typically created by advertisers. Currently, these variants do not share representations, effectively splitting user feedback signals across multiple similar ads.

Absence of user embedding features
An astute reader would notice that user embeddings are conspicuous by their absence. This is due to two reasons. First, user embeddings can encode information about a user’s offsite activity which is guarded by a 90 day retention window. Thus, user embeddings need to be expunged every 90 days. Second, maintaining even low dimensional user embeddings as part of the model is prohibitively expensive due to the large number of active users and limited model capacity.

Redundant dense features 
Over on the dense features’ side, there are ~7k GFF features and another 7k legacy features. Legacy features are difficult to manage since they are generated by ad hoc pipelines, making it hard to trace them down. Fortunately, some of these features were deprecated during the clear history migration and are in need for clean-up. However, there are still a significant fraction of legacy features that don’t have config based replacements or a clear deprecation strategy.

Switching focus to GFF features which are typically used to aggregate performance data at user or ad level. For example, our largest model has ~800 dense features of which ~600 are GFF features. These features have some peculiar characteristics. Curiously, ~80% of these features are user side. There is a lot of redundancy in this feature space. For example, we can remove 30-40% of these features without significant impact on the performance of the model. Furthermore, these features are derived from a handful of key attributes of users and ads. For example, all of the above 600 dense features are derived either by aggregating ad performance data on just 6 user attributes (e.g. user country) or accruing user preferences on only ~25 ad attributes (e.g. ad format).

For user side dense features we use sid (separable id) to aggregate counters, while we use the ad id defined earlier (colloquially known as entity equivalence key) for ad side aggregation. This choice of ad side representation also has implications on our product offerings. For example, it blocks any attempt at building a creative selection/rotation product since performance data is aggregated at ad id level, which is higher than creatives in the ads data model [link].

Another problem with how we aggregate performance data pertains to priors used to initialize counters. Most features use default priors which may not be a good fit for all scenarios. For example, arguably, conversion rates would have smaller priors than clickthrough rates.

Dubious quality of pixel data
We use advertiser supplied events as elementary features extracted from pixel data. These are of dubious quality since many advertisers mislabel their pixel events to game the delivery system.

Superficial content representation
We use a handful of content representations to generate ad side features. This includes sum pooling tokens from the ad’s creative, landing page etc. This would lead to very noisy representations since the creative or landing page text may contain redundant information. Additionally, we use concepts extracted from ads' images using x-ray as sparse features. On the user side, Instagram has experimented with embeddings generated by mapping hashtags to a curved space to force a hierarchical structure on the space [link].

Over the last year, we have also introduced features based on a large unified taxonomy (megaTaxon) but these suffer from low coverage since they are currently only available for English ads and pixels.

Ads quality component
On the quality side, surface teams have built features and models to capture some aspects of content quality. For creatives, this touches upon criteria like the fraction of text-overlay, and for landing pages it is typically aimed towards capturing egregious violations like ad farms, misleading experiences, or low quality ecommerce [link][link]. Recently, there has been some interesting work from FAM [link] to automatically manipulate ad assets to enhance their aesthetic quality.Ideal State
Ideal State
This section proposes modeling technologies that will aid us in building rich representations. This is a long section, so we begin by summarizing the general properties we expect from our learnt representations then subsequently dive into the details.

General principles for learning entity representations
Reduce the reliance on ephemeral ids and replace with stable semantic entities that are grounded in real-world concepts.
Unified attribute space across different data sources.  E.g. pixel / page share the same taxonomy. Attribute spaces (e.g. X-ray topics, MegaTaxon taxonomy) are sufficiently fine-grained and verticalized.
Utilize external human supervision to train feature extractors. Entity representation can be computed offline and the computational costs can be amortized across user events.

General principles for building user representations
User representations should be generalizable. They should be constructed from stable entity representations mentioned above.
They should capture users’ long-term interests as well as short-term intent.
User representations should provide holistic user understanding by fusing information across multiple data sources.
The learnt representations should be robust against signal loss.  Features generated from onsite sources should be preferred and prioritized. 
Finally, we need to build technology and measurement to verticalize feature engineering and incorporate domain knowledge.
Next we discuss directions that will help us realize the above ideal state.
Standardized feature engineering techniques
Although we have developed many feature engineering techniques, they are scattered around and usually tied to particular data sources.  What is missing here is a framework to standardize feature engineering techniques, so that each technique can be applied on all data sources without human intervention.  This feature engineering library should include the following commonly used techniques:
Simple id representations
Token representations, which handles stopwords, internationalization, ngrams of tokens, etc
Mapping contents to a standard taxonomy (e.g. MegaTaxon) or topics (e.g. Wikipedia topics)
Extracting common properties (e.g. brands, domains)
Long Term and short-term aggregation windows
Visual signal representations
Recommending items based on context (e.g. recent activities)
Given traits in a data source, aggregating dense counter-based features
Producing intersection features by matching user-side and ad-side features
Ngramming multiple features
Dense feature bucketization
Enrich sparse feature with values such as frequency and recency
With such a feature engineering library, ranking engineers’ focus should be on developing new horizontal techniques to add to the library, instead of developing individual features.
Mapping to a taxonomy
To bootstrap our understanding we need to map all data to a unified taxonomy. Towards this end we need to build the following capabilities
Build a fine-grained taxonomy that can represent most real world concepts in a unified language. This will allow us to aggregate user signals across multiple data sources. For example, a wine connoisseur might visit BevMo every weekend, have some pixel fires from totalWine.com and be part of a group about vintage wines. With deliberate effort, we can distill this information to affirm that this user is interested in wines!
Develop multimodal modeling technology to combine signals from image, video, audio and multiple sources of textual data like webpages, OCR etc. For example, we could use image signals to supplement our understanding when the underlying document lacks sufficient text.
Develop methods to efficiently internationalize our classifiers. Since ~60% of our revenue comes from English speaking countries it is instructive to begin by focusing our efforts on English documents. Unfortunately, the revenue distribution by country is heavy-tailed and we need to model the next 12 languages to reach 90% revenue coverage. Furthermore, certain languages, namely Chinese/Japanese/Korean are hard to tokenize and present additional challenges. Since naively building classifiers in every language is not cost efficient, we would need to develop techniques to transfer learning across languages.
We wish to model ~20 different data sources which balloons the cost of collecting labeled data. To resolve this, we also need to explore cross document transfer learning and zero shot learning to leverage labeled data from other documents.
Entity and attributes extraction
Entities provide the next level of granularity beyond what is possible from a taxonomy. Building an entity extraction stack requires us to solve multiple problems.

Candidate generation. In this task our goal is to identify phrases that represent a particular type of entity e.g. all phrases that are product names. We divide the candidate generation problem into two classes - closed world and open world. Closed world candidate generation is applicable when we have a predefined bounded target space. This is typically the case for named entity recognition tasks like extracting the names of people and places where we can use knowledge bases like wikipedia as a target space. Open world setting is gnarlier and rears its head when we don’t have a well defined target space, for example when extracting product names from ads. In such scenarios we need to use syntactic and structural cues from the document to generate plausible candidates.

Canonicalization. This entails clustering analogous entities. For example, “handheld vacuum cleaner” and “vacuum cleaner (handheld)” both refer to the same underlying object. Collapsing similar entities to the same concept is beneficial for the downstream models since it reduces the number of embeddings that they need to learn aiding generalization.

Disambiguation. In this task we endeavor to resolve confusing pairs of entities like distinguishing “apple” (the fruit) from “Apple Inc”.

Salience. The final piece of the puzzle is to predict salience/relevance of entities. For example, arguably in the sentence - “Trump spoke at a rally in Florida”, “Trump” is a more important entity in the context of this sentence than “Florida”.

Once we have a canonicalized list of entities, we open the door to enriching this list with attributes and metadata extracted from knowledge bases. For example, every canonicalized product can be tagged with the available colors and prices. Similar to mapping documents to a taxonomy, the final hurdle would be to efficiently scale our entity extraction technology to all languages and documents. 
Knowledge graph
The next step after building a granular and stable set of entities is to understand the relationships between them. This forms the basis of an ads knowledge graph. These relationships (encoded as edges in the graph) can be used for expanding user interactions during retrieval and ranking. Some common types of relationships we may wish to mine include
Compliments: Understand the pairs of entities that are positively correlated. E.g. “diaper bags” and “diapers” are frequently bought together.
Substitutes: These represent entities that can be used as replacements. E.g. one may buy a “hoodie” in place of a “rain jacket”.
General vs. Specific: These types of edges help us traverse the knowledge graph and discover newer sets of entities that generalize a concept. E.g. if a user viewed “Honda CRV 2019” he may be interested in other CRVs too.
X-language: Since we aim to understand entities in all languages, these edges can connect similar entities across languages. E.g. “pants” in English may be connected to “un pantalon” for French users.
For completeness, we should also consider the counter argument against investing in such technology. One may question whether there is value in learning relationships when we could encode this information through embeddings in the ranking models. While learning embeddings over entities is a reasonable approach - that we advocate following - we believe there is incremental value in using these interactions to augment user profiles. This is because these relationships can be cleaned and vetted through human supervision which is not the case for ranking models that train on noisy behavioral data. Additionally, such edges can encode external information that is not available to the model in training data such as users’ organic behavior. 
Key Numbers ~150M entities by the end of 2019.  Tier 1 Domains are celebrities (~5M), media (~30M) and geographic places.  These are the ones with high coverage and high precision.  ~1.3B facts which is roughly 9-10 facts / entity.  70% of facts are attributes and 30% are relationships between entities.
Trust, sentiment and quality
Beyond understanding the content of documents, this workstream focuses on modeling people’s perception of the content. For example, this includes understanding the sentiment of an ad, whether it is divisive, or determining the trust-worthiness of the advertiser. To estimate the potential of this approach we can peruse the definitions of some features [link] based on users’ interactions with FB pages and observe we don’t account for the sentiment of the interaction in the feature definition. On the other hand, browsing comments on posts by popular retailers suggests that user engagements are indeed bi-modal.


This area also encompasses quantifying creative and image quality. These ideas have been explored in the past and we believe that a concerted effort in this direction would have large gains. Along the same vein, we should invest in understanding landing page quality. This requires understanding factors that impact users’ post click experience e.g. load time of the landing page, the quality of images and the match between the ad’s content and that of the landing page.
Content descriptors
Similar to the previous section, this work-stream also attempts to understand the context in which information is presented by building content descriptors. This includes classifying different types of web-pages such as search page, check-out, product review etc. This is particularly useful since advertiser supplied descriptors are central to many of our deep-funnel products but are often unreliable. In addition, we also wish to understand the nature of Instagram or Facebook profiles to separate content aggregators, fan pages from original content creators.
Verticalization
Verticalization is the next phase in the development of the entities platform. This entails ingesting verticalized knowledge bases and extracting low-coverage but high value entities. For example, the autos team has seen impressive gains using (purchased) external data about the make and models of cars for building features.

Apart from infrastructure to ingest and maintain these knowledge bases, building specialized features for verticals would also need a change in mindset. We have traditionally neglected feature engineering and relying on modeling improvements to drive the majority of efficiency gains. With the modeling stream starting to run dry it is time for us to focus on good-ol’ feature engineering to realize the next wave of gains. After onboarding all the data sources, we should pivot to a verticalized model for building user profiles. E.g. a group of engineers could focus on understanding users’ fashion preferences, while another tries to model their shopping habits for electronics. This will give teams an opportunity to specialize and aggregate signals across data sources and build a holistic picture of our users whereas naively pooling activity within each data source would water-down this signal. 

There are a few implicit requirements in pursuing this line of enquiry.  On the modeling side, we will need a model arch which is able to efficiently consume and learn from verticalized features which usually have low feature coverage.  On the measurement side, we will need experimentation capabilities to measure improvements on small segments of traffic (as mentioned in Value section).
End-to-end feature learning
Our current feature engineering process has two steps. We begin by building representations e.g. x-ray concepts, megaTaxon categories and then aggregate these representations resulting in features. A potential drawback of this approach is that representation learning is agnostic to the eventual applications. This leads to the intriguing possibility to combine these two steps and learn representations in an end to end system that incorporates multiple forms of supervision including users’ actions. Refer to [link] for more details on this proposal and preliminary plans.
Leveraging more types of events as supervision
Labels in ads ranking models, especially lower funnel ones (e.g. offsite conversions) are relatively rare events.  Using more types of events as labels, we can potentially leverage a lot more supervision to mitigate the sparsity challenge.  Previously, we have seen successful stories of using additional events as additional supervisions in offsite conversion model, including tracking events [link], link click events [link], and landing page view events [link].  

So far, the successful explorations have been focusing on non-optimized events that happened along the funnel of ads conversion.  On top of that, any events including organic events can be potentially leveraged as supervision as well.  For example, we can use organic page post engagements or organic app events as labels to supervise ads ranking models.

Due to the high number of candidate event types that potentially can be used as labels, we will need a way to estimate the value of the events as supervision, as well as a modeling technique which is capable of learning from a lot more types of labels than what we currently have in the models.
 
Feature Processing Infrastructure
Feature extraction is the process of deriving informative and non-redundant values from raw data for the purpose of learning and generalization. It is, in a sense, a dimensionality reduction technique. The process of feature extraction covers the set of storage systems, frameworks and tooling to convert data into features. Since this is a long section, with multiple levels of details, we will begin by laying down the desirable properties of feature processing infrastructure.
Desirable properties of feature processing infrastructure
Expressive. The feature processing infrastructure should allow multiple modes of authoring features depending on the use case. This includes config driven authoring (similar to GFF) for simple features all the way to features extracted in native c++/python. In addition, it should allow us to easily execute standalone models to produce features.
Stable. It should support monitoring, feature lifecycle management, feature versioning for all clients.  
Efficient. Feature extraction infra should also be smart about common dependencies on data so only one copy of the union of dependencies is fetched and appropriate subsets should be handed out to registered feature extractors.
Extensible. It should have a backfill mechanism so that engineers can test ideas efficiently and also support dependencies between computation of features. Finally, it should be able to ingest data from various sources and allow for aggregation and processing at different timescales  e.g. realtime, daily or hourly.
Compliant. Our feature framework should be compliant with current regulations and enable us to react swiftly to the changing legal landscape.
In the subsequent sections we will discuss the current state of user and ads data processing and the necessary steps that will help us attain the ideal state described above.
Ads data processing
Key numbers
Current state
Most of the non-performance ad data mentioned earlier is piped to Ads Deep Understanding Service (ADU) [link][link] which provides a framework to define and extract features. The service is queried by AdPublisher during index construction and the extracted features are piggy-backed onto the adUnit (refer to diagram below). 

ADU currently lacks the ability to build aggregations by traversing the ads data model. For example, we can’t use the current infrastructure to build aggregate campaign features based on ads’ content. Furthermore, due to legacy reasons, there are a number of ad side data sources that interface directly with adPublisher which complicates the dataflow.

Ads’ performance data is typically aggregated by GFF/GSF[link]  and served through ASX or through adPublisher by augmenting the adUnit. These frameworks provide support for backfilling and defining features based on this data, however there have been dev-efficiency concerns about using them.
Ideal future state
Most high order bits are in-place for ad side data from an infrastructure standpoint. In an ideal state we should consolidate and simplify the infrastructure by migrating existing legacy ad features and ADU features to F3 for unified management.

Additionally, adding support for traversing the ads data model would open opportunities to define richer features in ADU.
User data processing
Key numbers
Current state
Majority of user features are currently developed using GFF/GSF which provide a config driven process to build batch pipelines that extract features. There are several issues with this setup.
It suffers from persistent delays of 2-3 days as many layers of batch pipelines wait for data and computational resources. During this time users’ intent attenuates
GFF was designed to do simple extraction and processing using pre-defined UDFs. It is insufficient to support advanced signal mining use-cases which require a native interface to interact with data. The only recourse for implementing non-trivial logic in batch pipelines is to use fast-transform [link] which leads to fragmented code with limited support for testing and deploying changes. Additionally, it imposes a hard limit of 2GB per compute node which is debilitating for most advanced feature processing ideas.
GFF is inefficient with resource utilization. Typically, users generate multiple features from the same raw data which is read multiple times from the distributed file system. Thus, we end up spending a lot of time in serializing and deserializing data. Additionally, it saves intermediate snapshots of this data into hive tables further stretching our limited warehouse resources. Consequently, this is one of the resource intensive services in all of ads.
GFF lacks support for versioning features. As a result engineers typically end up generating multiple variants of the same feature with no recourse to deprecating older versions. This pollutes the feature space and inflates our logging footprint.
These pipelines need constant attention to manage failed tasks and intricate dependencies.
A common use case encountered during feature engineering is to backfill data and inject features for fast iteration. Unfortunately, both of these processes are slow and unreliable in the existing infrastructure. In addition, we have a patchwork of non-standardized offline analysis tools with no consensus on how to interpret their results. Consequently, It is hard to do offline experiments with features, thus engineers typically generate and log multiple variants of features and pick the best performing ones. To an outside observer, this is the modeling equivalent of carpet-bombing.
There is limited support for real-time features, though this has lots of scaling issues and it is not widely adopted. 
Ideal future state
Fortunately, we are working towards alleviating many of the problems endemic to GFF in the next generation feature platform - Facebook Feature Framework (F3). In the remainder of this section, we will highlight some of the key use cases that should be supported on this platform

Access patterns
The underlying idea behind this design is akin to map-reduce i.e. decompose feature processing into two stages - event processing and user aggregation. In the first stage, we analyze each event (e.g. page visit by a user) and extract signals from this interaction e.g. category of the page. Notably, this is done independently for each event and can scale horizontally. These signals are piped to a stateful user aggregator that builds user profiles by coalescing signals from various sources for every user as shown in the figure below. We note that though this is the common modus operandi, the F3 framework supports advanced use cases like multi-stage processing and aggregation on non-user level.

There are three predominant access patterns - in increasing order of complexity - that need to be supported in this service.

Flexible batch computation. In an ideal state, we need to expose a native interface in which engineers can implement the business logic for batch pipelines without having to rely on auto-generated verbiage for every new application. The tight memory constraints imposed by hive would be partially relaxed as we migrate to spark (9GB instead of 2GB). We envision this too will prove to be insufficient in the medium term as we try to utilize fact based reasoning and larger content models to process data. In the limit we may need to support a serverless model [link] where memory intensive business logic is executed on T6 machines that are colocated with the batch processing infra.
MapJoin architecture. This architecture unifies batch and stream processing to make the best of both worlds. It is useful when we have a stream of user interactions (likes, follow, share, profile visit) with a relatively static dataset (e.g. FBPages). In this case, we can batch process the dataset and store the output in an object store. Then, during stream processing we can fetch precomputed representations from the object store and simply join with the stream of user events. Note that this setup amortise the cost of expensive batch operations over multiple user interactions.
Scribe streams with large payloads. In this scenario, we have a stream of user events which carries a rich payload of data (e.g. stream of pixel events) that needs to be joined with batch processed data. Since processing the payload would entail significant computational cost we need to invest in a caching layer to amortize costs. For example, such a setup would enable us to reuse the results from processing a trending article that would appear in multiple users’ pixel history.

Developer efficiency
This section proposes affordances that would make it easy to develop features on F3.
Since the access patterns described above present a multi-tenant architecture, where multiple UDFs (potentially from different teams) would be executed on the same data-source, it is imperative to build tools and processes to preserve the stability of the entire pipeline. This includes scripts to test every diff in the canary tier to understand its impact on latency and memory footprint of the workflow. Additionally, we need instrumentation to track vital statistics for every UDF to catch performance regressions.
The new infrastructure should support the ability to generate features directly from the stream processing infra using a single diff. This would be an improvement over the current process that needs careful orchestration between multiple diffs to generate a feature [link].
End to end framework for offline feature engineering that covers the entire experimentation cycle. Ideally, this should include provisions to define a new UDF and dump a small sample of data by running the streaming pipeline in an dev-environment. Additionally, it should be possible to generate multiple user features on a slice of data which can then be injected into a training dataset. Subsequently, this should trigger model training runs which are followed by automated analyses producing vital statistics about the features such as calibration gap, coverage, cost etc. Based on this data, an engineer can choose to propose the best performing subset of features. Note that all of the above steps happen in a dev-environment saving us from the glut of experimental features. This will unify the experimentation and productionization environment for feature engineering.
Another pain-point that we hope to address with F3 is to test variants of a feature across all models. This is particularly useful as we iterate on feature extraction technology resulting in improvements that may be hard to detect while experimenting with a single model.
For example, it would help to make F3 UDFs searchable like spark and presto UDF [link] and maintain a common shared wiki for documenting the interfaces. 
Finally, we need to build processes to review and standardize code that is checked into F3. For this we will enlist engineers across feature infra and ranking that have shared context of the codebase and take ownership of keeping it in pristine shape. This group will also be responsible for ensuring that the UDFs are written in a generic way, avoid code duplication, and are not tightly coupled to data.

Resource utilization
Since the above design decouples processing slow changing data from realtime interactions with it; we can utilize off-peak computational resources to process the former. 
Additionally, since all batch and event level processing is broken down by data source, we can optimize the execution graph to ensure that expensive operations can be shared across UDFs. For example, we only need to incur the cost of parsing a web page once, and then reuse the parse tree in many subsequent UDFs.
Backfill
For ranking systems, we typically require rather large amounts of data to train models and evaluate them on.  When we try to add a new feature to the system, we have a couple of options.  One option is “front-fill”, where we start producing the feature in production and let it accumulate.  Once we have enough data in our training tables, we can evaluate the usefulness of the feature.  This option comes with some drawbacks.  We’d have to change production code to produce these features that will potentially get scrapped because they didn’t provide value.  We’d have to materialize and log all different versions of these features we’d like to evaluate.  Most importantly, we will have to wait for the data to accumulate. This can cause significant delay in experiment cycles, as some model types are trained on ~90 days of training data.

Second option is “back-fill”, which is to retroactively materialize the data as side tables parallel to the training tables (i.e., by essentially adding new columns to the training data), as if the feature were generated in the past.  Then we can train models without having to wait for front-fill.  The only downside to this as it stands is, once proven useful, we still have to update production code for front-fill.  Using good engineering practices, we can build shared libraries for both cases so that there’s no discrepancy in the feature definitions.

Backfill gets tricky when we need to backfill time-window based features (e.g. user profile features) as the user history window would have to be materialized and updated for each example.  Once we have a user data vault in place, we need to build proper APIs around it to support backfill and make it as easy as providing a function from a history sequence to a set of output features.
Current state
We currently don’t have any platform that allows us to efficiently do this on a per-example basis.  We tend to write dataswarm jobs that operate on daily data segments, aggregate relevant data on user key and join across days using sql statements.
Ideal future state
We should have a user data vault not on the critical path in production so that any set of time-window based user profile features can efficiently be extracted when user data is read once.  Currently, we have some user history data in UP2X but we ideally wouldn’t want to hit a production service with backfill requests unless it was provisioned for it. We can have a disk or flash based, minimally replicated UP2X / Laser instance for such requests.
Training Data Processing Infrastructure
Desired Properties of Training Data Platform
Flexible and scalable label composition
We shall platformize training data creation to enable ranking engineers to easily build ML datasets out of any ads signals with a descriptive framework
Scalable, automated data transformation & storage
We shall build automated ML data transformation and storage solutions to scale linearly with ads delivery business
Robust production training data and models
We shall provide quality guarantees and efficacy insights on ML data and models in production

Current State
Training Data Platform has evolved over the past 2 years into a much better state - the data joiner is no longer a capacity bottleneck, the warehouse usage is now under control, the reliability of our data services is at one 9. However, our journey has just begun, and we will tackle several upcoming challenges - 1) scale up the ML data services by 2~5X for the rising ML data demands, 2) platformize the services to intake more types of ads signals for FB Signal Resilience, 3) make quantifiable quality guarantees on the data and models we produce, 4) offer across-ads-infra capacity management, and 5) significantly improve the developer experiences to minimize operational costs. 

To delve into more details: 
Flexible and scalable label composition
Currently, the training-data label joining completeness is 93% for 20% datasets in new architecture and 78% for the rest 80% datasets in old architecture. Our systems are in migration to new architecture. 
The training data systems are not resilient for upcoming signal loss. The foundation to enable resilience is under development.
The training data systems cannot flexibly incorporate new post-delivery signals to enable Ads Score improvement without significant engineering time spent (avg 2-3 months per new signal). Example of such signals: Instagram organic engagement signals, Shops onsite checkout signals, etc. 
Scalable, automated data transformation and storage
We have significantly cut the Training Workflow Failure Rate below 1%. However, the operations on training data are still fragmented and fragile for the ranking engineers. They have to deal with low-level infra details across multiple tools. These also caused data availability issues at training runtime.
We still have significant duplication in Training Data after reducing the duplication factor in raw joined data by 80%. We are working on an initiative to further reduce duplication in the final transformed training data. We just started building ads-ML-optimized data storage layout for FB-wide usages. 
Robust production training data and models
Current model snapshot validator has low accuracy, provides a bad user experience, and requires model retraining when validation configuration changes. We are building the new snapshot validator to solve these problems
Online trainer can't consume all real-time training data which degrades model quality and produces system instability (e.g. hanging or crashing).
Ideal State
By 2022, we shall have built the Ads Training Data Platform. The platform offers ML engineers an easy and flexible framework to build ML datasets out of any ads signals, while providing latency and reliability SLAs but hiding the infra details. Beneath the platform, we shall have built 5X more scalable data transformation and storage infra and more robust production model training infra. We can provide quality guarantees on the data and models we produce. Last but not least, our platform and infra are easy to operate and debug with minimal operational overhead. 

To delve into more details
Flexible and scalable label composition
100% production models use training data produced by standard ads training data systems.
100% delayed and de-identified signals can be joined into training data.
Adopting any new signal takes only one diff change. 
Achieve 99% label completeness for all training data.
Scalable, automated data transformation and storage
Achieve linear growth of storage for training (wrt organic impressions), ML engineers have access to training datasets with full sets of features for experimentation, training data creation time reduced from days -> seconds.
0% training workflow failure due to data issues. Ads ML abstraction layer with SLA-bonded reliability contracts with Data Infra and AI Infra, for creating, mutating, and using ads training data. 
Fully automate the orchestration of training data creation, mutation, and usage to eliminate failures caused by component mis-coordination. 
Robust production training data and models
100% of model snapshot candidates will be validated using the improved snapshot validator before release to production.
Improved snapshot validator will have an erroneous rejection rate of 0%, an execution success rate of 4 nines (1 failure in 10,000 executions), and an uptime of 5 nines (5.26 minutes downtime per year).
100% of models are under 0.1% data loss and published within latency SLA.
Feature Management
Current State
In Ads Ranking, the feature life cycle could be summarized into 3 different phrases including exploration phase, launch phase and post launch phase. A lot of challenges have been observed in all of those phrases.

The currently observed challenges in feature exploration includes
The feature authoring latency is long because of inefficient development tooling as well as the suffering from stability issues.
There is no efficient and standard way for conducting feature verification to measure the additional value on top of existing features. And it is even hard when it comes to features with low coverages.
There is no documentation and lineage from a feature to its data source and semantic meaning [link].
System resources such as storage, compute are always under quota constraints which prevent ranking engineers conducting enough experiments.
There are also the privacy risks because of the lack of a unified system for handling such policy with high dynamics of change over time.
During feature launch phase, there are still a bunch problems we need to address
The huge amount of features makes it challenging to add into ranking models.
Feature selection is suffering from stability and latency issues.
Inconsistent feature metadata allows unexpected features flow into ranking models.
Even after feature launch phase, there are still a bunch problems we need to address
Some features (especially legacy features) are lack of ownership and SLA for stability issues. And the migration of such features usually needs non-trivial efforts.
Ad-hoc (urgent) feature deprecation deteriorates models and adds in complexity for feature status.
There is no efficient process for regular feature deprecation across all ranking models, while ensuring the correctness (e.g. no production regression).
Ad-hoc feature metadata changes are happening which could break the ranking system.
There is also the issue of feature online/offline inconsistency.
Ideal State
As the ideal state for feature life cycle management, we would imagine a knowledgeable, highly-automated system backing up the whole feature development process from authoring, verification to launch as well as deprecation. Along the cycle of a feature, we have a good understanding of their value and cost, as well as insights that help engineers iterate on their ideas. Standard best practice is developed and enforced along the way. Specifically:
During the feature exploration phase: An efficient and powerful system should be developed to iterate over new ideas, with automated processes to collect data, sweep over runs and generate reports, without worrying about the underlying storage and compute systems. Understanding a feature is easy through its lineage and compute graph,  provide insightful results from offline experiments
During the feature launch phase: Model can be refreshed without worrying about features’ status and other related aspects.There should be a sustainable process for feature development, where new ideas can launch into models without much concerns on storage and model capacity. Features could be launched across models efficiently and maximize the impact with the best ROIs. 
In the post launch phase: All production features should be having high maintainability and stability. Feature deprecation should be an automated process with guaranteed SLA. Feature metadata should be well maintained and clear API should be provided with  guaranteed SLAs.

It is important to invest into the following areas to achieve the ideal state of feature life cycle management.
Feature Value: Understand feature’s value globally and through different aspects including impact towards model N.E., correlations, ads score as well as efficient evaluation strategy and new methods towards estimate features’ value. On the other hand, it is equally important to get the system cost of them and make a good tradeoff between value and cost.   
Feature ML Automation: Build automation system for features to onboard as well as disembark of ML models and artifacts. This is the key part towards an efficient and system-driven feature lifecycle that would involve the minimum human effort.
Feature Knowledge Management: Establish abstraction layer of features and accumulate knowledge in a centralized repository. This will become the knowledge base that supports lots of applications and building a management system on top of that will enable easier ML practice adoption. 








