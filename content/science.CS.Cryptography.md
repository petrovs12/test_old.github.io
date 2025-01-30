---
id: ik0ag5kqlvz0vo24x5ywstx
title: Cryptography
desc: ""
updated: 2024-12-15T22:35
created: 1642078452738
---
## Private-key schemes (one-time pad, AES, etc)

#TODO

## RSA Cryptography

Bob:

* Pick at random 2 large ($n$-bit) primes
* Pick $e$- relatively prime to $(p-1)(q-1)$. Public key is $(N,e)$, $N=pq$.
* Secret key is $d=e^{-1}(mod (p-1)(q-1))$, computed via extended Euclid algorithm (!!!). This step he can do, cause he knows $p$ and $q$.

Alice, sending message $x$ to bob:

* Looks up public key $(N,e)$, and sends him $y=(x^e mod\text{ }N)$
* $(y^d mod \text{ }N) = ((x^e)^d mod\text{ } N) = (x^(e*d) \text{ }mod N) = (x^1 \text{ }modN) = x$  
So Bob computes $y^d mod\text{ }N$, and gets back $x$.

The above relies on the fact that factoring $N=pq$ is hard, and thus an eavesdropper can't get $(p-1)(q-1)$ and thus the secret key $d$.