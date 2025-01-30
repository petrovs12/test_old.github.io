---
id: i4szyl4bapumbdgy7u4fxub
title: Newton-Rhapson Method
desc: ""
updated: 2024-12-15T22:35
created: 1641834943467
---



Let's try to solve $f(x) = 0$ iteratively for a sufficiently smooth function $f$.
We have $0 = f(x) \approx f(y) +(x-y)f'(y)$. Thus $x-y = -\frac{f(y)}{f'(y)}$
If we plug in $y = x_{i}$, $x = x_{i+1}$, we have a proposal for the iterative update $x_{i+1}-x_{i} = -\frac{f'(x_i)}{f(x_i)}$.
We can calculate appropriate step size for this if we instead write the above to 2nd order of approximation.
#TODO



