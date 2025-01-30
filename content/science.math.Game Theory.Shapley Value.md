---
id: pnsrvfs70q0yt5row26e821
title: Shapley Value
desc: ""
updated: 2024-12-15T22:35
created: 1644871809889
---


Let us have a cooperative game with player set $P$.  payout function $p:2^P->R^{+0}$. 
We're trying to find an allocation function $f:P->R^{+0}$

'Fairness axioms':
1. Dummy player: 
 if foreach $S\subset P,A\notin S$, $p(P \cup  A) = p(P) => f(A)=0$
2. Equivalent Players$A,B$:
 if foreach $S\subset P,A,B\notin S$, $p(P \cup  A) = p(P\cup B) => f(A)=f(B)$
3. Full Payout
 $\Sigma_{c\in P}f(c) = p({c | c \in P})$
4. linearity


Then the there exists a unique function that's shapley's value



The shapley values, applied via [[science.stats.Permutation Tests]] to a black-box model, are used in [[science.stats.Machine Learning.Interpretability]].

