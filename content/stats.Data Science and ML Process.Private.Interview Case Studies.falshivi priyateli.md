---
id: 9k3noacfxau7dnt6cxknqec
title: falshivi priyateli
desc: ""
updated: 1733565837624
created: 1733565577969
---

Fake accounts are a common type of problem for online social networks. Many of those attempts are made by bots for the purpose of spamming users or directing users to abusive sites like ad farms. While most attempts can be blocked before a fake account is created, a small number of them can manage to be created successfully.



Let’s consider a large social network platform, where people can friend each other, and share content between friends.

# Question Statement
[Part 1] Measuring the problem


## Question 1 

[Agility, Metrics]: How could we find out if friend requests from fake accounts are an issue?

There are two parts of this answer. One is some indicator of abuse, it could be user reports (of abuse), accounts that are diabled for abuse later, or one can sample some accounts and evaluate whether they are fake/abusive or not.

Another part is about how to aggregate the metrics. It may happen at different levels and it’s a good sign if a candidate can talk about tradeoffs of various aggregation levels.

% friend requests being reported on / from known abusers (~ prevalence)
% users who reported at least one fake friend request or received a request from a known abuser (~ reach)
% new accounts being reported on as abusive  (~ fake prevalence in new accounts)
The candidate may suggest sampling some accounts and evaluating whether they are fake / abusive. Some candidates may already suggest at this stage: looking at how many friend requesters send a high volume of requests but are rarely accepted, classifying them as **presumed fake, and then measuring the prevalence and reach of requests** from this population.

This shows creativity **going beyond reported fakes** to **estimate the true extent** of fake requests.



Question 2 

[Agility, hypothesis]: What do you think are the signs of potential abuse accounts?

Potential suggestions candidates may make include:

Sending a large number of friend requests at the same time (if the number is extremely large, could be a sign of abuse)
Friend requests acceptance rate
A large number of accounts behind the same IP/device
Bot like behavior - activities across different locations at the same time. Abnormally high frequency of likes/posts/reshares
User reports about an account
Patterns on profile (reusing bios, photos, sparse information)
How long ago the account was created (maybe accounts tend to be relatively new?)
The country for the IP address on the account

[Part 2] Probability of fake friend requests
We know fake accounts are more likely to send friend requests because building an audience is often an important step to prepare for abusive activities later.



Question 3 

[QA]: Let’s assume 5% of the users of the social network are fake accounts and on average a fake account sends 10X as many friend requests as a non-abusive account. What’s the probability of a random friend request being sent from a fake account?

0.05*10 / (0.05 * 10 + 0.95 * 1) = 0.5 / 1.45 ~ about a third (34%)


Question 4 

[QA]: If we sample 5 random friend requests, what’s the probability that at least one of them was from a fake account?

Roughly 1-(2/3)^5  = 1- (4/9)*(4/9)*(2/3) ~ 1- 0.5*0.5*0.66 ~ 85%  (87%)
Answering 1-(2/3)^5 is good enough and the interview can give 87% number
That’s very problematic since a **small number of fake accounts** can have an **outsized impact** on users’ friending experience.



[Part 3] Fake account classifier / evaluation
(Q5 is a follow up for candidates who breezed through Q3 and Q4. Skip Q5 if the candidate struggled on Q3/4.)



Question 5 

[QA]: Let's say someone **built a classifier** that they claim correctly identifies an account that is a fake account as "fake" in 95% of the cases and equally an account that is an authentic account as "authentic" in 95% of cases too. This means P(positive | fake) = 0.95 and P (negative | authentic) = 0.95. What is the probability that an account is fake given it's labeled positive by this classifier?

P(fake | positive)

= P (positive | fake) * P(fake) / P(positive)

= P (positive | fake) * P(fake) / (P (positive | fake) * P(fake) + P (positive | authentic) * P(authentic))

= 0.95*0.05 / (0.95*0.05 + 0.05*0.95) = 50%

There is only a 50% of chance that an account detected as positive is fake.



Question 6 

[Agility, Metrics]: As we can see in the previous question the metrics the person quoted aren't suitable for understanding how well the classifier works in practice. If we were going to build a classifier that flags abusive accounts to be enrolled in a system to verify their identity, how would you evaluate the impact of such a system?

A strong candidate would think through the cost of FP and FN and how to detect FP / FN.
FP:
% of people passing the challenge / verification system.
Cost: some users may churn (extra friction) or find it annoying -> impact to growth
FN:
prevalence of abusive accounts. Accounts that are later reported/actioned on for abuse
Number of abuse reports. Impact: more abuse in the system

