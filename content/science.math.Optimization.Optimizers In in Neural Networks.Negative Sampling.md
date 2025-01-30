---
id: enrctficak8sv01aksvzk28
title: Negative Sampling
desc: ""
updated: 2024-12-15T22:35
created: 1642349473050
---

In a context where finally we have a 'classifier' that outputs a one-hot vector, 
we have essencially a large-cardinality multinomial distribution.

the likelyhood has terms then for all possible categories. They can be many (e.g. [[science.stats.Deep Neural Networks.Language Models#^word2vec]]).

Then, to speed up things, we pretend for this training example only that the multinomial distribution
is much smaller (e.g. pick 5 random 'negative' examples).
Then compute the loss and corresponding gradients (for this iteration) based on that.

[Source: Mccormickml tutorial](http://mccormickml.com/2017/01/11/word2vec-tutorial-part-2-negative-sampling/#:~:text=Negative%20sampling%20addresses%20this%20by%20having%20each%20training,output%E2%80%9D%20of%20the%20network%20is%20a%20one-hot%20vector.)
