---
id: ku3bm5dyzlgzul3ebqtrgeh
title: Input and Outputs
desc: ''
updated: 1732785150592
created: 1732785150592
---


[[science.CS.theory.NLP]]
# tokenization, padding, positional encoding, and masking
## tokenization
first split words into tokens, then convert tokens to integers to do an [[science.stats.Deep Neural Networks.Embeddings]] lookup. 
each token is converted to an integer id. more complex embedding are also possible.

## positional encoding

Can use a linear positional encoding; sinusuidal is also reasonable, or some other continous periodic function;

## Padding
we pad the inputs to ensure everything is the same length, so then we can batch them together.
We use the masking matrix to add to the softmax layer to ignore the padding tokens.

$softmax(X*W + b+mask)+... $and if $mask =-\inf$ where the padding is, then the softmax will ignore the padding tokens.
[source](https://github.com/tensorflow/tensorflow/issues/11756#issuecomment-396755424)


This helps the [[science.stats.Deep Neural Networks.GPUs]] for more efficient computations
## Masking
paddings are used to make the matrices nicely shaped
can use a mask to silence out the padding tokens.

# Worked example
