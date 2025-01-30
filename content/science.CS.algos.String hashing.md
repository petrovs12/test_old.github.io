---
id: tm2mi24jb4x6gqhvfto9qt7
title: Rolling Polynomial string hashing
desc: ""
updated: 2024-12-15T22:35
created: 1659106935436
---
Pick a prime p and a large number m, not a multiple of p.
then it's obvious

![](/assets/images/2022-07-29-17-04-15.png)

We can also quickly calsulate the hashes of substrings.

Idk if we can also quickly check for partial matches (i.e. given a string and a potential partial string, check if really is partial).
I suppose it's not difficult...
#todo think about this and read more from [the cp algorithms page](https://cp-algorithms.com/string/string-hashing.html#search-for-duplicate-strings-in-an-array-of-strings)

# Rabin-Karp for string matching...s

Given a string $s$ and a text (alsostring) $t$ find if thereare matches of $s$ in $t$ and if so, enumerate them

Algorithm - calculate the hash of $s$ and the hashes of all $len(s)$ substrings of $t$, and compare them...

details for exercise...

# KMP, DP and preprocessing...

we make a partial match table, which allows us to see where the next possible match starts from, and start matching only from there...

