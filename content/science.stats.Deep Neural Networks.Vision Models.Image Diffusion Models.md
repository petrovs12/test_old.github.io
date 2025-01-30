---
id: blvjuupe6v1az8t706sxfty
title: Image Diffusion Model
desc: ""
updated: 2024-12-15T22:35
created: 1727464484953
---
## denoising models
once trained, the gdiffusion model is able to generate images from gaussian noise...


## diffusion models
very successful, denoising process, trian by
adding noise to images.


## add some amount of noise to the image
depending on how much you add, you can be close or not to the image...

```mermaid 
flowchart TD
    A[Input Data] --> B[Encoder]
    B --> C{Latent Space Z}
    C --> D[Reparameterization]
    D --> E[Decoder]
    E --> F[Reconstructed Data]
    A -- Reconstruction Loss --> G[ELBO Calculation]
    C -- KL Divergence --> G
    F -- Output --> H[Final Loss]
```

