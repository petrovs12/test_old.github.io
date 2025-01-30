---
id: og5mf3gxby2xisfaudm5xx5
title: Fenwick Tree
desc: ""
updated: 2024-12-15T22:35
created: 1658947237784
---
Notes from [here](https://cp-algorithms.com/data_structures/fenwick.html#overview) ^4t3mq78xcqdo

this is an array of size N, which contains pre-aggregated information about another array of size N.

Can use to answer queries like 'interval sum', 'interval max', other folds of associative functions across intervals.

# Algorithm

Input;
array A,$len(A)=n$
function $g(i)$.
op (by default sum) - the binary group operation we're aggregating on

pre-compute the array $T(N)$.
Also, I think $T(i) = op(A[g(i),i])$ # this is probabLy not quite right though though.
to get the interval sum for $0,i$:

```
S=0
r=i
while i>=0:
  S+=A[i]
  i= g(i-1)
```

```
Update is similar,but in a waythe opposite (check out the algorithm)
```

## Examples for $g(i)$

### Identity

1. $g(i)=i$ sum is slow, update is fast
2. $g(i)=0 $ - this is prefix sum, sum is fast, update is slow 
3. construct g(i) as follows: 
   take all the trailing 1's of g, and flip them.
   this gives both update and sum of $O(log(n))$ 

$g(j) = j&(j+1)$

s

