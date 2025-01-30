---
id: hmhvnnienwlsf018m8un50l
title: Random
desc: ""
updated: 2024-12-15T22:35
created: 1643308084015
---


Design Local Search
 
TL;DR:
The interview itself was good IMO, but I had a lot more to show and the drawing part was poor,
so I'm not sure how I feel. Also at one point I got a bit confused about a specific thing
(building a global user-similarity model, rather than learning it's embedding within an already-made
location model).
I don't have a very certain opinion how it went (well or poorly). I couldn't say all of the things prepared, and drawings were bad, but they were also stopping me to focus on some specific things, and 
seemed engaged enough in the discussion. But idk.


------------

It’s a variation of the ‘design local search’ question, so I first explained briefly the
quadtree algorithm and then explained I'll accept the search as black BOX except one of the 
3 types of entities to consider will interact w/ the search engine. The search 

 They wanted mostly to see how data would flow, but I don't think I drew that well. 
 However, the conversation was going relatively smoothly and the discussion did not stall.
 However, I didn't manage to have a nice flow of the story end-to-end.


Then I said we have 3 types of entities to consider that we want to make an embedding off:
* Locations/ Places
* Users
* Queries (interacts w/ the search engine)

Mentioned content-based vs collaborative filtering and decided a nice 'primary' model would 
start w/ content-based entity embedding, as 'entities' are kind of independent of the user.
(same for queries)

Then I mentioned probably we can do a 'secondary' model w/ user-location embedding, using 
regularization to 'shrink' towards the basic entity model.

Mentioned how the query model would work, there was a bit of forecasting and how recommendations
would depend on time-of-day, working times, holidays, event list at the venue etc. and

Overall I focused a bit more on the featurization, as the questions were more in this direction;
I spoke about sequence of models, cold starts (new locations/ new users).

Spoke about how to incorporate user friend list in the models. 
Mentioned fairness.

However overall I didn't draw very much and maybe it was a bit scattered. The interviewer was
stopping me here and there to focus on specific aspects on what data to use, how to combine the models, etc.

At one point I got a bit lost in the sens of building an overall user embedding model, rather than one that uses the __place__ embedding, and the interviewer pulled me back.

I missed the 'number of visits time series' feature in the place embedding, but I think it's a good idea to include it. I put it in the whiteboard after the interview ended (with a note it's after). We touched on a very closely related point of how queries depend on time features.
 I spoke quite a bit about target, mentioned offline vs online measurements.

 They mentioned A/B testing and then asked what my KPI's would be.
 I discussed the different tiers of signals I would use (most important, but sparse one, would be "conditional expectation of rating", then prob to click, prob to visit w/o rating, probability 
 they use the service every time they travel).
  Mentioned Mean Absolute precision (mean of cummeans of 'relevances' of thigns in the presented list) as possible measure of the models.

 For negative signals I mentioned leaving bad rating, not clicking, searching right after that w/
 a different phrases, etc.

 Didn't speak enough about the 'model tiers' - candidate generation, scoring, and re-sccoring and ordering.  It felt a bit unnatural in the flow, as I though the search would kind of take care of that in the sense of returning relatively few results. 
 The use case stated was posed as 'I'm on the train, wanna see where I can go during my business trip', so it was implied the num results wouldn't be in the billions, thus reducing need for so many filtering layers. 

 This might not be true, but it wasn't immediately obvious for me, so I didn't talk about it.





Design scoreboard for a game
Every 50 ms, show:
1. your current position, 10 players above and bellow you
2. Ranking of your friendlist 
3. Top 10 board

tl;dr 
I hadn't seen this one. Issue is scoreboard has 10^8 users and needs to be re-calculated 20 times a second. we have about 200 games/second.
I proposed when someone plays a game, we figure out their new place in the scoreboard (O(logn)), lock the
positions between current and new position, make the update.
We keep track of currently locked positions w/ some kind of interval tree and if we can't make an update right now, as the interval is locked, we go into a queue for this specific interval.
I think the interval tree locking business is also O(logn) and it's probably workable under normal operations. We discussed this approach quite a bit and the guy was quite skeptical and asking lots of questions. Also he had VERY difficult accent (for me) so we lost maybe 2-3 minutes out of the interview repeating things and stuff.

 Essentially we got stuck on the distributed update/sorting approach for long time and didn't have time to do much else.

 He asked me how I would make the scoreboard efficient for reading as well;
  I did mention how to partition the scoreboard into intervals (which lead me to realize bucketsort is way more elegant). So I mentioned that in the end of the interview.

There were a couple of more requirements we didn't end up doing, like the friend list (a variation of the hybrid fan-out and fan-in approach w/ the celebrity problem maybe?).

I put those into an e-mail to the reqruiter, as I was quite mad at not seing the bucket sort solution faster, as the remaining part of the design flows very naturally from there and 15 minutes after the interview I had a paragraph with the outline.  
 Reqruiter said maybe he'll show it during the debrief if needed.


I didn't get to the optimal design, but mentioned it in the end for 10 seconds while we were doing the chit-chat, as I realized it. So ,I think optimal design is to have the global leaderboard bucket-ized as rankings, when you play a game an update your rating, you write there, if needed move in another bucket, then every 0.05 seconds you re-sort the buckets (can decide how to re-sort based on number of new ops in bucket, i.e. if very few operations operations do insertion sort).


Behavioral

I think it went fine, I said my stories and she was like 'fine'. Asked maybe 4-5 questions, only one
not on the story list was somethign like 'what kind of people don't you work well with'. I said ones that take credit for other people's work, overpromise stuff they're not licensed to, and ones who don't have the customer's best interests in mind. 