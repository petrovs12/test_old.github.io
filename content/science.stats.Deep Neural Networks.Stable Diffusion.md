---
id: rxophnhwko9qxo1emfwkp74
title: Stable Diffusion
desc: ""
updated: 2024-12-15T22:35
created: 1727464349619
---


 diffusion' models work in' the following way:

 1. train them on a large dataset of images
 2. post-training, input a random noise and get back an image (can use [[science.stats.Deep Neural Networks.Embeddings]] to add a textual prompt and get an image like that as well).
 3. the model is 'denoising', i.e. at train'ing time, we pass it an image with noise and ask to 'fix it', similar to [["]].

