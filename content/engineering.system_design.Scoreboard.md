---
id: x88107hefgbkiays65tj6c1
title: Scoreboard
desc: ""
updated: 2024-12-15T22:35
created: 1643216594659
---



We can:
1. For each user, keep bucket_id, and score. 
2. For each bucket, keep bucket_id, user_id, lower_bound,upper_bound, score, next and previous bucket pointers. 
3. The ranking table is split into buckets.
4. When the user score is updates, we:
 * update the user score
 * check if we're still in the same bucket, else delete user from bucket, go up or down bucket pointers, and add user to new bucket. Alternatively, we can first consult a the bucket table above, and we can figure out the appropriate new bucket .
 * evern 100 ms, sort each bucket in parallel, using insertion sort. If we detect some buckets have too many inversions,
 can switch them to merge sort (too many games in a given bracket).
* if sorting time for any bucket becomes too large (>e.g. 50ms), then split the bucket into two, 
move upper part of the user range to new bucket.
* We retrieve 10 above and bellow you in the same bucket. For edge cases where  you're the top/bottom 9 person in bucket- have 2 parallel 'bucket' sequences: e.g. percentiles 0,2,...,98,100, and percentiles 0,1,3,5,...,99,100, search for user in both sequences. At least  1 of them will contain the -10-user_rank;10 +user_rank interval completely (or can use the bucket pointers, mentioned before)

* For sorting the friend list: 
1. If friend list is undirected, maintain these equivalence relations sort and retrieve them
Then we use similar sorting mechanisms for each friend list.
Friend lists are equivalence relationships, every time a user plays a game, update their score, use a procedure as above.

2. If friend list is directed
Maintain list to show to each user.

For players with not many incoming friends (ppl who follow them):
Every such player is a pub-sub topic, to which ppl who follow them subscribe.
Then when game happens, the user publishes to the topic, and the topic publishes to all the users who follow it,
updating their 'friend' scoreboard w/ insertion sort.

For players with many incoming friends (ppl who follow them) :
Celebrity problem
Don't update follower scoreboard directly, but for each user, maintain a special list of celebrities they follow, and at
request- time, if there was update, insertion-sort them into the existing 'friend' scoreboards. 


  