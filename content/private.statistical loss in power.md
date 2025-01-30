---
id: 1yfd7pd2yv3kilyc0vndzf2
title: Statistical Loss in Power
desc: ""
updated: 1733703625724
created: 1733703584942
---
Storage savings vs (small) Statistical loss in power: Quantifying the trade-offs when reducing the number of segments
Tl;dr: Coarsening segments can significantly reduce our storage with minimal loss of power. However, we may need 100+ coarsened segments per version, so that a 1000 segment version would provide a 10x savings.
How much statistical power would we lose by using Fewer, coarser segments?
This is the critical question for both precomp storage reduction efforts and efforts to build a streaming (in-memory) aggregation system with A2X.
We take a fixed size of experiment and coarsen (or subsample) its segments until there are k coarse segments. Our theoretical analysis shows
Our original target of 50 coarse segments per version would have ~3-4% worse statistical efficiency (i.e. would require 3-4% larger experiments to achieve the same power) and may be coarser than desired.
100 coarse segments per version would have ~ 2% worse efficiency, 200 would have < 1%.
If we pool estimates across more than 2 versions we can obtain even smaller hits to efficiency.
The plot below shows the relationship between loss of power and number of coarse segments k. The black line is the estimated efficiency calculated using a grid, the blue line is a quick approximation that equates loss of power with average CI width changes (note that ABTest’s topline “platform MDE” metric is nearly useless in the problem as it looks at the average std error and the std dev is not changed by segment coarsening), and the red line uses the same approximation but plugs in half the number of coarse segments in place of the real number of coarse segments.
No photo description available.
The details:
“Coarsened” segments
By k coarsened segments, we mean that from an initial s segments in a version, you can
Randomly select k segments without replacement
Form k groups of exactly s/k segments each
Randomly hash the s segments into k groups where the groups have sizes that are Multinomial(s, 1/k, …, 1/k) distributed, and keep track of exactly how many segments went into each group.
It may be surprising that the above procedures yield the same asymptotic variance estimates. To see this, note that if segments are normally distributed N(0,sigma^2), then s/k segments summed together are N(0, sigma^2 * s/k) distributed. Since s/k is just a constant, it contains no additional information for estimating sigma^2, so the s/k segments have exactly the same information as a Normal(0, sigma^2) random variate for estimating sigma^2. Likewise, if you know exactly how many fine segments went into each coarsened segment, the information about sigma^2 in each coarse segment is the same. Any improvement from the latter coarsening procedure only comes from segments not being quite normal yet.

Also note that the empirical mean must be stored exactly no matter how we get the variance estimate.
The theory
Our CIs are based on the central limit theorem. The normalized sums, both user and segment level, converge to a normal distribution. However, while segment level sums converge to a normal, the segment-level variance estimates do not. Instead, they converge to a Chi-squared distribution with k-1 degrees of freedom where k is the number of segments. Under the null distribution, the difference in means test statistic converges to a t-distribution with degrees of freedom equal to 2*(k-1) where k is the number of segments per version.
One significance of this is that the variance estimates are noisier when the degrees of freedom is smaller, and the CI widths are also slightly wider on average. This can be seen from a t-table where the standard error’s multiplier is larger when the dof is smaller for any given significance level. If a version with 1000 segments is carefully coarsened to 50 coarse segments, then the resulting t-test has 98 degrees of freedom resulting in ~ 1% wider CIs on average. However, this result is just for the null distribution. For a proper power analysis, we must account for the effect size as well. When there is a non-zero effect size, the test statistic distribution converges to a non-central t-distribution. Thus, for any given effect size, we know the sampling distribution of the test statistic and can evaluate the power. This is done in R with the function power.t.test. This part must be done numerically as the non-central t-distribution is hairy just to write down, much less analyze, but does not require empirical data.
The evaluation
We use the statistical notion of Efficiency in the evaluation. Efficiency compares the number of samples or resources needed to achieve the same power. Here, we use what is called Bahadur efficiency, which is a finite sample notion of efficiency for fixed effect sizes rather than the asymptotic notion of Pitman efficiency with shrinking effect sizes.
Note that ABTest’s topline “platform MDE” metric, which is just a scaling of the estimated std dev, is useless here. The true std dev does not change with the number of segments. This is similar to the case where we wish to compare metrics where the platform MDE estimator is also flawed and misleading.
The two key reasons for using efficiency. First, it captures basically everything we care about. Metrics like the platform MDE or change in CI width will underestimate the impact of changes as shown in figure 1. Second, it allows us to compare any change in methodology in the same units of measure (that is in resources segment-days). This holds for supply side efforts, detectability efforts, and here, infra changes.
Caveats and Notes:
Caveat 1:
This analysis is specific to the case where there are equal sized control and test groups when we use the estimators in QueryLib. This is important because if we applied QueryLib’s estimators to Shared Controls with coarsened segments, the behavior is worse. When the test and control groups are equally sized, there is no difference between a variance estimator that assumes the variance of the test and control are the same (a pooled variance estimator) and one that doesn’t (an unpooled estimator used in QueryLib).
However, when the group sizes are very unbalanced, the variance of the smaller group will dominate, and the unpooled variance estimator behaves like it has degrees of freedom (dof) equal to the number of segments in the smaller group minus 1. That’s half the dof of the variance estimate with equal sized groups. As a result, the std error estimates become more variable, and efficiency loss from coarsening becomes worse. We would be looking at ~8% loss in efficiency if the smaller group had 50 coarse segments.
On the other hand, if we applied a pooled variance estimator, the dof will again be the sum of the number of coarse segments (minus 2). This is yet another illustration of the deficiencies of QueryLib and the incorrect view that there should be only one variance estimate. This is also another example why analytical solutions for shared controls can be considered superior to experimental design (aka experiment setup) solutions.
Caveat 2:
When we reduce the number of segments, the CI widths become more variable. This is because we are reducing the amount of information for the variance while completely preserving the information about the sum or mean. This added variability is nontrivial. The coefficient of variation (i.e. the sd/mean) of a Chi-squared distributed variance estimate with d degrees of freedom is sqrt(2) / sqrt(d). For k=100 segments for 198 dof, this is 10%. That means the CI width can fluctuate by about +- 20% when we use only the information available in test and control, and no additional information we may glean from meta-analyses.
However, also note that the ability to tolerate more variability in the variance estimates without degrading power by much is exactly what we are exploiting to reduce storage requirements, so this nontrivial increase in CI width variability is expected. This is also why DP noise in the variance, even though it can be especially bad due to high sensitivity, typically shouldn’t hurt us that much.
Noncentral t-distribution - Wikipedia
en.wikipedia.org
Noncentral t-distribution - Wikipedia
The noncentral t-distribution generalizes Student's t-distribution using a noncentrality parameter. Whereas the central probability distribution describes how a test statistic t is distributed when the difference tested is null, the noncentral distribution describes how t is distributed when the nul...


 