---
id: c49ddgvskwkdikxqfvi1ag4
title: Heap, Stack, etc
desc: ""
updated: 2024-12-15T22:35
created: 1643739415373
---
![Low-Level Memory Model ](https://cdn.hackernoon.com/hn-images/1*nT3RAGnOAWmKmvOBnizNtw.png)

![this classic chart](http://ithare.com/infographics-operation-costs-in-cpu-clock-cycles/)

Minimizing cache misses w/ numerical algorithms:
row-major and column-major optimization.

![Virtual Memory](https://bayanbox.ir/view/581244719208138556/virtual-memory.jpg)

![Stacka and heap 2](https://camo.githubusercontent.com/ca96d70d09ce694363e44b93fd975bb3033898c1/687474703a2f2f7475746f7269616c732e6a656e6b6f762e636f6d2f696d616765732f6a6176612d636f6e63757272656e63792f6a6176612d6d656d6f72792d6d6f64656c2d352e706e67)

# Type Stability

Why is the inference algorithm able to infer all of the types of g? It's because it knows the types coming out of f at compile time. Given an Int and a Float64, f will always output a Float64, and thus it can continue with inference knowing that c, d, and eventually the output is Float64. Thus in order for this to occur, we need that the type of the output on our function is directly inferred from the type of the input. This property is known as type-stability.

An example of breaking it is as follows:

```{julia}
function h(x,y)
  out = x + y
  rand() < 0.5 ? out : Float64(out)
end
```

Here, on an integer input the output's type is randomly either Int or Float64, and thus the output is unknown:

