---
id: p2bziw2j9sjt5f7gvf1deft
title: Recursive Expression
desc: ""
updated: 2024-12-15T22:35
created: 1658947265876
---
Number of valid parentheses strings with n opening brackets and n closing brackets.

# Analytical Solution

It's q beautiful bijection- 
We know the number of catalan numbers are all monotonic paths in a grid (nxn), which don't cross the main diagonal.
Hence the 'bad paths' are the ones that do cross it.
Now, how many bad paths are there?
Well, all the bad paths do cross the main diagonal.

For each bad path, if we find the first point at which it does cross it, we can mark that
Then we can **reflect the rest of the path** with respect of the main diagonal?

Then this one will end at (n+1,n-1). 
We can prove that this is in fact a bijection.

Then the total number of catalan numbers is:
$C(n,k) = \binom{2n}{n}-\binom{2n}{n-1}$
s

