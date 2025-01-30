---
id: zoqvqa3syyequj8u856skfl
title: "Huffman Coding:"
desc: ""
updated: 2024-12-15T22:35
created: 1641864734961
---
[[science.math.theory.Algebra.Matroids]]

Minimizes Entropy:

$min E(p(symb)*len(enc(symbol))) = E(-log_2 p*p)$ 
$len(symbol)= depth$

can solve by greedy:
build up tree bottom-up
every time join symbols w/ minimum prob/freq (and make another symbol for the join).
recover tree in the end
use priority queue to pop smallest frequency every time.

huffman coding also minimizes entropy.

* * *

greedy algo

* * *

## Dijkstra:

## 

negative edges:
combine op on edges
repeat |V|-1 times
if wanna detect negative CYCLEs repeat once more and obs is fixed point changes.
dijkstra wants prio queue

## Minimum Spanning Tree:

invariant: add minimal edge that doesn't add a cycle

## kruskal- do that, need prio queue and union find to keep track of partial forests

## Prim Algorithm

keep track of tree only; then use priority queue (similar to dijkstra then, almost same.

Vazirani algos:

## Horn clauses

 Implications, whose left-hand side is an AND of anynumber of positive literals and whose
right-hand side is a single positive literal. These express statements of the form “if the
conditions on the left hold, then the one on the right must also be true.” For instance,
(z ∧ w) => u
might mean “if the colonel was asleep at 8 pm and the murder took place at 8 pm then
the colonel is innocent.” A degenerate type of implication is the singleton “⇒ x,” meaning
simply that x is true: “the murder definitely occurred in the kitchen.”
2\. Pure negative clauses, consisting of an OR of any number of negative literals, as in
(!u ∨ !v ∨ !y)
(“they can’t all be innocent”).
Given a set of clauses of these two types, the goal is to determine whether there is a consis-
tent explanation: an assignment of true/false values to the variables that satisfies all the
clauses. This is also called a satisfying assignment.

So SAT is in general np-hard
but if instead set of horn clauses, greedy efficient
<https://tryalgo.org/en/satisfiability/2016/12/04/horn-sat/>
linear time algo for horn clauses (horn-sat, instead of SAT).
Another mention here:
<https://people.eecs.berkeley.edu/~sseshia/219c/lectures/SATSolving.pdf>

2-sat

Special Cases of 3-SAT that are
polynomial-time solvable
• 2-SAT
– T. Larrabee observed that many clauses in
ATPG tend to be 2-CNF
• Horn-SAT
– A clause is a Horn clause if at most one literal
is positive
– If all clauses are Horn, then problem is HornSAT
– E.g. Application:- Checking that one finitestate system refines (implements) anoth

<https://www.geeksforgeeks.org/2-satisfiability-2-sat-problem/>
so horn-sat and 2-sat
To understand this better, first let us see what is Conjunctive Normal Form (CNF) or also known as Product of Sums (POS). 
CNF : CNF is a conjunction (AND) of clauses, where every clause is a disjunction (OR).

## Now, 2-SAT limits the problem of SAT to only those Boolean formula which are expressed as a CNF with every clause having only 2 terms(also called 2-CNF).

so 2-sat is if we can make cnf w/ 2 clauses everywhere...

* * *

The two kinds of clauses pull us in different directions. The implications tell us to set
some of the variables to true, while the negative clauses encourage us to make them false.
Our strategy for solving a Horn formula is this: We start with all variables false. We then
proceed to set some of them to true, one by one, but very reluctantly, and only if we absolutely
have to because an implication would otherwise be violated. Once we are done with this phase
and all implications are satisfied, only then do we turn to the negative clauses and make sure
they are all satisfied

* * *

this scheme is linear-time and 'greedy' in the negative sense (we want many literals to be false cuase of the negative clauses.

* * *

horn clause thing:
2 types of clauses:
Positive Implicative:
rhs is single positive
lhs is any number of positive :
(a and b)=>c
=>c
.. etc
(a and b and c)=>d
pure negative:

## OR with negatives:

'greedy' :start with all false, then only make true is some implication is broken.
when all implications are ok, check all pure negatives.'

* * *

5.4. Set cover greedy approximation:

* * *

Pick the set w/ largest number of uncovered elements has ln(n) approximation ratio.

* * *

Shortest paths in dags are easy

* * *

dag-> can linearize

'

