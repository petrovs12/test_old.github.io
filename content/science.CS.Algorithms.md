---
id: 1xnkittme5p2g4ioz5p8w5q
title: Algorithms
desc: ""
updated: 2024-12-15T22:35
created: 1641811513625
---
## Leetcode Problems

### [1. Two Sum](https://leetcode.com/problems/two-sum/)

<div class="mermaid">
  
graph TD;
a--&gt;b;

</div>

$x$

$$
\begin{align}
    x=2
\end{align}
$$

Solved w/ O(n) space...
#TODO
Check this solution:

2: Two Pointer [Accepted]
Intuition

As we iterate through seats, we'll update the closest person sitting to our left, and closest person sitting to our right.

Algorithm

Keep track of prev, the filled seat at or to the left of i, and future, the filled seat at or to the right of i.

Then at seat i, the closest person is min(i - prev, future - i), with one exception. i - prev should be considered infinite if there is no person to the left of seat i, and similarly future - i is infinite if there is no one to the right of seat i.

# [Word Pattern](https://leetcode.com/problems/word-pattern/)

Very stupid, solved w/ the 2 hash map approach

# 783. Minimum Distance Between BST Nodes

Solution- can walk over the tree, record thing 
in a array, sort it, return smallest diff.
simplest approach:
walk, push, heapsort while doing it, then walk.
TAP_DANCE_ENABLE = yes
QMK_SETTINGS = yes
LTO_ENABLE = yes

VIA_ENABLE = yes
VIAL_ENABLE = yes

in-order traversal, but the best one can be
'rightmost' on one side,vs 'leftmost' on the other...

So it's wrong... 
lets'a analyse a solution.
use in-order traversal, and while doing it,
keep track of the current and next, 
and update the best distance accordingly:

```python
class Solution:
    def minDiffInBST(self, root: Optional[TreeNode]) -> int:
        
        self.cur = None 
        self.minimum = float('inf')
        def inorder(node):
            if node:
                inorder(node.left)
                if self.cur:
                    self.minimum = min(self.minimum,node.val-self.cur.val)
                self.cur = node
                res.append(node.val)
                inorder(node.right)
        inorder(root)
        return self.minimum
```

