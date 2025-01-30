---
id: yk5cs9ax4gkq7acviu3f3ii
title: Least Common Ancestor
desc: ""
updated: 2024-12-15T22:35
created: 1641981602342
---
#TODO 

[Read this and rephrase solution](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/solution/)

# Leetcode 507. Perfect Number

A perfect number is a number that is equal to the sum of its positive divisors, excluding the number itself.
let $x$ is a number.
Let's think about $n=kl$ then sm(kl)=sm(k)_sm(l)+k+l (?).
Example:
$sm(4) = sm(2)_sm(2)+2$

# [Exclusive time of Functions](https://leetcode.com/problems/exclusive-time-of-functions/)

- Process logs in order and put them in a stack
- 'start' log is opening bracket
- we keep 'time wasted' variable, initialized at 0. It is always re-initializied at 0 whenever the stack is empty. So the 'slate is clean'
- 'end' log is closing bracket. If we get an end log, then the previous one is it's 'start' counterpart. Record time $time(end)+1-time(start)-timeWasted$ for this process in the array. 
  Reason for the timeWasted is this time was actually used up by other processes and accounted for already. Reason for +1 is just the way the problem does the bookkeeping, i.e. start 1 means 'start at BEGINNING of period 1', while end 2 means 'end at END of period 2'.
   We then re-initialize timeWasted as simply $time(end)-time(start)+1$ is stack is non-empty ans $0$ is stack is empty.
- O(n) time, O(n) space

[Custom Sort String](https://leetcode.com/problems/custom-sort-string/)

We're given 2 strings, 1 of the order and 1 of the actual string. have to re-sort the actual string like the order is sorted.

```
Input: order = "cba", s = "abcd"
Output: "cbad"

```

Use a Counter to represent the actual string and re-build from scratch in an obvious way. 
need also a $set$ to hold the chars in the string, but not
in the order.

[Toposort solution also possible, check it out.](https://leetcode.com/problems/custom-sort-string/discuss/1704409/Python-3-solutions-(hashmap-lambda-in-sort-and-Topological-sort))

#TODO 

[Balance a Binary Search Tree](https://leetcode.com/problems/balance-a-binary-search-tree/)

Algorithm:

- Build a sorted array via in-order (left,top,right) traversal of the tree.
- Re-build a new tree from the array.

```{python}
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def balanceBST(self, root: TreeNode) -> TreeNode:
        # step 1: build arr via in-order traversal
        arr = []
        
        def dfs(nd):
            if not nd:
                return
            dfs(nd.left) #left
            arr.append(nd.val)# root 
            dfs(nd.right)# right
        dfs(root)
        print(f"{arr=}")# check
        assert sorted(arr) == arr # check

        # step 2: re-build tree recursively from arr
        n= len(arr)
        # take care for off-by-one errors
        def build(lo=0,hi= n):
            if lo>=hi:
                return None
            else:
                mid = (lo+hi)//2
                curr = TreeNode(arr[mid])
                curr.left = build(lo=lo,hi=mid)
                curr.right = build(lo=mid+1,hi=hi)
                
                return curr
        return build()
            
```

[Shortest Path in Binary Matrix](https://leetcode.com/problems/shortest-path-in-binary-matrix/submissions/).

Simple BFS. Maybe can use A\* to be fast but idk.

```{python}
class Solution:
    def shortestPathBinaryMatrix(self, grid: List[List[int]]) -> int:
        # idea:
        # use bfs
        m = len(grid)
        n = len(grid[0])
        def getNeighbors(cell): #O(1)
            i,j = cell[0],cell[1]
            return [(i+k,j+l) for k in range(-1,2) for l in range(-1,2) if 
                   abs(k)+abs(l)>=1 and 0<=k+i<m and 0<=j+l<n 
                    and grid[i+k][j+l]==0
                   ]
        if (grid[0][0]!=0) or (grid[m-1][n-1]!=0):
            #print(f"no end or beginning,{grid[0][0]=},{grid[m-1][n-1]=}")
            return -1
        # note: when we see a cell, we never need to update the distance to it!!
        from queue import deque
        q = deque()
        seen = dict()
        q.append(((0,0),1))
        while q:
            cell,dist = q.popleft()
            if cell in seen:
                continue
            else:
                seen[cell]=dist
            potentialNeighbors=getNeighbors(cell)
           # print(f"{cell=},{potentialNeighbors=}")
            for nb in potentialNeighbors:
                if nb==(n-1,m-1):
                    return dist+1
                if nb not in seen:
                    q.append((nb,dist+1))
                
            
            
        if (m-1,n-1) in seen:
            return seen[(m-1,n-1)]
        else:
            return -1
```

[Employee Free Time](https://leetcode.com/problems/employee-free-time/)

Employee free time problem:

We are given a list schedule of employees, which represents the working time for each employee.

Each employee has a list of non-overlapping Intervals, and these intervals are in sorted order.

Return the list of finite intervals representing common, positive-length free time for all employees, also in sorted order.

Solution:
start w/ free interval $(-\infty,\infty)$. Make a priority queue of intervals from teh emp schedule list.
Repeadedly choose the employee schedule item w/ the earliest start time..
Then:

- if the end time of the current interval is less than the start time of the current free interval, do nothing 

- if the end time of the current free interval is smaller than the start tiem of employe interval, add current to solution, re-initialize new to point to end time of employee

- if overlap with emp.start&lt; current.start, then update current.start to emp.end. If needed, update current.end as well

- if overlap with emp.start>current.start, can add
  (current.start,emp.start)  to solution and update current to start at emp.end. The end $\infty$ if emp.end> current.end, else current.end.

[Skyline](https://leetcode.com/problems/the-skyline-problem/)

Approach - put all buildings in a priority queue, sorted by start time. Bellow instructions skip some corner cases, as they are very verbose (but are in code).

- Initialize 'current' as $-\infty,\infty,0$ (the default building), sky(result) to empty list.
- Pop the queue. Call this proc. If current.end &lt; proc.start,
  add current to skyline. if $current.start < proc.start<=current.end$, then :
- if current.height > proc.height, update start of proc to be $current.end$, and add back to queue.
- if $current.height<proc.height$ , add current to skyline, check if need to add $proc.end,current,start,current.height$ to queue.
- in the end add the last one if needed.

   Be careful with corner cases, e.g. when 2 heights are the same, with deleting the first dummy building, and adding the last building if needed. 

  ```{python}
  from heapq import heappop, heappush
  class Solution:
     def getSkyline(self, buildings: List[List[int]]) -> List[List[int]]:
         # make a priority q w/ all buildings. We
         q = []
         for b in buildings:
             heappush(q,b)
         res = []
         # start, end, height
         current = [float("-inf"),float("inf"),0]
         while q:
             proc = heappop(q)
             s,e,h = proc[0],proc[1],proc[2]
             if s>current[1]:
                 
                 res.append([current[0],current[2]])# finalize a 'current'
                 current = [s,e,h]
             if s==current[1]:
                 # case 1:
                 # if heights are different:
                 if h!=current[2]:
                     res.append([current[0],current[2]])# finalize a 'current'
                     current = [s,e,h]
                 else:
                     current[1] = e
                     continue
                     
             else:
                 # the new one is higher:
                 if current[2]<h:
                     if  current[0]<s:
                         res.append([current[0],current[2]])
                     
                     if current[1]>e:# if old one continues after current one, add it back to queue
                         heappush(q,[e,current[1],current[2]])
                     else:# do nothing, it will be swallowed
                         pass
                     current = [s,e,h]
                     
                 # same height
                 elif current[2]==h:# update end time of current
                     current[1] = max(e,current[1])
                 else:# old one is higher
                     if e>current[1]:
                         heappush(q,[current[1],e,h])
         # notice we only add stuff after finishing the processing, so we'll be left
         # with somethign to add in the end
         if current[0]>res[-1][0]:
             res.append([current[0],current[2]])
         res2 = []
         for r in res[1:]:
             if not res2 or r[1]!=res2[-1][1]:
                 res2.append(r)
         return res2
                     
                     
                 
             
         
  ```

#todo check tree and stuff 

[Longest Increasing Path in Matrix](https://leetcode.com/problems/longest-increasing-path-in-a-matrix/)

Approach:
first do topo-sort in order to 'linearize' the graph.
Then do a DFS from each node, and keep track of the max path length, memoizing the DP calls.

```{python}
from functools import lru_cache

class Solution:
    def longestIncreasingPath(self, matrix: List[List[int]]) -> int:
        # first step-topological sort to find potential roots
        st = []
        m = len(matrix)
        n = len(matrix[0])
        def getNeighbors(cell):
            i,j = cell[0], cell[1]
            return [(i+k,j+l) for k in range(-1,2) for l in range(-1,2)
                   if 0<=i+k<m and 0<=j+l<n and abs(k)+abs(l) ==1 
                    and matrix[i][j]<matrix[i+k][j+l]
                   
                   ]
        st = []
        seen = set()
        #totBest = 0
        from collections import defaultdict
        bestWalk = defaultdict( lambda :1)
        
        def walk(nd):
           # print(f"walking {nd=}")
            if nd in seen:
                return
            seen.add(nd)
            for nb in getNeighbors(nd):
                #print(f"{nd=},{nb=}")
                walk(nb)
            st.append(nd)
            return
        
        #print(st)
        for i in range(m):
            for j in range(n):
                walk((i,j))
        #print(st)
        
        @lru_cache(maxsize = None)
        def dpwalk(node):
            #curr = 1
            best = 1
            for nb in getNeighbors(node):
               # print(f"{node=},{nb=}")
                k= dpwalk(nb)
                best = max(best,k+1)
            return best
        
        bestFound = 1
        for el in st[-1::-1]:
            bestFromHere = dpwalk(el)
            #print(f"{el=},{bestFromHere=}")
            bestFound= max(bestFound,bestFromHere)
            
        
        return bestFound
```

# Problem 1041: Robot Bounded in Circle

  On an infinite plane, a robot initially stands at (0, 0) and faces north. The robot can receive one of three instructions:

- "G": go straight 1 unit;
- "L": turn 90 degrees to the left;
- "R": turn 90 degrees to the right.

The robot performs the instructions given in order, and repeats them forever.

Return true if and only if there exists a circle in the plane such that the robot never leaves the circle.

Let $v$ be the vector we move the robot in one instruction set, and $d$ be the direction in radians, relative to the initial direction of the robot.

Solution/ answer:
After 1 instruction set we're either at the origin, or we're **not** facing north.

### Proof

Exercise for reader.

# Problem 1463. Cherry Pickup II

You are given a rows x cols matrix grid representing a field of cherries where $grid[i][j]$
 represents the number of cherries that you can collect from the $(i, j)$ cell.

You have two robots that can collect cherries for you:

Robot #1 is located at the top-left corner (0, 0), and
Robot #2 is located at the top-right corner (0, cols - 1).
Return the maximum number of cherries collection using both robots by following the rules below:

From a cell (i, j), robots can move to cell $(i + 1, j - 1), (i + 1, j), \text{or }  (i + 1, j + 1)$.
When any robot passes through a cell, It picks up all cherries, and the cell becomes an empty cell.
When both robots stay in the same cell, only one takes the cherries.
Both robots cannot move outside of the grid at any moment.
Both robots should reach the bottom row in grid.

### Solution:

Let D(col1,col2,row) be the maximum number of cherries that can be collected if the robots are at
$(row,col1),(row,col2)$.
Then:

$$
D(c_1,c_2,r) = \max_{cn_1 \in [c_1-1,c_1,c_1+1],cn_2\in {c_2-1,c_2,c_2+1}} D(cn_1,cn_2,r+1) +\begin{cases}
grid[c_1,r]+grid[c_2,r] \text{ if } c_1!=c_2\\
grid[c_1,r] \text{ else }
\end{cases}
$$

The solution is then $D(0,n-1,0)$

With the obvious boundary conditions. We use memoization table to store the results .A small optimization we could use is to make sure $c_1<=c_2$ troughout the execution of the algorithm.

## 1094. Car Pooling

There is a car with capacity empty seats. The vehicle only drives east (i.e., it cannot turn around and drive west).

You are given the integer capacity and an array trips where trip[i] = [numPassengersi, fromi, toi] indicates that the ith trip has numPassengersi passengers and the locations to pick them up and drop them off are fromi and toi respectively. The locations are given as the number of kilometers due east from the car's initial location.

Return true if it is possible to pick up and drop off all passengers for all the given trips, or false otherwise.

Example 1:

```
Input: trips = [[2,1,5],[3,3,7]], capacity = 4
Output: false
```

Example 2:

```
Input: trips = [[2,1,5],[3,3,7]], capacity = 5
Output: true
```

Solution:
we simply merge all intervals and keep track if the capacity is enough.

```{python}
class Solution:
    def carPooling(self, trips: List[List[int]], capacity: int) -> bool:
        from collections import defaultdict
        # aggregate pickups and dropoffs at any time something happens'
        pickups = defaultdict(lambda :0)
        dropoffs = defaultdict(lambda :0)
        for t in trips:
            pickups[t[1]]+=t[0]
            dropoffs[t[2]]+=t[0]
        # sort !! NB- this step is important, BUT if we have limited numbers
        # we can use bucket sort for linear time!!!
        pickupsAndDropoffs = sorted(
            list(
                set(
                    [t[1] for t in trips]+[t[2] for t in trips]
                )
            ))
        currOcc = 0
        for t in pickupsAndDropoffs:
            if t in pickups:
                currOcc+=pickups[t]
            if t in dropoffs:
                currOcc-=dropoffs[t]
            assert currOcc>=0
            if currOcc>capacity:
                return False
        return True
                                    
```

### Approach 2: Bucket Sort

##### Intuition

Note that in the problem there is a interesting constraint:

$0 <= trips[i][1] < trips[i][2] <= 1000$
What pops into the mind is Bucket Sort, which is a sorting algorithm in $\mathcal{O}(N)$ time but requires some prior knowledge for the range of the data.

We can use it instead of the normal sorting in this method.

What we do is initial 1001 buckets, and put the number of passengers changed in corresponding buckets, and collect the buckets one by one.

Algorithm

We will initial 1001 buckets, iterate trip, and save the number of passengers changed at i mile in the i-th bucket.

## 

## 131. Palindrome Partitioning

_Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s._

```
Example 1:

Input: s = "aab"
Output: [["a","a","b"],["aa","b"]]
Example 2:

Input: s = "a"
Output: [["a"]]
 

Constraints:

1 <= s.length <= 16
s contains only lowercase English letters.
```

#### Solution

Given that we're being asked to return everything, we can use backtracking to solve this problem. We also note the maximum possible length of the string is 16, 
which is small enough to do a brute force search.

```{python}
def isPalindrome(a):
    return a==a[-1::-1]
def findPossiblePalindromesStartingFromBeginning(s):
    res = []
    if len(s)==0:
        return res
    for i in range(0,len(s)):
        if isPalindrome(s[:i+1]):
            res.append(s[:i+1])
    return res
        
            
            
    
class Solution:
    def partition(self, s: str) -> List[List[str]]:
        res = []
        n = len(s)
        
        def backtrack(partialResult,currInd):
            #print(f"{partialResult=},{currInd=}")
            if currInd >n:
            #    pass
                return
            elif currInd == n:
                print("adding")
                res.append(partialResult.copy())
                return
            else:
                possibleContinuations = [(len(c),c) for c in findPossiblePalindromesStartingFromBeginning(s[currInd:])]
                print(possibleContinuations)
                for ind,c in possibleContinuations:
                    # partialResult.append(c)
                    backtrack(partialResult+[c],currInd+ind)
                    
            #partialResult.pop(-1)
            return res
        return backtrack([],0)
            
                
```

## 1762. Buildings With an Ocean View

There are n buildings in a line. You are given an integer array heights of size n that represents the heights of the buildings in the line.

The ocean is to the right of the buildings. A building has an ocean view if the building can see the ocean without obstructions. Formally, a building has an ocean view if all the buildings to its right have a smaller height.

Return a list of indices (0-indexed) of buildings that have an ocean view, sorted in increasing order.

Example 1:

```
Input: heights = [4,2,3,1]
Output: [0,2,3]
```

Explanation: Building 1 (0-indexed) does not have an ocean view because building 2 is taller.
Example 2:

Input: heights = [4,3,2,1]
Output: [0,1,2,3]
Explanation: All the buildings have an ocean view.
Example 3:

Input: heights = [1,3,2,4]
Output: [3]
Explanation: Only building 3 has an ocean view.

Constraints:

1 &lt;= heights.length &lt;= 105
1 &lt;= heights[i] &lt;= 109

it's a bit slow cause of the appending, but can be fixed by instead starting from the the beginning
and maintaining a monotonously decreasing sequence- every time we add an element,
it deletes all elements already in the stack that have smaller height already (we keep the index in the stack and check heights dynamically) .
Finally return the stack.

```
class Solution:
    def findBuildings(self, heights: List[int]) -> List[int]:
        maxToRight = float("-inf")
        n = len(heights)
        res = []
        for i in range(n-1,-1,-1):
            if heights[i]>maxToRight:
                res.append(i)
                maxToRight = heights[i]
        return res[-1::-1]
```

## 1891. Cutting Ribbons

You are given an integer array ribbons, where ribbons[i] represents the length of the ith ribbon, and an integer k. You may cut any of the ribbons into any number of segments of positive integer lengths, or perform no cuts at all.

For example, if you have a ribbon of length 4, you can:
Keep the ribbon of length 4,
Cut it into one ribbon of length 3 and one ribbon of length 1,
Cut it into two ribbons of length 2,
Cut it into one ribbon of length 2 and two ribbons of length 1, or
Cut it into four ribbons of length 1.
Your goal is to obtain k ribbons of all the same positive integer length. You are allowed to throw away any excess ribbon as a result of cutting.

Return the maximum possible positive integer length that you can obtain k ribbons of, or 0 if you cannot obtain k ribbons of the same length.

```
Example 1:

Input: ribbons = [9,7,5], k = 3
Output: 5
Explanation:
- Cut the first ribbon to two ribbons, one of length 5 and one of length 4.
- Cut the second ribbon to two ribbons, one of length 5 and one of length 2.
- Keep the third ribbon as it is.
```

Now you have 3 ribbons of length 5.

# Lc 4 Median of Two Sorted Arrays

Probably have to do it quickly...
let's try 'binary search' approach.
The median is the 50th pctile...

```python

def get_order_statistic(arr1,arr2,k):
    m = len(arr1)
    n = len(arr2)
    # corner cases- m or n =0, k = 0, 
    # k = m,k = n
    # then
    a1 = arr1[k//2-1]
    a2 = arr2[k//2-1]
    #then make 2 cuts as follows:
    
```

# LC 1071. GCD of strings

string 'division with reminder?'

 is it 'just take the common prefix'?
 no, actually the solution is quite fun:

```{python}
# note that thegdc is non-empty iff a+b = b+a
# so we can just check if a+b = b+a
# and take the a[gdc(len(a),len(b)):] as the answer

return a[gdc[len(a),len(b)]:] if a+b == b+a else ""
```

# verify alien dictionary

learend about itertools zip_longest.

