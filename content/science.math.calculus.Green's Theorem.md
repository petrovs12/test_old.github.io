---
id: 49pzz0it8wgd1h2h6igvroi
title: Proof
desc: ""
updated: 2024-12-15T22:35
created: 1657004865948
---
This gives the relationship between line integral of a simple loop and a double integral of a 2D region in a plane the sipmle loop encircles.

![](/assets/images/2022-07-05-09-14-11.png)

 Note to self:

 The circle on the integral denotes that we traverse the thing clockwise. Interestingly, as the integral symbol+ the $dx$ notation together determine what the 'sum' is taken over, we can expect some tricky notations there.

Take the two most 'distannt' points, along x, so we can split the curve $C$ into $C_1,C_2$, and have both be parametrized 
$C_1 = (x,f_1(x))$, $x\in[a,b]$
$C_2 = (x,f_2(x))$, $x\in[a,b]$

Then, to traverse C clockwise, we traverse $C_1$ forward, and $C_2$ backwards.

$$
\int_{C} dx = \int_{C_1} dx + \int_{C_2}  dy
\\
\int_{C}P dx = \int_{C_1}P dx + \int_{C_2} P dy
\\


$$

Then:

$$
\int_D \frac{dP}{dy} dy dx =  \int_{a}^{b}\int_{f_1 (x)}^{f_2 (x) }\frac{dP}{dy} dy dx = \\ 
\int_{a}^{b} P(x,f_2(x))-P(x,f_1(x))- dx \text{ fundamental th. of algebra} = \\
\int_{C_2} P dx-\int_{C_1} P dy  = \\
-\int_{C} P dx


$$

Similarly for Q, we arrive to the above...

To summarize:

1. We aplit the region into 2 curves, then re-parametrized the internal stuff, using the 'lower' and 'upper' curve.
2. We showed that using thie representation and the fundamental theorem of algebra, we have what we need for the x-portion of the curve-normal integral
3. Analogous for $Q$

# [[science.math.calculus.Stokes Theorem]]

