---
id: 47klgvi65198krq959vz0ui
title: Effective System
desc: ""
updated: 1733703906458
created: 1733703904403
---


Designing an effective experimentation system
Operations over Outcomes
ABTest is working to define a North Star architecture that enables innovation and addresses problems in correctness and developer efficiency. Much of it is driven by our current problems and practices (not all of which are good). This note examines what makes a good experimentation system based on solid statistical, database, and software principles i.e. based on how things should be done rather than based on how things are done (which we know is bad). It continues the brief note on the importance of separating the functions of the data layer from the analysis.

Tl;dr A robust experimentation system is designed by knowledgeable experts identifying key components and building out fundamental operations. A good system is not designed using flawed measures like top-line metric, by customers, or support of our current practices. We describe these components and some of the operations. We provide some next steps and further illustrate the usefulness of these fundamental operations with the notion of “subsegments” as an experimentation unit. This could allow us to both improve analysis and save/speed up compute and storage.
Overview

“To consult the statistician after an experiment is finished is often merely to ask him to conduct a post mortem examination. He can perhaps say what the experiment died of.” 
– Sir Ronald A. Fisher

While this quote, by perhaps the greatest statistician of all time, addresses experiments themselves, it can also apply to experimentation platforms. In order to ensure a successful experiment, early input into the design by a statistician can identify the key issues and solutions. 

We assert that a good experimentation system is built by goaling on the functions it is actually supposed to perform, not based on hypothetical benefits derived from questionable statistics. We demonstrate with a concrete example that iRev driven goaling can lead to stupid experimentation design decisions. 

To be able to set good goals, we break down experimentation platforms into 5 components and provide a brief description for each. This also enables better engineering, allowing us to further break down ABTest’s monolithic design that has lead to bugs and slow development. 

These components can be further broken down into the fundamental operations one wants to achieve with each. We only describe the fundamental operations of the first stage: the Design of Experiments. Implementations should be faithful to the definitions of fundamental operations, emphasizing implementation correctness, not imprecisely defined behavioral “correctness”. 

We show how QE (whose statistical design I played a large role in) was able to achieve both correctness and more advanced capabilities because of careful design of the fundamental operations it provides.

This continues a multipart series on how to design and engineer a good experimentation system that covers all relevant aspects including goaling, statistics, the data warehouse, etc. The first note was on separation of Analysis from a Data processing layer.

TOC linking to sections in slightly longer google doc
Problem statement:
Fundamental operations:
Example: Topline Metrics can drive Stupid Decisions
Component 1: Experiment design and deployment
Examples: ABTest
Takeaway 1: Improvements are about changing fundamental operations
Takeaway 2:  Lack of good operations causes “Correctness” problems
Example: Bad or Problematic experiment designs
Example: Other experimental designs in industry
QE: A Brief History and its advantages:
QE: More advanced capabilities
QE Correctness: Definitions matter. Good functional behavior follows.
Opinion: The relative unimportance of unit tests.
What’s next?
Moving to the next stage: The API
Possible improvements
Goal of Experiment Design: Effective and Efficient use of Supply
Reality of Supply: No additional supply
Efficient use of supply:

Problem statement:
Problem: How do you build an experimentation system that provides flexibility, is scalably robust, and provides reliable answers? And how do we avoid the problems of our existing system?

For example, it’s no secret that QueryLib and our experimentation platform 
Have had many bugs and sevs and 
Are very difficult to add new methodologies to.

I find arguments against working to replace QueryLib odd to say the least. They boil down to QueryLib being too difficult to replace, because no one understands what it really does. But consider what QueryLib does, and the argument effectively can be restated as 

“QueryLib, a system to compute a mean and variance, is too difficult to replace because no one understands how it computes the mean and variance”
Common claim in ABTest in the past

This note explains how to engineer an experimentation platform and not repeat ABTest’s mistakes. It breaks down experimentation into fundamental operations and suggests that our current approach of emphasizing functional behavior over fundamental operations have led to a lousy design. The concepts are not new. They were part of what I did for the successful design of Deltoid v1 + QE. 
Fundamental operations:
A single experiment is a mostly linear process that has an overarching plan of how to execute it from beginning to end. This process has distinct stages with each stage performing a few fundamental operations. This section describes these stages and explains why ABTest’s monolithic design causes it to fall into pitfalls / SEVs.

There are 4 broad components in experimentation platforms + a 5th for private experimentation: 

Component
Function
Experiment design and deployment
Assigning Treatments to Randomization Units, applying and logging the treatment data
Computation infrastructure and log processing
Scalably transforming raw data to aggregates or “sufficient statistics”
Analysis
Turning raw statistics to interpretable results
User interface and decision making.
Enabling users to effectively run and make decisions based on experiments
Privacy mechanisms
Privacy preserving data release and retention



This separation is not just a practical guideline. It can be statistically motivated. Experiment design can be separated from Analysis by the “Likelihood principle”. Computation is separated from Analysis through “Sufficient statistics”. 

ABTest grossly violates these principles of separation of layers throughout its stack. Starting from experiment design, ABTest conflates treatment assignment, log processing, and analysis through “versions”. Computation infra and analysis are completely merged in QueryLib. Extending it to support even centuries old methods is hard, much less “state of the art”, since the computation is built to support only the most basic of statistics, a mean and variance for a pair of versions. Results are wrong when implicit assumptions about how experiments are designed are violated. Even for privacy, computation and data release are completely tied together, since every aggregate computed by anonymizer is released. This makes it painful to collect debugging/validation stats or change the privacy release.

Symptoms of this lack of separation are everywhere, particularly in 1) bugs / SEVs and 2) the lack of or rarity of improvements to our analysis of experiments. Even efforts like MAB and adaptive experimentation are in some sense not actually improvements to experiments and their analysis, but to the decision processes governing experiments.

A number of bugs in QueryLib are due to failed assumptions in the computation infra and logging, for example missing aggregates or incorrect segment counts. A persistent problem is its inability to fund and implement even the most basic statistical methods like linear regression due to the complexity of modifying an analysis stack implemented by pasting together SQL strings. Improvements are also blocked by privacy due to our inability to get any additional statistics from anonymizer.
Example: Topline Metrics can drive Stupid Decisions 
The design principles suggested here are entirely focused on developing a good product, not on topline metrics. In fact, many of these would have no immediate impact on topline metrics if implemented, even though they would improve the product and yield long-term improvements to all the topline metrics. 

In other words, focusing on impact to top-line metrics can result in bad product decisions, a point I’ve emphasized in a previous note. This is not a theoretical problem. We currently make bad product decisions that are explained by our pursuit of topline metrics, pursuits that are often driven by theoretical iRev claims and not grounded in practicality. Here is one example.

Imagine going back 200 years and telling Gregor Mendel, “We’re experts in experimentation from the future. You changed your experiment size mid-experiment. Sorry, we’re going to have to blackout all your previous data.”

Experimenters have been validly changing the size of their experiments for centuries, so long ago that the difference-in-means t-test had not even been discovered! Yet, because of correctness goals, this is what we tell customers.

Attempts to support changing sizes for normal experiments are met with questions on quantifying impact. In our current framework, this is challenging because 1) there’s no direct link to iRev, 2) it has no platform MDE impact and 3) it is impossible to reasonably speculate about changes in user behavior that’d lead to “throughput” gains and supply savings. At the same time, this is not a table stakes problem either; ABTest can provide an experimentation platform without it. 

This example provides yet another data point on the practicality of our decision processes, a data point that a fundamental operation that has been important since the very first experiment is not justified by how we make decisions!
Component 1: Experiment design and deployment
Since there are several components, we only cover the first one in this note. ABTest certainly has had some confusion about what constitutes a good experiment when it isn’t a vanilla A/B test. It has also tried to implement bad experiment designs, i.e. Request-Level QRT, and conversations about the appropriate changes to our platform continue to be misguided at times.

For a pretty good overview of basics of experimental design UW biostats provide some pretty good lecture notes. Here, I look at particulars focused on building an online experimentation platform. There are 2 main building blocks for experiment design: Units and Treatments. How the experiment is defined, deployed, and logged depends on how these are defined. I’ve tried to break these down further into a set of fundamental issues/operations that an experimenter and the platform should address.

Fundamental operations: 
Defining the experimentation unit: The grain at which you apply treatment protocols (and typically randomization)
Defining the population: The experimentation units that are eligible for treatment
Defining and applying the treatments: A manipulation of the experimentation unit’s experience
Defining the treatment “grain/unit” and program: How an experimentation unit can receive multiple treatments
Defining the treatment assignment: How to randomize experimentation units into treatment protocols
Changing designs (and the size): How to change the populations/protocols/assignment that still enables valid future analysis
Recording the experimental design and observation units: How to collect observations and log the information needed for future analysis

Examples: ABTest
To see how these apply, let’s consider some examples. We start with some ABTest designs in the table below. A dash ‘-’ indicates it’s the same as a vanilla ABTest

Operation
Vanilla ABTest experiment support
Exposed Users 
Ads Segmented Experiment
Shared control
Experimentation Unit
Segment
-
-
-
Population
Available segments at experiment creation time
“Exposed” Users 
-
Treatment: -
Control: “Rolling” population of pooled versions
Treatments
Change a model(s) within a fixed list of models
-
-
-
Treatment grain + treatment program
Single treatment for an experimentation unit over experiment duration

Treatment is applied if nothing is applied by a higher pri universe!!!
-
Grain: (Segment, Ad Cluster)
Protocol: Choose a pair of treatments for each segment to create a “blocking” design
-
(Randomized) Treatment assignment
Sample without replacement
-
-
Treatment: -
Control: Not randomized with treatment
Changing designs
No support!!!
-
-
-
Logging (that is utilized)
Observation unit


Assume version_id => treatment!!!
Log of non-zero segment aggregates in realized!!!
Log based on version level aggregates

Observation unit: Segment
Set of exposed users affected by some model type in treatment

Observation unit: Users
Logs at (segment, cluster) level
Observation Unit: “Virtual segment”!!! 
Otherwise same
- 
Note “version_id => multiple different treatments” in this case!!!



Takeaway 1: Improvements are about changing fundamental operations
What should stand out most to you is: Changes are (in some sense) small even with major projects. 

The experimental design changes brought by these products is
Exposed users = A change in the observation unit and its logging
Ads segmented experiments = Treatment policy that also depends on the ad (cluster)
Shared controls = Primarily an analysis change to pool multiple control treatments. Not really much of an experimental design change.

These tweak just one or two fundamental operations. When we properly implement fundamental operations, we don’t need to make hacks further down the stack to get things to work, we can support interoperability of improvements, etc.

Takeaway 2:  Lack of good operations causes “Correctness” problems
The other aspects that should stand out are
We are missing support to change designs in a valid way. 
What we use in analysis is not faithful to the definition of what we are analyzing (e.g. observed vs assigned segments)
Unless an experiment is in the highest pri universe, an experiment’s definition does not necessarily define the treatment received (i.e. the dilution problem). 

It should not be surprising that these problems in experimental design cause “Correctness” problems such as
Problem 1: Unlogged, backdoor design changes 
Problem 2: Dilution, Split universes, and Side effects on assignment
Problem 3: SEVs from almost, but not quite right, logging.

Example: Bad or Problematic experiment designs

Another reason to think about and implement fundamental operations is that it helps us avoid the next problem.

Problem 4: Pursuit of bad experiment designs

To illustrate this, let’s look at two experimental designs that did not make it to production: Request level ABTest and an early version of Ads Segmented Experimentation. The table below illustrates the design choices of each. Again ‘-’ represents sameness with vanilla ABTests.


Operation
Request level QRT
Early Ads Segmented Experiment
Final Ads Segmented Experiment
Experimentation Unit
(Segment, short time slice)
(Segment, Ads Cluster)
-
Population
Set of available segments at experiment creation time ⨉ time slices
Segments ⨉ 1 chosen cluster
-
Treatments
-
-
-
Treatment grain + program
Ideally, experimentation unit
In reality, ???
Experimentation unit
Grain: (Segment, Ad Cluster)
Protocol: Choose a pair of treatments for each segment to create a variance reducing “blocking” design
Treatment assignment
Sample without replacement
-
-
Changing designs
-
-
-
Logging (that is utilized)
Observation unit


Observation unit: (Segment, treatment)??
Logs at (segment, cluster) level


Logs at (segment, cluster) level





Request QRT: No units were thought through clearly in this effort. The experimentation unit of a “request” did not align with users, i.e. what’s needed for a valid randomized controlled trial. The observation unit may not have aligned with what we could realistically measure for conversions. The treatment could not be reliably delivered at the desired grain due to caching. Given all these issues in the design, all there was to do, was conduct a post-mortem. 

Ads Segmented Experiments (ASE): The fundamental idea behind ASE is an interesting and potentially powerful observation. However, the early design had a flaw that created a difficult to answer correctness question. In particular, the population was not the true overall population. Because of that, ASE would need to demonstrate its estimate of the lift would generalize well to the overall population. 

Reasoning more carefully about the units and treatment protocol using very traditional ideas of experiment design (involving analogies to farming Clustered ABTest analogy ) let us keep the units and population the same as regular ABTest. This eliminates the problem of differing populations while still getting all the benefits of ASE (and tossed in a little more variance reduction too!). 

Example: Other experimental designs in industry
This gives some more examples from the SOTA in industry for those interested. Feel free to skip this.

Operation
Clustered Experiments
Crossover / “Switchback” designs
Cookie Cookie-day
Experimentation Unit
User cluster
Varies (user, locale, etc)
User (aka cookie)
Population
All clusters
-
-
Treatments
-
-
Continuous treatment (long term aka “carryover” effects) vs
Sporadic treatment (short term) 
Treatment grain + program
User
User ⨉ time period
Swap treatment / control every period
Grain: User ⨉ day


Treatment assignment
Sample without replacement
-
-
Changing designs
?
?
Changing length, changing sporadic treatments 
Logging (that is utilized)
Observation unit


Observation unit: User
Observation unit: User ⨉ time period


Observation unit: User ⨉ day




ABTest actually has relatively few or modest structural problems with their experiments. In contrast, products like Messenger or Uber have very strong interaction effects among users (or drivers in the same market). They apply methods like Clustered Experiments or “Switchback” designs so that they have experimental units that behave more independently while at the same time they have a finer grained treatment grain and observation unit that allows them to boost tests’ power with some modeling assumptions in their analysis. 

QE: A Brief History and its advantages:
Another way to look at the importance of fundamental operations is to look at the design of Meta’s other experimentation platform, which did incorporate some of these notions. 

QE is the brainchild of Breno Roberto while myself, Dean Eckles (who now organizes CODE@MIT), and Eytan Bakshy helped lay out the requirements in its design (with all of us in CAS at the time). We made design choices that enabled us to perform fundamental operations. Specifically, we ensured
A notion of treatments (via parameters) [op 3]
Ability to modify the design by adding new groups or in combination with GK [op 6]
A clear treatment population via Exposure logging [op 2, 7]

The design of QE lets users define the experimentation unit [op 1] and the system then chooses the treatment grain = experimentation unit [op 4] and treatment assignment = random sample [op 5].

QE: More advanced capabilities
One consequence of building QE this way is that QE/Deltoid is almost a decade ahead of ABTest for several important capabilities. Adaptive Experimentation / Bayesian optimization (the continuous analog of Multi Armed Bandits) existed in QE/Deltoid since roughly 2016 because we had a proper record of treatments and the ability to modify experiments. Exposure logging and its large variance reduction benefits existed from nearly the beginning of Deltoid. And experimenters have always been able to iterate on running experiments. 

It’s also noteworthy that we made these choices without input from customers but based them on our scientific knowledge of how experiments should be run. That is we consulted the statistician, not the customer.
QE Correctness: Definitions matter. Good functional behavior follows.
A second important quality of QE + Deltoid is that it suffers from almost no “correctness” problems in its platform. This is because its implementation is based on a faithful implementation of every defined quantity. It is not based on whether a quantity “behaves” correctly.

With its exposure logs, it keeps track of the exact population and counts it accurately. It does not infer the population from metrics like ABTest does. Likewise, when treatments are rolled out and more users are added to the experiment, we ensure every user is measured the exact same way, even if this means including measurements before they entered the experiment. Unlike ABTest, this means we are sure we obtain correct results even as experiment sizes are changed. When experimenters make potentially correctness breaking changes to individual test groups, we apply pretty powerful imbalance checks to ensure the fundamental populations remain comparable. All of these were conscious design decisions that were actively discussed as well. In retrospect, I thought very little of those discussions at the time, but they’ve turned out to be important in ensuring the correctness of the platform.

Opinion: The relative unimportance of unit tests.
In general, to me this also speaks to a difference in solid mathematical programming and general software engineering. In my own research, I’ve made tons of programming errors. And the single practice which reduced my own errors the most was to write down all the equations and definitions, translate that to pseudo code on paper, and implement exactly what I wrote down and proved the correctness of. 

In contrast, unit tests for mathematical calculations are often worthless because there is no reliable baseline calculation. I’m certainly not going to be calculating things more reliably by hand. This is not to say that all unit tests are useless for mathematical programming. In particular, simulation studies play an extremely important role in validation. However, my opinion is that while unit tests remain critical in any software platform, when it comes to mathematical components, they are not the panacea they are sometimes made out to be.

What’s next?
Moving to the next stage: The API
So far I’ve described the internal operations that Experiment Design should try to support. Now I define the contract that it makes with the next stage. There are only three things in this contract:
The population and observation unit
Reconstructable inclusion probabilities (on sets of observation units)
A record of the treatments applied

With these, the downstream data and compute infra will know what measurements to make, and the analysis knows how to combine everything into meaningful estimates.

Possible improvements
There are a number of potential improvements. However, I point out only one because my next intended note is on the Computation Layer as we look at unification efforts in ABTest. And while each component has independent operations it carries out, sometimes specific choices made in each component work better with downstream components.

The suggested improvement is to introduce a fundamental experimentation unit, a fine grained “subsegment” that is shared across all universes. It provides a better way to record all the treatments that apply to each user, and it lets us avoid multiplying expensive computations by the # of universes. In principle, it could let us analyze all experiments in all universes all in go in a dataframe where the # of rows = # subsegments. At least we could if we supported linear regression.

Goal of Experiment Design: Effective and Efficient use of Supply

We have mostly discussed the importance of approaching the design of experimentation systems in terms of building out fundamental operations for tasks that matter in running experiments, and not in terms of theoretical behaviors like iRev enablement. And in particular, we’ve dug into the operations needed in the Design of Experiments. But let’s take a further step back and look at why we should care about the Design of Experiments. The purpose of experimental design is
Effectiveness: Being able to identify the causal effects of interest (Identifiability is the technical term)
Efficiency: Do so with the fewest resources
Reality of Supply: No additional supply
The reality of “supply” is that there is no method that can create additional supply. There is only more efficient use of supply e.g. more Effective Supply. 

For example, claims like that of Request QRT to increase the supply of independent units just don’t fit with reality. For ranking model treatments, we basically have the following
Supply of independent units (ignoring calibration problems) = (# of users) 
Supply that we tend to be comfortable treating as independent units when randomizing = (# users) * (# of model types)
Supply of non-independent units = (# of total ad auctions).
These holds regardless of the number of universes we have, how much “dilution” there is, etc. 

Efficient use of supply:
Instead of trying to manufacture fictitious supply, a better way to approach the problem is to figure out how to best utilize the supply. These can be from changing the treatment grain or protocol like with Ads Segmented Experiments or by better utilizing logging of treatments, like with Shared Controls.

The first requirement to effectively use supply is to be able to record all treatments. 
The second is to allow for better manipulation of treatments. 


Conclusion
This lays out an independent perspective and a “post-mortem” of sorts on experimentation systems and their design. It raises the question if we are setting good goals and if the evaluation criteria ABTest uses is conducive to building a great product. It also sets up a framework for wholistically designing a good experimentation system, and provides some details for one component, Experimental Design.
