---
id: 708tu79t5q8fgdyf7l6o8l9
title: Paths in NxN grid
desc: ""
updated: 1733575572156
created: 1733573370282
---


https://leetcode.com/problems/unique-paths/
similar one

# Example explanation of the question

“Given N, representing the size of an NxN square grid, I want you to return all the paths from the top left corner to the bottom right corner, given that you can only move down or right in the grid. The return value should be an array of strings.”

At this point I usually draw a 3x3 grid, and draw arrows down and right next to the grid. Then I draw a few paths in the grid and start populating the array. See image: https://our.intern.facebook.com/intern/px/p/bxWB.

Copy-pastable ASCII examples:
(they look not so good in the interview bank view, but when copy-pasted into a mono-spaced editor they become magically aligned)

```
+---+---+---+ +---+---+---+ +---+---+---+
| X |   |   | | X | X | X | | X | X |   |
+---+---+---+ +---+---+---+ +---+---+---+
| X |   |   | |   |   | X | |   | X |   |
+---+---+---+ +---+---+---+ +---+---+---+
| X | X | X | |   |   | X | |   | X | X |
+---+---+---+ +---+---+---+ +---+---+---+
 DDRR          RRDD          RDDR
```


# Solution
recursion, no DP!!




