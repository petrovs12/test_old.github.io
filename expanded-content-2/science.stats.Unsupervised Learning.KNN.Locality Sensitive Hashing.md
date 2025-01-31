---
id: bs0hn8hebgaqw9kqrmisagj
title: Locality Sensitive Hashing
desc: ""
updated: 2024-12-15T22:35
created: 1646305736478
---

(Random Projection Based Algorithm)[https://en.wikipedia.org/wiki/Locality-sensitive_hashing#Random_projection]

Let the elements $v$ are $m$-dimensional.

Choose $k$ random hyperplanes in $R^m$, represented by their normal vectors $r_1,r_2,...r_k$.

Encode $h_i(v) = [sign(v\cdot r_i)]$, so which side of the hyperplane the thing is on.
Then $\vec{h}(v)=[h_1(v),h_2(v),...]$
Then one can prove the probability of the hashes being close if the items are close is high.

Related to [[science.math.Functional Analysis.High Dimensional Neighborhood Search.Random Projections]]

