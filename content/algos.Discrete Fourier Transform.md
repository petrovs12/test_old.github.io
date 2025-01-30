---
id: 631odr0jezjtcy7w43jf1c3
title: DFT
desc: ''
updated: 1659207125216
created: 1659172713347
tags:
  - excalidraw
excalidraw-plugin: parsed
---
[Link from Cp algorithms](https://cp-algorithms.com/algebra/fft.html)

[[science.math.Functional Analysis.Functional Spaces.Bases]]

input:
Periodic function $f(x) \in R$, output: 
an infinite vector with the coefficients of $e^{i\pi(x/n)}f(x),\forall n\in N$ 

Discrete Fourier Transform:

```
Input:
set of values

then pretend there is a function:
A(i)=A[i]
and then we get the DFT of that function.
```

So effectively we get a representation of the array, pretending it's a function, by figuring out the set of coefficients in some functional space it belongs to.

Why would we do that?
:
Well, the fourier transform is an integral transform, and integral transforms often turn composition operations into pointwise multiplication operations.

That's kind of the point of the fourier transform, as if it's applied to the coefficients of 2 polynomicals, then it allows us to findthe DFT of their product as well as just a pointwise multiplication of the transforms of the 2 polynomials, and then invert...

Then the complexity of this obviously fundamental operation goes from $O(N^2$ to $O(nlog(n)))$.

A DFT of an array is the evaluation of the polynomial w/ coefs the elements of the array:
$P(x)=a[0]+a[1]x+a[2]+a[3]x^2+...+a[n-1]x^{n-1}$

on the set of the n-th roots of unity:
$\{e^{2i\pi(x/n)}\}, x=0,1,2,...,n-1$

Obviously we can find this by solving a linear equation.

However, why DFT is quick?
Let $A$ be a polynomial, and we split it into $A_0,A_1$, such that $A_0$ is the polynomial w/ the evenly-numbered coefficients of A, and $A_!$ is the one with the oddly numbered coefficients of A.

Then:
$A(x)=x^2A_0(x)+xA_1(x)$
where $len(A_0)=len(A)/2$

then by the [[science.CS.algos.Master Theorem of Algorithmic Complexity]] the complexity of computing A would be $O(nlog(n))$

# [Inverse FFT](https://cp-algorithms.com/algebra/fft.html)

it's the same, also the Vandermonde matrix pops up here...s

==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'

# Excalidraw Data

## Text Elements

fourier
 ^x0ozTe1h

%%

## Drawing

```compressed-json
N4KAkARALgngDgUwgLgAQQQDwMYEMA2AlgCYBOuA7hADTgQBuCpAzoQPYB2KqATLZMzYBXUtiRoIACyhQ4zZAHoFAc0JRJQgEYA6bGwC2CgF7N6hbEcK4OCtptbErHALRY8RMpWdx8Q1TdIEfARcZgRmBShcZQUebQAWbQAGGjoghH0EDihmbgBtcDBQMBKIEm4IAGUAdgAhbA4ANQBHAGFmAA0jKFIAMQAlTQARSQAOOH1UkshYRArA7CiOZWCp

0sxuZwBGJMSeavid0eOANmqt0eqAVn5SmE2AZlGATm0Hk6uL0avn0ZOHnijW6QCgkdTcHgfbRbH5XeJXF6jeIPa7AqQIQjKaTcLbPapvZ4IrY8X6jQHEm6FSDWFbiVBJNHMHpsADWCFabHwbFIFQAxFsEAKBWtIJpcNgWcpSMIOMQOVyeRIetZmHBcIFsiKIAAzQj4fCVWCrCSCDxapnStkAdTBkghjOZbMNMGN6FN5TR0r8kg44VyaC2aLYauwa

nuAaSDKpEClwjgAEliP7UHkALpo7XkTKJ7gcIT6tGEWVYCq4FKemXEX3MZPFabQeB0h5UgC+jIQCGIOKSW2qJ2JWxOJzRjBY7C4aB4gejo9YnAAcpwxDiHkkHg8tpvnvFC8whukoJ3uNqCGE0ZpKwBRYKZbLJvMF6NCODEXCHrsB6o8K6Qr5kyNokQHAsrm+b4IBbASkeaAnvgYSFG2hR1pA5QSJgSRsEYAAqgp2misx0tAWBQFqGxoM4q7aFOg5

JMcfznJclL1uGqAUZuCTwpCZw8O8AJAtGoLEOCaBQg8zziXx/Z8cSaKSBiWIkWgVxRvWNKuippQWqy7KctyfJCoKSDnuKkperK8p6Uq5AcKq6pZCRGZ6gaRqEe6XYOpaCA2kJdqTh52nOq6EBuVqXpYtWybTvWwbimG3YaZAsbPomyZphmWYIDmaAPuB0ZFsQJYSLgWyhZWEWgY+9ZhNBqDxB8364gcI5MHOE6oJuzVjguS50ls8SQkkcLPBcu77

sE77HqeCDnleN72feYFos+r4TZ+36/i8JJ4oBRYgdli3RlyUEfqgsFntGh6YIp6DasIpCEEwAA6XCepQOFXRUt0iA9pDPVqt3ZJUhBGHSPAJTqnBQL0uD6HqLFMaUl1QAAgkQyhtRAwTag5M5MFA5gEKjmIY1AwZano2S4EWTBZagOVBvd/gEO910Q99T0vdGuBCKT/ThMDdI9EI02HdTAAS8nYgGVFXAh4DpnQuBwHAhpvnSdbQHJmQVGj2K3Aw

D0ULUJlJeZumKugvLatbNtrBA2AiBqUDxoe+iGp5FkWxA/KGcK+sO6QTsuxkxsSqbcrmxUyo2WqTt2wHQeu70TmBa5nIeoU9uO/Zwdu46Xm2vamcJznrvuwFLkVCF/vZ9kuf9MI4V+jiNeB6XGQAPIhnFEYaVnbd10nkPQ7D+Dw63icZL0kNAyDEJ9yXg8ZCzRPozrCDY/HtfO2XUSkCjgdsBQcm4Cd9PF9vueXrKyOH8fIQnRA6rSlQE/t/ot8v

1hjbzJWdvMNgaU+oOgQiRNoE4SRngogRsFQBnJ8AAE1uDfCSMkAakY8QfBON+fWRg2AGG4MhBgBBhY4gQm/Je+gG5CFlOVCQZl3KZylCQWeoM+7MOIIaBAcBuAwI4QAWTYAVa+uBNDBBOmdEWpQOGe0IdGWonJH68laM8FRKitR82UPmdUfJLxDD0XoiA5CL4DygOXNkXd8acAWpVSAmYYYID5sWe6yw5H1iyKI8R3AhZSNKNgIgPC0A+LRBwBx3

jSDCyDDzICgsIkIGMaUOwAArBAixmCVFCXAQRwjQliJqpI/W4p8aMCwvg/AbjEY/xNOkRY45yZCCZAYb+cx9q2MgEdNkEipqAVCCjWpJSykVXwHLMAiE7F6nCIQlsIAWxAA=
```

%%

