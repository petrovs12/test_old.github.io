---
id: iirbgfiteklo26mcbdvoqfr
title: Kernel Regression Methods
desc: ""
updated: 1737895420347
created: 1737894719963
---
Of course related to 
[[science.math.Functional Analysis.Kernel Methods]]

...

The basic idea would be to start with a adataset of the kind ""X", "Y", and then model the function we care about as :


$E(Y|X) = f(x)=E_y(y*P(Y|x))=\int_y(f(Y|x)*ydy)=\int_y( f_{X,Y}(y,x)*ydy/f_X(x))$

now, approximating the integral with a sum, we get:
$f(x) = \sum_i w_i(x) y_i$

where $w_i(x)=f(y,x)/f(x)$ are the weights we need to find.

We can model these weights by for example modelling them as $w_i(x)= k(x,x_i)/(\sum_{i=1..}k(x,x_i))$ where k is a kernel function.

Common further approximation is then:

An example would be the Gaussian kernel, where $k(x,x_i) = exp(-||x-x_i||^2/2\sigma^2)$. here basically the $\sigma$ parameter controls how much attention is paid to datapoints further away.

[Source](https://bookdown.org/egarpor/PM-UC3M/npreg-kre.html).
