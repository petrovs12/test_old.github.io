---
id: aj0xczys5jgpcu9ph7dli17
title: BQRT_MDE_Notes
desc: ""
updated: 2024-12-15T22:35
created: 2024-10-08T15:03
---

#mde 
#stats
#experimental_design
a. recorded in bqrt_mde table
b. [Internal Login](https://fburl.com/code/y4wvx3ad)   code pointer for this
"100 * (
            INVERSE_NORMAL_CDF(0, 1, 0.95) + INVERSE_NORMAL_CDF(0, 1, 0.8)
        ) * SQRT(2.0 / COUNT(DISTINCT segmentAggregates.segment)) * STDDEV({0})
            / ABS(AVG({0})) AS {0}_mde""".format(
        metric
)
Mde calculation for significance level 0.95 and power 0.8:
$$\Phi(0.95) + \Phi(0.8) \times \sqrt{2/N} \times \frac{\sigma}{|\mu|}$$
where $\Phi$ is the inverse normal CDF, $\sigma$ is the standard deviation, and $\mu$ is the mean of the metric.
c. initial power estimations here [Internal Login](https://fburl.com/code/iwge74mm)
d. [Internal Login](https://fburl.com/code/iwge74mm)
are the segments here the same...