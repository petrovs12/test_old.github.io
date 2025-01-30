---
id: u25u9ncpcax4uy5y6ashcit
title: 100 Prisoners Problems
desc: ""
updated: 2024-12-15T22:35
created: 1641979954736
---
[](https://www.youtube.com/watch?v=_X_Q-_X_X_Q)

[youtube](https://www.youtube.com/watch?v=C5-I0bAuEUE)
[Evernote Link](https://www.evernote.com/shard/s101/nl/11122041/2b02fecb-f12e-46ad-a9d7-0a8bc96f3bfa?title=The%20100%20prisoners%20map%20-reduce%20probablistic%20%22analysis%22)
 (First,note that I haven't found a deterministic solution for the problem with "stages buffering", but trying to think of the ways to stochastically analyze the whole thing and how to get the optimum utility of time spend in jail/risk). The note is not very well structured ,if you have some questions (though it's completely useless problem, of course)  please call me.
 So, we assume that we can calculate the interarrival time, but we need a
So, the problem is:
 We are in a prison, and there is this warden ,who gives us the following game: We are prisoners;before the game starts, we can talk to each other, after it starts we can't talk any more.
 At random times ,the warden calls a random prisoner in a room with a light switch, which is initially off;.
 If at any point any of the prisoners announces that all the prisoners have visited the room, then all are free if he(she ?) 's correct.

# [Linked List Cycle II](https://leetcode.com/problems/linked-list-cycle-ii/)

 Tortoise and hare algorithm to determine if present. Start from head, and ignore the equality of the 1st node.

Then:
if a nodes, then cycle of b:
hare: $2*t$ 
tortoise:
$t$
then:
$t-a=2*t-a(mod b)$
$t==0(mod b)$
Thus for the intersection node it's true that:
$t-a==-a(mod b)$

Thus if we start from the head of the list, it's position is $1(mod b)$. If we advance $a$ times is $a+1(mod b )$ and in list.
On the other hand, if we start from the intersection node and also advance $a$ times it's position will also be $a+1(mod b)$.
Thus we can initialize 2nd pointer at the beginning, then move by one, until they meet, and that will be the first one.

# [670. Maxiumum Swap](https://leetcode.com/problems/maximum-swap/)

Bookkeeping is a bit ugly, as well as the multiple num->string->list->string->num conversion chain; would be simpler to 
convert directly to list of nums and operate on that.

```{python}
def maximumSwap(num: int) -> int:
    # let the digit representation be a1a2...
    # we want to swap the earliest possible, for which we have a larger one after that, with the largest possible one 
    # after that. So we can start from the back and keep track of the max to right of current, and record last time it 
    # happened that current was not current maximum!
    nm = str(num)
    n = len(nm)
    lastSwapPair=(float("inf"),float("inf"))
    currMaxSeen = float("-inf")
    currMaxSeenIndex = float("inf")
    for i in range(n-1,-1,-1):
        currDigit = int(nm[i])
        # if swap candidate
        if currDigit<currMaxSeen:
            lastSwapPair = (i,currMaxSeenIndex)# simply update the maxSwapPair
        elif currDigit==currMaxSeen:
            continue
        else:
            currMaxSeen = currDigit
            currMaxSeenIndex = i
    #print(f"{currMaxSeen=},{lastSwapPair=},{currMaxSeenIndex=}")
    nm = [c for c in nm]
    #print(nm)
    if lastSwapPair[0]<n:
        tmp = nm[lastSwapPair[0]]
        nm[lastSwapPair[0]] = nm[lastSwapPair[1]]
        nm[lastSwapPair[1]] = tmp
    #print(f"{nm=}")
    return int("".join(nm))
            
```

# [1047. Remove All Adjacent Duplicates In String](https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/)

```{python}
def popMultiple(q):
    if q.qsize() <2:
        return
    else:
        k,l = q.get(),q.get()
        if k!=l:
            q.put(l)
            q.put(k)
            return
        else:
            popMultiple(q)
    
    
class Solution:
    def removeDuplicates(self, s: str) -> str:
        # what we could do is to have
        # 2 pointers- current left, current right
        # 3 operations:
        # if delete, 
        # just use a stack
        from queue import LifoQueue
        q = LifoQueue()
        for c in s:
            q.put(c)
            popMultiple(q)
        
        return "".join(q.queue)

```

# [128. Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence/)

Approach: limited union-find. Namely, when we insert a new element, we have to check only if it connects to something to the left, then 
check if it connects to something to the right. No infinite cascading.

So, approach: 
keep 2 dicts: for longest found sequence to the left, and to the right, at some points.
When we insert something, we check if we're connecting, and if so, we lenght of the longest sequence to the left (and to the right).

Do the same on the right-hand side, with the difference that if we're connecting the left and right-handside, we have to 
delete the reference to the current element (forget about it)...

```{python}
class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:

        # Union-find?
        seenElements = set()
        if len(nums)<1:
            return 0
        # we keep track of 2 dicts:
        # chain start and chain end
        chainStart = {}
        chainEnd = {}
        for el in nums:
            if el in seenElements:
                continue
            seenElements.add(el)
            if el-1 in chainEnd:
                oldLen = chainEnd[el-1]
                beginning = el-1-oldLen+1
                chainStart[beginning]+=1
                del chainEnd[el-1]
                chainEnd[el] = chainStart[beginning]
            else:
                chainStart[el] = 1
                chainEnd[el] = 1
            if el+1 in chainStart:
                lenToRight  = chainStart[el+1]
                elToRight = el+1+lenToRight-1 # new end to merge with
                totalLen = lenToRight + chainEnd[el]
                elToLeft = el - chainEnd[el]+1
                del chainStart[el+1]
                chainEnd[elToRight] = totalLen
                chainStart[elToLeft] = totalLen
                if elToLeft!=el:
                    del chainEnd[el]
                    if el in chainStart:
                        del chainStart[el]
        return max(chainStart[el] for el in chainStart)
```

# [886. Possible Bipartition](https://leetcode.com/problems/possible-bipartition/)

 #TODO write some notes about this.. see why it was slow...
  An approach to detect a bipartite graph is to try to color it with 2 colors.
    We can do this by using a color dict. Then we iterate through the graph (BFS sounds most natural for me in this case), and for each node, we assign it a color.
    As usual, we use a 'seen' set to keep track of nodes we've seen. Now, as we're about to put a node in the queue, we first check if color doesn't exist or is compatible with the current node's color. If not, return false. If it has already been colored, we skip it. Else put it in the queue.

# <https://leetcode.com/problems/number-of-islands/solution/>

#TODO see why slow
Solution: dfs, counting components...

# [Lowest common ancestor binary tree](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree-iii/)

keep a dict, denoting how many of [p,q] we have found in the corresponding subtree.
keep a global state to know when we've found the answer...

```{python}
    def lowestCommonAncestor(self, p: 'Node', q: 'Node') -> 'Node':
        # so what do we want to do here...
        # no way of knowing 
        # idea: bubble up from both p and q; then bubble down from root
        # return first thing that returns a 2
        
        from collections import defaultdict
        numnodes = defaultdict(lambda :0)
        while p is not None:
            numnodes[p]+=1
            pcurr = p
            p=p.parent
        root = pcurr
        
        #numnodes = defaultdict(lambda :0)
        while q is not None:
            numnodes[q]+=1
            #pcurr = p
            q=q.parent
        # now explore in LRT order and return first thing that's a 2
        found = None
        def dfs(rt):
            nonlocal found
            if found is not None:
                return 
            if rt.left:
                dfs(rt.left)
            if rt.right:
                dfs(rt.right)
            if found is None and numnodes[rt]==2:
                found = rt
            return
        dfs(root)
        return found

```

\#[140. Word Break II](https://leetcode.com/problems/word-break-ii/)

 Backtracking solution

```{python}
    def wordBreak(self, s: str, wordDict: List[str]) -> List[str]:
        # sounds like a backtracking thing
        n = len(s)
        res=[]
        # current position, current partial sentence
        partSent = []
        def backtrack(cpos):
            if cpos == n:
                res.append(partSent.copy())
                print(f"{res=}")
                return
            for candWord in wordDict:
                if s[cpos:].startswith(candWord):
                    partSent.append(candWord)
                    backtrack(cpos+len(candWord))
                    partSent.pop(-1)
                #print(part)
                #partSent.pop()
                
            return
        backtrack(0)
        return [" ".join(sent) for sent in res]
```

#TODO - maybe look at the DP solutions in LC.

[longest w/o rep chars](https://leetcode.com/explore/interview/card/facebook/5/array-and-strings/3008/)

keep a set, if new char in set, pop chars from correspondign indices.

## Basic calculator

(1+(4+5+2)-3)+(6+8)
(10)

idea:
keep:
curr Operand 
current Operator (+ or -, so === sign)
current output
stack of 'stuff for later FROM before' to remember the result when we enter a '('

if digit- append to operand
2 'stacks-'- a 'local' mini-stack, consisting of 
(output, operand, and operator ->eval() = output+operand_operator
'global' stack, consisting of the list when we keep stuff for when we see a bracket. There we 
can keep multiple (output, operand) pairs from before
if + or -, evaluate current 'mini-stack',write to 'output',reset current, and write the new 'sign'
if (, push to 'global' stack, reset output, operand and operator
if ), finish current evaluation (res+sign_operand). Next thing in global stack wll be operator, so res\*stack.pop().
next thing is the remembered value, so res+stack.pop() and that's the result. do we also reset sign?

## [Minimum Number of opening/closings to add](https://leetcode.com/problems/remove-invalid-parentheses/solution/)

### Remove Invalid Parentheses

in each position, we consider adding.

We know how many left and how many right we should add to get the minimal correct number of brackets.
we backtrack and add expressions, in case in the end we have a valid state...

## [k closest to origin](https://leetcode.com/problems/k-closest-points-to-origin/solution/)

heap w/ keeping only the top k. O(nlogk) :). Sort is O(nlogn). 
binary search wrt the distance to consider. O(n)
In this case, however, we can improve upon the time complexity of this modified binary search by eliminating one set of points at the end of each iteration. If the target distance yields fewer than kk closer points, then we know that each of those points belongs in our answer and can then be ignored in later iterations. If the target distance yields more than kk closer points, on the other hand, we know that we can discard the points that fell outside the target distance.

By roughly halving the remaining points in each iteration of the binary search, we reduce the total number of processes to $N + \frac{N}{2} + \frac{N}{4} + \frac{N}{8} + ... + \frac{N}{N} = 2N$
 This results in an average time complexity of $O(N)$.

\##[Minimal Rectangle](https://leetcode.com/problems/minimum-area-rectangle/)

 Idea- put points in set, consider each pair as a diagonal, check if it's a rectangle and it's area. $O(n^2)$ time, O(n) space.

## [Next Permutation](https://leetcode.com/problems/next-permutation/)

Very similar to [Maximum Swap](https://leetcode.com/problems/maximum-swap/), but a bit more complicated.
In Maximum swap, we find the 'biggest' jump. Here, we want to find the 'smallest' jump+ fixup the stuff behind it.
So, we go backwards until we find a decreasing element in pos $i$. All nums in positions $j>i$ are sorted in decreasing order. We swap $i$ with the smallest number, larger than it, in $a[i+1...]$. 
Now, the numbers $a[i+1...]$ are still sorted in decreasing order. We **reverse the numbers in $a[i+1...]$ to get the smallest permutation**!!!

## [Merge Intervals](https://leetcode.com/problems/merge-intervals/)

Sort and merge- straightforward.

## [Valid Number](https://leetcode.com/problems/valid-number/)

Annoying.
Here's the definition:

```
A valid number can be split up into these components (in order):

A decimal number or an integer.
(Optional) An 'e' or 'E', followed by an integer.
A decimal number can be split up into these components (in order):

(Optional) A sign character (either '+' or '-').
One of the following formats:
One or more digits, followed by a dot '.'.
One or more digits, followed by a dot '.', followed by one or more digits.
A dot '.', followed by one or more digits.
An integer can be split up into these components (in order):

(Optional) A sign character (either '+' or '-').
One or more digits.
```

Just implement it...

## [Copy list with random pointer](https://leetcode.com/problems/copy-list-with-random-pointer/)

Keep a hashmap w/ the copies and be careful of what's pointing to None and so on...

## [Word Break II](https://leetcode.com/problems/word-break-ii/)

Backtrack (or maybe use DP). state is current index, and a set of words we've collected so far.
To add a word, we check if s[ind:] starts with it, and call backtrack(ind+len(word), words+[word]))).
When we reverse, we pop last word from partial solutions...

## [Peak Element/ Local Maximum](https://leetcode.com/problems/find-peak-element/)

First, check both ends. Check middle. If middle is peak, return. 
Else, check if they are ordered somehow. Check the slope as well...

## [Simplify Path](https://leetcode.com/problems/simplify-path/)

Basically we just keep a stack of the solution. We split the initial path by '/' and join it back. 
Rules:

- if we see "..", pop stack, as we're going up a directory.
- if we see "." or "", do nothing.
- else - append to stack.
  return "/"+"/".join(stack)

```{python}
    def simplifyPath(self, path: str) -> str:
        m=path.split("/")
        # print(f"{m=}")
        from queue import deque
        res=deque()
        for dr in m:
            if dr=="" or dr==".":
                continue
            elif dr=="..":
                if len(res)>0:
                    res.pop()
            else:
                res.append(dr)
        # print(f"{res=}")
        return "/"+"/".join(res)
```

## [Binary Search Tree Iterator](https://leetcode.com/problems/binary-search-tree-iterator/)

You can serialize as an array, and then iterate through it.

## [Binary Tree Right Side View](https://leetcode.com/problems/binary-tree-right-side-view/)

 Do BFS, keep track of the current depth, when it changes, add to res. Take care to add to res in the end as well (maybe there's a corner case).

## [Kth Largest In Array](https://leetcode.com/problems/kth-largest-element-in-an-array/)

Sort $O(nlogn)$, heap with pops etc: $O(nlogk)$

## [Basic Calculator II](https://leetcode.com/problems/basic-calculator-ii/)

 Multiply and divide, but no parentheses.
 Algorithm?
currNum, currOp,stack = ...
if digit- add to currNum
if op:
2 cases : "+-" vs "_/"
ops implicitly on the stack are '+' !!!
We have to delay the evaluation of "+" and "-" until the multiplications and divisions are "done".
 Conversely, if we see + or - we can 'evaluate' the stack so far by summing.
 If we see a _ or /, if current op is -, then we put $-currentNumber$ to stack.
 if current op is "+", we put currentNumber to stack.
 if we see an op, and previous op was \* or /, we evaluate op(stack.pop(),currentNumber) and add this to the currentNumber.
 ...

 finally add everything to the stack and that's the result...

## [Group Shifted Strings](https://leetcode.com/problems/group-shifted-strings/)

 Create the signature be the tuple of differences between the chars.
 Then, we can group strings by signature.
 Take care signatures are tuples os they're hashable as keys.
 If N-num strings,, K = max length of strings, then we have $O(N*K)$ time and $O(K*N)$ space.

## [Binary Tree Vertical Order](https://leetcode.com/problems/binary-tree-vertical-order-traversal/)

- Do BFS, keep track of current depth AND current index. Then we sort in the end.
  Maybe we can use a hashmap to store the current depth and the string.

O(nlogn)
Another option:
do BFS, put results in a hashmap.
Then, we can sort the keys and iterate through them. Know the range of the keys.
See also
<https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree/solution/>
for a slightly harde rversion.
987\. Vertical Order Traversal of a Binary Tree

## Nested List Weighted Sum

 DFS

```{python}
class Solution:
    def depthSum(self, nestedList: List[NestedInteger]) -> int:
        def dfs(nested_list,depth):            
            total = 0
            for nested in nested_list:
                if nested.isInteger():
                    total+=nested.getInteger()*depth
                else:
                    total+=dfs(nested.getList(),depth+1)
            return total

        return dfs(nestedList,1)


```

## [Maximum Subarry Sum](https://leetcode.com/problems/maximum-subarray/solution/)

Kadane $maxEndingHere[i] = max(maxEndingHere[i-1]+nums[i])$. Can optimize to not hold a whole array of maxEndingHere, but a single number,  in an obvious way obvious reasons (loop ).

## [Top K frequent Elements](https://leetcode.com/problems/top-k-frequent-elements/)

Counter + heap would yield O(n\*log(k)) time and O(n) space. Counter + sort would be just O(nlog(n))

**Quickselect** would be O(n^2) worst case, O(n) average case.

 #TODO start top fb questions from 408- valid word abbreviation

## (Range Sum of BST)[https://leetcode.com/problems/range-sum-of-bst/]

  Keep a global for the sum
  Option 1: just traverse the whole tree (DFS) and check the value of the values.
  Option 2:In the DFS code, add 2 parameters 'high' and 'low'. Depending on the passed  parameters, we can prune the tree and decide weather to go to left and/or right, changing the 'high' and 'low'. Values accordingly.

# (Remove Duplicates from Sorted Array)[https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/]

 I think the best approach would be similar to the merge 2 arrays problem.
 So probabaly best way would be to first go forward and count the number of remaining elements $k$.
 Then, go from front, initializing 2 pointers- one we write FROM, and another we WRITE TO. We advance both of them in an obvious way. The 
 **write from** pointer will always be >= to **write to** pointer.
 We can then never write to a place we haven't read from already.

# [leetcode 525 Max Contignouse Array](https://leetcode.com/problems/contiguous-array/)

Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.
let's first build the prefix sums with 0 =-1,1=1. Then, we're looking for 'maximal size array with balance 0'. I think we can do this in O(n) time with a 2-pointer approach.
For example

# [1065. Index Pairs of a string](https://leetcode.com/problems/index-pairs-of-a-string/)

approach:

Build a set out of the words. Then check if each pair in there 
$O(n^2)$ time, $O(n*max(len(words)))$ space.

Another approach?

Variation of KMP?

Trie? This will be like $O(n*log(n))$

# [1060. Missing Element in Sorted Array](https://leetcode.com/problems/missing-element-in-sorted-array/)

Notice that if the array $a$ is sorted, then the number of missing elements up to 
index $i$ is $f(i)= a[i]-a[0]-i$!!

Now, use binary search to find $i$, such that
$f(i)<=k<f(i+1)$
Take care of corner cases $i=n-1$.
Now we can return $a[i]+(k-f(i))$.

# [Find Peak Element 2D](https://leetcode.com/problems/find-a-peak-element-ii/)

**No two adjanced cells are equal !!**

A peak element is one that's strictly greater than its neighbors to left, right,
top, and bottom.

Approach:

1. There is a maximal element.

2. a. There is a maximal element in the leftmost column, on the 
   rightmost column, or in the middle column
   Check them

3. Take the max element in the middle column. Check numbers in the same row on both sides. Now, if we're increasing in one of these directions, we must have 
   at least 1 local maximum in that direction... Thus recurse there
   Why? Starting from the max in the middle, we can build up an increasing chain of values.
   This chain won't cross to the other half, cause by design we took the max element of the boundary.

# [1231. Divide Chocolate](https://leetcode.com/problems/divide-chocolate/)

Approach: 
maximin of consequtive chunks...
Let sweetness be $s$.
Min we can possibly get is $min(s)$. Max is $floor(sum(s)/k)$.
Stepsize is maybe min(s).
Can we do efficient binary search in this interval?

Form the cumsum array.

Checking for feasibility:
We can do k bisect calls for a given number and see if it works.
Complexity: $k*log(n)$.
Total Complexity:
O(log(sum(s))-min(s)_log(n)_k)

Another solution:

same binary search, but linear check.
Complexity O(n\*log(sum()/min(s)))

# [Shortest Distance To Target Color](https://leetcode.com/problems/shortest-distance-to-target-color/)

We're given a 1-d array of colors. 
Then we have a bunch of queries, asking the shortest distance from a given point 
to a given color.

We can prep some stuff that makes queries fast.

Idea:
For each color, keep 2 Arrays:

```
{'color':[start_index,end_index]} 
```

of the intervals in question. Then do binary search on both intervals.
If you get 'same' interval, which would correspond to bisect_right returning 
say $k+1$ on the start and $k$ on the end, return 0.

Else return min(abs(pos-dat[col][0][k]) # start to the right
,abs(pos-dat[col][1][k-1])# end to the left
)

Be careful about the indices!!! Above might have off-by-1 error. 

# [1229 Meeting Scheduler](https://leetcode.com/problems/meeting-scheduler/)

Given availability time intervals for 2 people and a meeting duration of **duration**, return the earliest time they can meet.

Idea:
 sort ALL time slots. then go trough them;
 if there is an overlap as we go, they can't be for the same person!

# [287. Find the Duplicate Number](https://leetcode.com/problems/find-the-duplicate-number/)

Use only constant extra space.
Don't modify the array nums.

sol1:
Sort, then go.
Idea 2 : negative marking.
Idea 3: Tortoise and hare.

1. step 1: detect cycle
2. Step 2: start from there, do single steps to find the 'entrance' of the cycle.
   Can do some modular arithmetics to prove it...

# [42. Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/)

For each cell, what we're trapping is:

 $trapped_i = max(maxToLeft_i,maxToRight_i)-height_i$
 So can do it in $O(n)$ time and $O(n)$ extra memory.

# \[1868. Product of Two Run-Length Encoded Arrays

](<https://leetcode.com/problems/product-of-two-run-length-encoded-arrays/>)

Just take care of the bookkeepign quite carefully...

# [340. Longest Substring with at most k distinct characters](https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/)

Given a string s and an integer k, return the length of the longest substring of s that contains at most k distinct characters.

Sliding window + hashmap.
In the hashmap, map character-> it's rightmost position.
When The hashmap gets full, get the character with minimal rightmost position. Delete this, new start is this+1.

# 

# [1004. Max Consecutive Ones III](https://leetcode.com/problems/max-consecutive-ones-iii/)

Give an array of binary numbers, return the maximum number of consecutive 1s if you're allowed to flip at most $k$ 0's.

Idea:
Try to calculate 'maximum number to flip if 1'seq' ends
at a given index...

Say we build a cumsum of 0's. 

Then $maxUntil_i = i-min(j| cumsum_1(j)>=i-k)$

this can be found w/ binary search.

# [1886. Determine Whether Matrix Can Be Obtained By Rotation](https://leetcode.com/problems/determine-whether-matrix-can-be-obtained-by-rotation/)

Note the clockwise rotations of $R^{m*m}$ matrix transforms the coordinates as follows:

$(i,j)\rightarrow (j,m-i) \rightarrow (m-i,m-j) \rightarrow (m-j,i) \rightarrow (i,j)$

and with the 0-based indexing:

$(i,j)\rightarrow (j,m-i-1) \rightarrow (m-i-1,m-j-1) \rightarrow (m-j-1,i) \rightarrow (i,j)$

We can use this directly to check if the matrix is a rotation of the original matrix.

![[science.math.Linear Algebra.Rotation Matrices#2D]]

# [739. Daily Temperatures](https://leetcode.com/problems/daily-temperatures/)

 Use monotonously decresing stack of temperatures (temp,ind) starting from the back.

# [48. Rotate Image](https://leetcode.com/problems/rotate-image/)

![](/assets/images/2022-04-01-12-31-37.png)
So iterate over the right-top indices and do the swap w/ some intermediate variables.
Take care of the 0-indexing and of the ranges.

Second option:
Note that:

$\mathbf{R}(\pi/2) = \left[\begin{array}
{rrr}
0 & -1  \\
1 & 0  \\
\end{array}\right] = \left[\begin{array}
{rrr}
0 & 1  \\
1 & 0  \\
\end{array}\right]*\left[\begin{array}
{rrr}
1 & 0  \\
0 & -1  \\
\end{array}\right]
$

the first part is the 'transpose', so simply $(i,j)->(j,i)$
The second part is a left-to-right flip.

# [54. Spiral Matrix](https://leetcode.com/problems/spiral-matrix/)

Let the matrix be $m*n$.
Algorithm:
1.Initialize the top, right, bottom, and left boundaries as up, right, down, and left.
2\. Traverse from left boundary to right boundary (direction (0,1)). Update right boundary
3\. Go from bottom to top (direction(1,0)). update top. 
... etc
when traversing right-to-left or top-to-bottom, check if we're already at the bottom or left, respectively (to check if we have to finish).

```







  
```

