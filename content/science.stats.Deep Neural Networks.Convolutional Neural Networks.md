---
id: tsvvk8ygp5mcw9n1frqenrz
title: Convolutional Neural Networks
desc: ""
updated: 1733588558588
created: 1732786218658
---
* training translational invariance.
* patches with trainable parameters, then use 'max:
$X'_{i,j}=max( Frob(W, X_{[i;i+a],[j;j+a])} + b)$
* $Frob$ is the Frobenius norm, $W$ is the filter, $X_{[i:i+a,j:j+a]}$ is the patch , $b$ is the bias.
* $a$ is the stride.
* $X'{i,j}$ is the output of the max pooling layer.
* basically, we slide the filter over the image, and take the max value for each patch.

Do a bunch of these operations to get multiple convolutions, also do multiple layers.

* note if there are different input channels (RGB)- account for that.


# Computational tricks/improvements.

# main parameters
* filter size
* stride (both determing the padding as well)
* depth (number of filters)
