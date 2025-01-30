---
id: mudo1n7jbe16i8qsu2py5lo
title: data science analysis distribution of comments per active user
desc: ""
updated: 2024-12-07T11:38
created: 1733567665943
---
(zipf/pareto/other power law heavi taileddistribution) of comments per active user


on hte long tail, there cuold be some kind of bump, reflecting different user behavior (e.g. spam, bots, etc., or artifacts in the data collection process).




Description
'News 24' is a large news platform that provides users with personalized feeds of live news, from both local and global sources. News 24 is used by >2B daily active users across the globe, where we simply define a “daily active user” as someone that accesses the platform on a given day. Users are encouraged to contribute by leaving comments below each news story, to share their opinion with others.

Question Statement
Question 1:

(draw a pair of axes on the board, y-axis labeled '#active users, x-axis labeled '# comments given').

Based on the information available, ask the candidate to draw the shape of the distribution of active users based on the number of comments they left on News 24, across all news stories.

This should be based on data for 1 day, e.g. yesterday.

As a prompt/hint, you can tell TC: On each day, most active users leave very few comments (or no comments at all), while a minority of highly engaged users leave multiple comments on several news pieces.



Answer 1: 

The distribution should be right-skewed, with a long tail. Most likely we expect a monotonic decreasing distribution as it’s unlikely there are peaks (modes above 0). However, if some people think that there's a maximum, that's still ok. A symmetrical distribution is not a good answer as the distribution takes only positive values, and we know there is a large mass near 0 (users that leave few comments) as well as a long tail (highly engaged users).



Question 2: 

Estimate median, mean, p95 of the distribution you plotted. Do you expect these values to be integers?

Note that if on the previous question the candidate insisted with a symmetrical (or left-skewed) distribution, before asking question 2 you can tell them that from now on we assume this distribution is right-skewed and ask them to plot a right-skewed distribution.

Answer 2: 

The actual numbers estimated are not very important, as long as they are not unreasonable (e.g. in the thousands).

Likely we’ll have median =0, but anything that isn't too big is ok here. Also likely mean < p95, but it’s ok if the candidate believes the opposite.

It is important though that TC recognizes that median < mean, given the shape of the distribution.

Also TC should know that median and p95 are integers, while mean is likely not.

Some candidates might say that median could be a non-integer if we have an even number of users, as in this case they would define the median as the mid-point between the number of comments for the 2 central users after ordering them.

From a theoretical point of view this is ok, but considering we state that there are >2B active users and the number of daily comments are generally very low, the chance that we get a non-integer is very close to 0. TC should be challenged on this.



Question 3:

Assume we now randomly split all active users into segments of 10k users each.

For each segment we compute the average number of comments.

What do you expect the distribution of the segment averages to look like? What do you expect to be the mean, median, p95 of this distribution?

Answer 3:

This is normal by CLT. Mean=median is the mean of Q2. It's important that the candidate makes the connection that the mean of this distribution is the same as the previous question.

It's a red flag if they don't.

P95 can be computed as mean + 1.645*sigma/sqrt(n), where sigma is the standard deviation of the distribution in q1 and n=10k.

Candidates might be able to write the formula, but it's important to challenge them about what sigma and n represent in this case.

It is ok if the candidate doesn’t remember the correct z-score.



Question 4:

Let's assume that you track the average number of comments day by day.

One day you suddenly see a spike from ~ 2 comments per day to ~ 3 comments per day.

What are your hypotheses for why this happened?

Answer 4:

TC could make a lot of hypotheses, e.g. about changed user behaviour or impact of products launched.

The goal of this question is to have TC recognize that such a change in a day is huge and unlikely due to 'normal' user behaviour or small changes to the user experience.

Reasonable hypotheses could be:

Major change to user experience, e.g. if we launch a new commenting feature
Major change in the user demographics, e.g. due to launching the product to a new geography
Bug: either in the product itself or in the data
Non genuine user behaviour, such as bots
We can assume that product changes and bugs can be validated directly by connecting with the product team.

If we assume that there were no major changes/bugs from a product perspective, ideally we would like the candidate to make a hypothesis about non genuine user behaviour, though it is still ok if they don’t, as long as their hypotheses are reasonable.



Question 5:

Assume we find that the cause is a large wave of fake user accounts.

We have research showing that genuine users still have an average of ~2 comments per day, while we have a set of new fake accounts and we estimate on average they post ~50 comments per day.

Based on this and on the fact that the overall average is now 3 comments per day, can you estimate how many fake accounts there are (as a fraction of total)?

Answer 5:

Denote by p the fraction of fake accounts.

The overall avg number of comments is a weighted average of the avg for fake accounts and the avg for genuine accounts, with weights p and 1-p.

This translates into the following equation:

3 = p* 50+ (1-p) *2.

By solving the equation in p, we find p=1/48~2.1%



Question 6:

Assume we need to find a quick way to remove fake accounts from the platform.

As we know by now that users with many comments tend to be fake, we

define a very simple classifier that flags accounts as fake if on one day they give > x comments (for some threshold x).

Do you believe this is a good classifier?

Which metrics would you use to evaluate it?

Answer 6:

We want the candidate to understand the clear drawbacks of this approach, as this is likely not going to be an accurate classifier, and also we risk removing from the platform all the most active genuine accounts.

The most obvious metrics to define this classifier are accuracy, false positive rate, false negative rate.

This is supposed to be a high level question, so no need to ask the candidate for exact formulas for the metrics they mention.