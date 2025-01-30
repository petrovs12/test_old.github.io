---
id: h9np745hfo98kwpl5gt3ovn
title: Maze Walking
desc: ""
updated: 1733571334815
created: 1733571182697
---


Description
Find a path through maze stored in a 2D array with a varieties of follow ups.

Question Statement
Warm Up
You are given a game board represented as a 2D array of zeros and ones. A 0-square is “passable”, meaning you can safely move there. A 1-square is impassable, meaning you cannot move there. Write a function to determine how many squares on the board represent “dead-ends” (i.e., that do not allow a next move)

Example:

```
0 1 0
1 1 0
0 1 0
```


The top-left and bottom-left corners are examples of dead-ends.



The top-left and bottom-left corners are examples of dead-ends.
Initial Prompt
You are given a game board represented as a 2D array of zeroes and ones. Zero stands for passable positions and one stands for impassable positions. Design an algorithm to find a path from top left corner to bottom right corner.

For example, for the following board:
```
entrance -> 0 0 0 0 0 0 0
            0 0 1 0 0 1 0
            0 0 1 0 1 1 0
            0 0 1 0 1 0 1
            1 1 1 0 0 0 0 -> exit
```
a possible path is:
```
entrance -> + + + + 0 0 0
            0 0 1 + 0 1 0
            0 0 1 + 1 1 0
            0 0 1 + 1 0 1
            1 1 1 + + + + -> exit
```
Assuming a zero-indexed grid of rows and columns, with (0, 0) at left top corner (entrance), we'd return:
```
(0, 0) -> (0, 1) -> (0, 2) -> (0, 3) -> (1, 3) -> (2, 3) -> 
  (3, 3) -> (4, 3) -> (4, 4) -> (4, 5) -> (4, 6)
```

Overall Context 
This is a simple to hard level question based on the variations you choose, testing candidate's familiarity with general search problems, and simple recursive structure, DFS, BFS and non-obvious search algorithm if we want to match keys to doors (see variants below). My favorite combo variations are shortest path and map with keys. Typically I start with shortest path problem. Pivoting harder to keys/doors if the candidate articulated clearly how to solve it without much effort. I'd work with them on getting BFS up, if they struggle. If they can't get it, I'd pivot to find any path, to see how they code some basic recursive function. 

Depending how the candidate performs, there are the following questions you could ask (approximately in the order of difficulties): 
DFS (solution included) 
BFS (solution included) 
Shortest path with different edge cost 
Tetromino/figure walking the maze
Keys and Doors (solution included)
Shortest Path with Goodies 

The reason I like this problem, is it doesn't necessarily assumes familiarity of standard algorithms, at least not presented in a typical algorithm book setting. 
Variations
DFS 
Difficulty simple.
Design an algorithm to find any path from top left corner to bottom right corner.

Solution
The most straightforward solution is to use the grid to keep track of positions that have been probed already. Also we need to keep track of a list of positions as the actual path taken.
```python
Board = [
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 1, 0, 0, 1, 0],
    [0, 0, 1, 0, 1, 1, 0],
    [0, 0, 1, 0, 1, 0, 1],
    [1, 1, 1, 0, 0, 0, 0]
]

def dfs(board, x, y, path):
    path.append((x,y))
    if x == len(board) - 1 and y == len(board[0]) - 1:
        return True
    if x < 0 or x >= len(board) or y < 0 or y >= len(board[0]) or not board[x][y] == 0:
        del path[-1]
        return False
    board[x][y] = 2
    if dfs(board, x+1, y, path):
        return True
    if dfs(board, x, y+1, path):
        return True
    if dfs(board, x-1, y, path):
        return True
    if dfs(board, x, y-1, path):
        return True
    del path[-1]
    return False

path = []
print(dfs(Board, 0, 0, path))
print(path)
``` 
This prints out:
```
True
[(0, 0), (1, 0), (2, 0), (3, 0), (3, 1), (2, 1), (1, 1), (0, 1), (0, 2), (0, 3), (1, 3), (2, 3), (3, 3), (4, 3), (4, 4), (4, 5), (4, 6)]
BFS
```
Difficulty medium.
Design an algorithm to find the shortest path from top left corner to bottom right corner.
For example, for the following board:
entrance -> 0 0 0 0 0 0 0
            0 0 1 1 1 1 0
            0 0 1 0 0 0 0
            0 0 1 0 1 0 1
            1 1 1 0 0 0 0 -> exit
a possible path is:
entrance -> + + + + + + +
            0 0 1 1 1 1 +
            0 0 1 + + + +
            0 0 1 + 1 0 1
            1 1 1 + + + + -> exit
but the shortest path is:
entrance -> + + + + + + +
            0 0 1 1 1 1 +
            0 0 1 0 0 + +
            0 0 1 0 1 + 1
            1 1 1 0 0 + + -> exit
Solution
Depending on how fast candidate answers the first question, I ask about how to keep track of shortest path. Candidates familiar with algorithms may also  initially suggest BFS, which has the same runtime as DFS. The way we need to keep track of actual path is a bit tricky. When we generate a candidate position, we point from it back to the position where we were before moving onto the new one.
There are candidates who would do exhaustive enumeration of all paths and then find the shortest one. I'd steer them away from that, but if they don't get the signal and insist trying that (someone did), I let them. It's trickier to get that right but it does show their familiarity with recursive algorithms.
Board = [
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 1, 0, 0, 1, 0],
    [0, 0, 1, 0, 1, 0, 0],
    [0, 0, 1, 0, 1, 0, 1],
    [1, 1, 1, 0, 0, 0, 0]
]

def bfs(board):
    q = [(0,0)]
    while len(q) > 0:
        pos = q[0]
        del q[0]
        if pos[0] == len(board) - 1 and pos[1] == len(board[0]) - 1:
            return True
        next_pos = [(x, y) for x, y in [
            (pos[0] + 1, pos[1]),
            (pos[0] - 1, pos[1]),
            (pos[0], pos[1] + 1),
            (pos[0], pos[1] - 1)]]
        for n in next_pos:
            x, y = n[0], n[1]
            if x >= 0 and x < len(board) and y >=0 and y < len(board[0]) and board[x][y] == 0:
                board[x][y] = pos
                q.append(n)
    return False

found = bfs(Board)
if found:
    path = [(len(Board)-1, len(Board[0])-1)]
    pos = (Board[len(Board)-1][len(Board[0])-1])
    while not (pos[0] == 0 and pos[1] == 0):
        path.insert(0, pos)
        pos = Board[pos[0]][pos[1]]
    path.insert(0, (0, 0))
    print(path)
The above should print out
[(0, 0), (0, 1), (0, 2), (0, 3), (1, 3), (2, 3), (3, 3), (4, 3), (4, 4), (4, 5), (4, 6)]
Another interesting way of keeping track of moves (lineage) is to just mark arrows on the board, to the effect of the following. Isn't this pretty?
Board = [
    [^, <, <, <, <, <, <],
    [^, ^, 1, ^, ^, 1, ^],
    [^, ^, 1, ^, 1, 1, ^],
    [^, ^, 1, ^, 1, v, 1],
    [1, 1, 1, <, <, <, <]
]

Shortest Path with Different Edge Cost
Difficulty medium.
Numbers in the game board can be potentially models as elevation. And rule applies what's the maximum elevation gain, or less in each step (say +/- 1). Then finding 'least effort' (absolute differences in elevation of each step) path to navigate the terrane can be solved by finding shortest path where cost of edge's not uniform.
Solution
Use Dijkstra. One could argue that a common implementation variant of Dijkstra (using heap) is very much the same as BFS (except queue is replaced with priority queue). This is more complex than it sounds like because most off-the-shelf heap library doesn't provide a delete-key/decrease-key operation. The easiest way (which is not at all easy) to implement this with off-the-shelf collection library is to use a BST and a hash map. Time complexity is O(ElogV).
Board = [
    [0, 1, 2, 3, 3, 3, 2],
    [1, 0, 4, 2, 0, 1, 2],
    [2, 3, 4, 0, 1, 1, 2],
    [1, 0, 3, 0, 1, 0, 4],
    [6, 7, 2, 1, 1, 1, 1]
]
Tetromino/figure walking the maze
Difficulty hard.
In the generic problem, we assume that the character walking the maze is a one-by-one square unit (hence it occupies one cell of the maze). We can extend the problem to use a tetromino or another rectangular figure, and allow the person to rotate it.
Solution
Solution to the problem is very similar, with the added cost of rotations; what's interesting is the way they structure the code as most of it is reusable if some of the functionality is modularized.

* Keys and Doors
Difficulty hard (probably too hard for interview because it requires a realization that is not obvious to people without training).
We can also put characters to the board where lower case represents keys (a, b, ...) and upper case doors (A, B, ...). A door can only be opened and walked through (from any direction) with corresponding key. You can collect any number of keys, and a single right key, can open any number of doors with the right lock (e.g. a key a can open multiple A doors. 
Solution 
This can be a follow up when people blaze through BFS. Thinking from the BFS case, we are expanding the search frontier of minimal distance (or cost in some variant) from entrance (source). Once we reach a key, you realize you need to start from that position, as if it's the new entrance, to see if you can find a path to destination, which becomes the same BFS problem before. This should lead to the realization, that the fact you get a key, you sort of reset the current (level of) exploration, rather, you "clone" the base map, and explore from the location of the key. You also realize for each unique set of keys in your pocket, you have a brand new map that you need to BFS. 

In term of code organization, given above framing, you realize the dimension of set of keys, can be added to the game board virtually, so you are navigating a 3D map, each layer is the same 2D map, with the 3rd dimension as set of keys. Transition along different slices is triggered by the fact you get a new key. In short, split the map into multiple layers (#layers = 2^#unique_key). 

The following's the code, it's quite similar to the BFS code. 
import copy

a = 'a'
b = 'b'
A = 'A'
B = 'B'

Board = [
    [0, 0, A, 0, 0, 0, 0],
    [0, 0, 1, 0, 0, 1, 0],
    [0, 0, 1, 0, 1, 1, 0],
    [b, a, 1, B, 1, 0, 1],
    [1, 1, 1, 0, 0, 0, 0]
]

def dict_set(d, x, y, z, v):
    zz = ",".join(z)
    if x not in d:
        d[x] = dict()
    if y not in d[x]:
        d[x][y] = dict()
    if zz not in d[x][y]:
        d[x][y][zz] = v
    else:
        d[x][y][zz] = v

def bfs(board, trace):
    q = [(0,0,set())]
    while len(q) > 0:
        pos = q[0]
        del q[0]
        if pos[0] == len(board) - 1 and pos[1] == len(board[0]) - 1:
            return (True, pos)
        next_pos = [(x, y, keys) for x, y, keys in [
            (pos[0] + 1, pos[1], pos[2]),
            (pos[0] - 1, pos[1], pos[2]),
            (pos[0], pos[1] + 1, pos[2]),
            (pos[0], pos[1] - 1, pos[2])]]
        for n in next_pos:
            x, y, k = n[0], n[1], n[2]
            if x >= 0 and x < len(board) and y >=0 and y < len(board[0]):
                if (board[x][y] == 0 or board[x][y] in k) and (x not in trace or y not in trace[x] or ",".join(k) not in trace[x][y]):
                    dict_set(trace, x, y, k, pos)
                    q.append(n)
                elif str(board[x][y]) <= 'z' and str(board[x][y]) >= 'a' and (x not in trace or y not in trace[x] or ",".join(k) not in trace[x][y]):
                    k2 = k if board[x][y].upper() in k else copy.deepcopy(k)
                    k2.add(board[x][y].upper())
                    dict_set(trace, x, y, k2, pos)
                    q.append((x, y, k2))
    return (False, "")

Trace = dict()
dict_set(Trace, 0, 0, {}, "end")
found = bfs(Board, Trace)
if found[0]:
    pos = found[1]
    path = []
    while not (pos[0] == 0 and pos[1] == 0):
        path.insert(0, pos)
        pos = Trace[pos[0]][pos[1]][",".join(pos[2])]
    path.insert(0, (0, 0, set()))
    print(path)

Follow up of their understanding of the construct is things like:
what if we can only carry fixed number of keys.
what if keys can only be used two times.

Shortest Path with Goodies
Difficulty not suited for interview.
If we put energy boosts (represented as +, meaning plus 10 energy) on the board, and think a traveler who would encounter certain cost per move (let's say each cost 1). Each energy bar would replenish certain amount of energy. Let's say traveler starts with certain amount of energy. Find the best way that traveler arrive at B while having most energy left.
Solution:
If it is assumed that there is no negative cycle, this can be solved with Bellman-Ford. It is an O(n^3) SSSP algorithm that is capable of handling negative edges. This algorithm is very simple in nature. However, it is rarely used, and there's a good chance candidate doesn't know about it.
If it is assumed that there exists negative cycle (as in the example graph), this problem is NP-Hard. Finding the shortest simple path in a graph with negative cycles can be reduced from longest-path problem.
```
Board = [
    [0, +, 0, 0, 0, 0, 0],
    [0, 0, 1, 0, 0, 1, 0],
    [0, 0, 1, 0, 1, 1, 0],
    [0, +, 1, 0, 1, 0, 1],
    [1, 1, 1, 0, 0, 0, 0]
]
````

Common questions
Parallel to actual question, there are interesting non-typical setup you can get signals, even without them writing code. For example, depending on how the candidate performed, I often follow up with questions like:
how much space they can use, or if they can mutate game board. (Both are allowed). 
What would be the time complexity of solving this with DFS? (exponential)
In BFS, what if we forgot to track visited set? Would the algorithm still work? (yes it works), What's the implication? (slower) How slow? (exponential).

Hiring Evaluation
No Hire
Unable to solve neither DFS and BFS.
Not able to proceed with hints. 
Not able to communicate issues that made him/her stuck. 
Maybe Hire 
Able to solve DFS or BFS.
Able to articulate how to approach BFS/DFS with some minor bugs.
Being able to communicate the solution.
Average Hire
Typical hire would solve both DFS and BFS with clean code.
Always demonstrate they know what they are doing. 
Some help's fine. 
Being able to work with interviewer, and taking hints is a good quality to have by itself.
clean up repeated statements, keeping code easy to read.
Strong Hire
Strong hire would be able to articulate keys/doors cases. 
Some help's fine. 
In the end, the solution to keys and doors are very much a like BFS, but requires strong grasp of what BFS is actually doing.