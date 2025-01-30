---
id: 1s1qua98y20mxc4vgo4rh72
title: Maximum Hard/soft margin classifier
desc: ""
updated: 2024-12-15T22:35
created: 1643189896221
---
# Key Insight

Take dual. Notice $x_i$ in dual participates only in $x_i\cdot x_j$ terms 
Mercer condition:  can do the kernel trick for unknown kernel. ^key_insight

Choose dot product so it supports nonlinearity.

[[science.math.Optimization.Convex Optimization]]

# Model and Algorithm

We're solving a [[science.stats.Regression]] type problem

## Support Vector Classification ^svc

Starting w/ linear max-margin classifier. Let us assume the 2 classes are linearly separable,  the separating hyperplane be L $wx+b$ and let it be the case it. Then
(as an exercise!) show that the maximum margin, i.e. the distance of the 2 lines, parallel to L, that touch the 2 classes, is:
$2/||w||$.

![](https://vitalflux.com/wp-content/uploads/2020/07/Screenshot-2020-07-07-at-3.44.38-PM-300x162.png)

**It's an exercise to see why the above is the case!!!**

Then we can pose the problem as :

$max_{w,b} 1/||w||$  = $min_{w,b} ||w||^2$
$\text{subject to } w^Tx_i+b>=1 if y_i=1$
$\text{subject to } w^Tx_i+b<=-1 if y_i=1$

We can solve this by taking the dual of the above and look at the [[science.math.Optimization.Convex Optimization.KKT Slater Complimentary Slackness Karush Kuhn Tucker]] conditio[[science.math.Optimization.Convex Optimization.KKT Slater Complimentary Slackness Karush Kuhn Tucker]] condition.

The key, as we discussed, that is in the dual we only see the datapoints as dot products [[science.stats.Support Vector Machines#key-insight]]. 

Because of that, we can use [[science.math.Functional Analysis.Kernel Methods]]

#TODO- write down dual etc.

# Soft-Margin CSV

#TODO- write down dual etc.

# $\nu$-SVM

#TODO -look at Oxford lectures and check it out.

