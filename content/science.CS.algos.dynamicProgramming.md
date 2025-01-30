---
id: tx4weedff8ej714af6c0kfl
title: Dynamic programming
desc: ""
updated: 2024-12-15T22:35
created: 1641824312181
---
## Shortest path problem in DAGs

$G={V,E}$

<!-- $dist[v] = min(dist[u] + l(u,v) | u,v \in e})$ -->

as the dag is linearizeable, the above will never go back to the same node.

$dist[v] = min(dist[u] + l(u,v) | (u,v) \in e)$

## Knapsack problem with DP

- Input: capacity C, items {(w,v),...}
- Output: max value V

Solve the problem by dynamic programming. Let $f{i,w}$ be the max value, achieved by using the first i items and at most w weight.

- $f(i,w) = max{f(i-1,w), f(i-1,w-w_i) + v_i}$
- if i==0 or w==0, f(i,w)=0
- if w&lt;0, f(i,w)=$-\infty$
- V=f(n,C)

  Memoize

  ### Longest Increasing Contignous Subsequence
- Input: array A
  - Output: length of the longest increasing subsequence
- Let $f(i)$ be the length of the longest increasing subsequence ending at A[i].
  $f(1) = 1$
  $f(i)=1+f(i-1)*(A[i]>=A[i-1] ? 1:0)$

If noncontiguous

$f(i)=1+max_{j\in [1,i-1]}(f(j)|A[j]<=A[i])$

# Edit Distance

First operation is either:

- Insert S2[1] at first position of S1 (equivalent to delete S2[1])
- Insert S1[1] at first position of S2 (equivalent to delete S1[1])
- Replace S1[1] with S2[1] 
- S[1] match S2[1] so we continue

Let $E(i,j)$ be the edit distance between S1[i..] and S2[j..].
$E(i,j)=1+min(E(i,j+1),E(i+1,j),E(i+1,j+1) - (1  S1[i]==S2[j]))$

$$
\begin{equation}
x = \begin{cases}
        1 & \text{if } x = y \\
        2 & \text{if } x \neq y \\
        \end{cases}
\end{equation}
$$

### 67. Add Binary

**Given two binary strings a and b, return their sum as a binary string.**

Example 1:

```
Input: a = "11", b = "1"
Output: "100"
Example 2:

Input: a = "1010", b = "1011"
Output: "10101"
```

Constraints:

1 &lt;= a.length, b.length &lt;= 104
a and b consist only of '0' or '1' characters.
Each string does not contain leading zeros except for the zero itself.

Grade school addition- first reverse the strings, then use carry etc.

### 312. Burst Balloons

You are given n balloons, indexed from $0$ to $n - 1$. Each balloon is painted with a number on it represented by an array nums. You are asked to burst all the balloons.

If you burst the ith balloon, you will get $nums[i - 1] * nums[i] * nums[i + 1]$ coins. If $i - 1$ or $i + 1$ goes out of bounds of the array, then treat it as if there is a balloon with a 1 painted on it.

Return the maximum coins you can collect by bursting the balloons wisely.

#### Solution

_NB (Nota Bene)_

In the exposition intervals are 1- indexed, while in code they are 0 -based. 
Idea:
let $i$ be the index of the **LAST** balloon to burst in the interval [left,right].
Then when we burst $i$ we gain $nums[left-1]*nums[i]*nums[right+1]$ coins.
Why don't we need to make sure that $left-1$ and $right+1$ are still in play?
Because in the recursive calls to our subroutine (say $dp$) we have the $left-1$ and $right+1$ elements of the array as elements assumed to be burst **after** all baloons in the interval
$[left,right]$ are gone.
We prepend and append $1$ to the array to handle the special case when we have $left-1$ or $right+1$ out of bounds and adjust the loop accordingly.

```
from functools import lru_cache

class Solution:
    def maxCoins(self, nums: List[int]) -> int:
        if len(nums) > 1 and len(set(nums)) == 1:
            return (nums[0] ** 3) * (len(nums) - 2) + nums[0] ** 2 + nums[0]
        
        n = len(nums)
        nums = [1]+nums+[1]
        
        @lru_cache(None)
        def dp(lind,rind):
            if lind>rind:
                return 0

            best = float("-inf")

            for i in range(lind,rind+1):
                gain = nums[i]*nums[lind-1]*nums[rind+1]
                rest = dp(lind,i-1)+dp(i+1,rind)
                best = max(best,gain+rest)
                
            return best
                        
                    
        
        
        
        return dp(1,len(nums)-2)
```

[[science.CS.algos.matrixChainMultiplication]]

## <https://leetcode.com/problems/minimum-score-triangulation-of-polygon/>

[1039. Minimum Score Triangulation of Polygon](https://leetcode.com/problems/minimum-score-triangulation-of-polygon/)

ou have a convex n-sided polygon where each vertex has an integer value. You are given an integer array values where values[i] is the value of the ith vertex (i.e., clockwise order).

You will triangulate the polygon into n - 2 triangles. For each triangle, the value of that triangle is the product of the values of its vertices, and the total score of the triangulation is the sum of these values over all n - 2 triangles in the triangulation.

Return the smallest possible total score that you can achieve with some triangulation of the polygon.

Example 1:
![](/assets/images/2022-01-10-15-42-44.png)

Input: values = [1,2,3]
Output: 6
Explanation: The polygon is already triangulated, and the score of the only triangle is 6.

```{python}

```

# Vazirani Chapter on Dynamic Programming

#dynamic_programming
_Algorithms Vazirani_
[Vazirani Intro Book](http://algorithmics.lsi.upc.edu/docs/Dasgupta-Papadimitriou-Vazirani.pdf)

### Dynamic Programming Chapter

* * *

Dist in dag- algo

```
1. linearize nodes in graph
2. for each v in V, in linearized order:
    dist(v) = min_{u,v in E}(dist(u,v)+l(u,v))
```

linearize by topo-sort
topo-sort is dfs with looking at completion time

* * *

linearization of collection of sybproblems, solving after solving previous (and caching result).

* * *

longest inc subsequence:

Solve as follows
a(i)->len of longest increasing ending here
Input: $nums$
$a(i) = 1+max(a(j)|j<i,nums[i]>nums[j])$

* * *

dp- problmes are a bit smaller, not times smaller like divide and conquer...

* * *

