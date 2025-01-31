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



# Notes about convolutional newral nets from 'new Bishop' book.

* translational invariance
* often used together with a max/avg pooling layer
* in the 90s and 2000s, there was stuff, related to neuroscience (cogni-something), but it needed greedy layer -wise training procedures.
* gabor base functions were used before; its observed that first cnn's layers often learn somethig similar to a gabor filter. this doesnt mean anything special about architecture because many architecture is could replicate a certain function classes.
*  often in order to also add translational in various rotationally various to translation one, input augmentation is used. to smudge, rotate, etc
*   are the definition of convolutions in a conversion of



# Summary of Key Points

- **Convolution vs. Cross-Correlation**  
  - The operation used in CNNs is technically cross-correlation, not a strict mathematical convolution.  
  - Despite the terminology, the result is similar to a convolution in practice and leverages translational symmetries.

- **Pooling Layers**  
  - Common pooling strategies: max pooling or average pooling.  
  - Pooling helps capture invariances by reducing spatial resolution.

- **Kernel Receptive Field**  
  - A k×k filter scans the image.  
  - Larger receptive fields emerge when multiple layers are stacked.

- **Strides and Trade-offs**  
  - Changing the stride alters computational cost vs. detail captured.

- **Data Augmentation**  
  - Since CNNs capture translational invariances more directly than rotational invariances, augmentations (flip, rotate, crop, noise) help the network generalize.

- **Rotational Equivariance**  
  - Some specialized architectures/papers address rotational invariance (e.g. Group Equivariant CNNs).

- **Gabor Filters**  
  - Early CNN layers often resemble Gabor filters, learning edges and simple patterns.

- **U-Net and Deconvolution**  
  - U-Nets use “transposed convolutions” (sometimes called deconvolutions) for upscaling.  
  - Tracking indices from pooling (e.g. “unpooling”) or using learned upsampling are ways to restore spatial dimensions.

- **Adversarial Attacks**  
  - Small perturbations (±δ) guided by gradient sign can fool the model.  
  - The gradient is taken w.r.t. the input pixels for a specific target class.

- **Style Transfer**  
  - A combined loss:  
    - **Content Loss:** preserves content features at certain layers.  
    - **Style Loss:** matches global statistics of feature maps (often at a layer where spatial info is reduced).  
  - The final image is optimized to minimize both losses.

- **Object Detection**  
  - Output includes both bounding-box coordinates and class labels.  
  - Intersection over Union (IoU) is used to compare predicted and ground truth boxes.

# Critique and Clarifications

1. **Transposed Convolutions for Upscaling**  
   - They do restore higher resolution feature maps. They are “learned” upsampling operators.  
   - In U-Net, additional strategies like “skip connections” help recover fine details.

2. **Index-Based Unpooling**  
   - Some architectures remember the “argmax” locations from max pooling and place outputs accordingly in the upsampled feature map.  
   - This is one method; transposed convolution is another.

3. **Rotational Invariance**  
   - Standard CNNs primarily handle translations. For rotational invariance, see:  
     - *Group Equivariant CNNs (G-CNNs)* by Cohen & Welling (ICML 2016)  
     - *Harmonic Networks* (Worrall et al.)  
   - These architectures explicitly incorporate symmetry transformations into the convolution operation.

4. **Style Transfer Details**  
   - Typically, style is captured via Gram matrices of feature maps (global correlations), not just post-pooling.  
   - This is why the network can match “texture” or “style” of one image while maintaining the “content” of another.

5. **Misconceptions or Gaps**  
   - Be careful with labeling transposed convolution as “inverting” the CNN. It’s an upsampling mechanism rather than a strict inverse.  
   - Content vs. style layers can be chosen flexibly depending on the desired outcome.

Overall, your recollections are sound—these notes align with common explanations of CNNs, their variations (U-Net), and applications (adversarial attacks, style transfer, and detection).