---
id: nrqh2ohuwvlov9o3or5jskg
title: "Algorithm:"
desc: ""
updated: 2024-12-15T22:35
created: 1642437591103
---
Used to test for set membership.
E.g. check if usernames have been used already. It's probabalistic, meaning that it'll return either **definitely not in set** or **possibly in set**. There's therefore a **false positive rate** $\epsilon$ involved.

choose a number $m$, which is the number of bits in the filter. Choose $k$ hash functions $h_1, h_2, ..., h_k: S->Z_m$, so they return numbers from $1 to  m$. Normally $k$ is small, depending on $\epsilon$ and $m$ depends on $k$ and number of items to be added (how?idk). 

0. Initialize bit-array of size $m$ with 0s.
1. **Operations**: **add(x)**,**contains(x)**.
2. **add(x)** calculates the $k$ hashes, and gets some numbers $h_1(x),...$. Set the bits $h_1(x),...$ to 1.
3. **query(x)** calculates the $k$ hashes, and gets some numbers $h_1(x),...$. Check if the bits $h_1(x),...$ are 1. If all are, return True (possibly in set). Else, return False (definitely not in set).

Can choose $m$ and $k$ so that it's quite reliable, but still use it for non-critical applications.
See (wikipedia)["https://en.wikipedia.org/wiki/Bloom_filter\#Probability_of_false_positives"].

### Use in Recommendation Systems ^recsys

We can use bloom filters to check if we have already presented a given product to a given user.
We can have a bloom filter for each user then and quickly filter if we should consider that for a given user.

