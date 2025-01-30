---
id: 70bw9wt3i2cn268jrxtjo8b
title: Basics Of Lucene and Inverted Indiex
desc: ""
updated: 2024-12-15T22:35
created: 1641906859232
---
.

[Twitter Search](https://docs.google.com/drawings/d/1qOdTbwsBYQ65XtxucVac01HI8a5yHMNB3i-mKD570XE/edit).

Mostly taken from [This conference talk](https://www.youtube.com/watch?v=KUmFJc3fFuM&ab_channel=Lucidworks).

- Tweets- per-seconds: 150k
- more than 2\*10^9 search queries per day
- Latency between tweeting and them beeing searchable &lt;10 seconds

## search ARchitecture

Creating an inverted index.
Sorted index - tree map in java?

## TreeMap ^treemap

Can be implemented as a  balanced Binary tree (like red-black tree)

Sr. No.	Algorithm	Time Complexity

1. Search	O(log n)
2. Insert	O(log n)
3. Delete	O(log n)

| Operation | Time      |
| --------- | --------- |
| Search    | O(logn)   |
| Insert    | (O(logn)) |
| Delete    | O(logn)   |

Can do range queries...

## Another index

[Lucene Internals Talk](https://www.youtube.com/watch?v=T5RmMNDR5XI&ab_channel=LuceneSolrRevolution)

| termNo | Terms  | docids |
| ------ | ------ | ------ |
| 0      | data   | 0,1    |
| 1      | index  | 0,1    |
| 2      | lucene | 1      |

But difficult to update...
So same data as in a tree

# 

Check out also [General Search](https://app.excalidraw.com/s/1o3Skjxn05c/4C5rccysS5A)

and
[Twitters search in a bit more detail](https://app.excalidraw.com/s/1o3Skjxn05c/66MrgTm9HMM)

