---
id: sway8yohu4ekgaaxaws38p0
title: Inference Optmization
desc: ""
updated: 1737459124830
created: 1737455102133
---

# Model Optimization

* distillation
* LoRA
low rank on the update only. more reparametrization tricks
* quantization


#  pruning the network

## magnitude based pruning
 so in the magnitude base pruning as far as I see so like the hypothesis is this kind of lot ticket hypothesis meaning that essentially in a well trained network you have a bunch of kind of hidden structure or like you have relatively small amount of things that actually carries the information and you kind of had stumbled upon them, but while doing other stuff as well                                                  so they do there is that okay if we can actually prune the?e hypothesis is this kind of lot ticket hypothesis meaning that essentially in a well trained network you have a bunch of kind of hidden structure or like you have relatively small amount of things that actually carries the information and you kind of had stumbled upon them, but while doing other stu           so if we can actually prune the stuff we can get nicely structure matrixes inside so when technic is post training just to prune everything which has very low magnitude in the weights so it's going to be zero a or  or very small magnitudes other ways to kind of train prune and then retrain with the same learning schedule and maybe the same initialisation of courseation of course   or very small small maginteractively so do gradually with each with each subsequent thing with each subsequent training cycle gradually remove the the conne. or  or very small magnitudes other ways to kind of train prune and then retrain with the same learning schedule and maybe the same initialisation of courseation of course   or very small small maginteractively so do gradually.

  the final observation here is that structured pruning meaning just removing some weights doesn't really help and maybe we have to work on the level of certain blocks. the final observation here is that structured pruning meaning just removing some weights doesn't really help and maybe we have to work on the level of certain blocks.
 and another final observation is that like effective ning should follow the computation of structure meaning that we have to take into account data and model product and then  and then identify the thing the blocks that we can prune.
## permutation based pruning
 in order to figure out which parameter is important or not important in a neuron network I can do as follows. I will try to apply some kind of presentation testing technique. What would that look like? I have the weight and I have a bunch of the input data then what I'm going to do is at the end of the edge. I'm interested in. I'm going to replace the output with another random output from the batch and I'm going to just to do a permutation like this so whenever I have the output of this edge, I instead use output of this edge for some other data sample and then I measure t                                                                                                                                   
 tldr: do 'permutation testing' on the end of each edge in the network to figure out which parameters are important or not.


 # knowlegde distilation
  this is basically training case more model to mimic output of a larger model.
   the distillation loss function essentially minimise the difference between the soft max vectors between the teacher and the student model.the distillation loss function essentially minimise the difference between the soft max vectors between the teacher and the student model



# [[LoRA]]

https://lilianweng.github.io/posts/2023-01-10-inference-optimization/\

# basically doing low rank approximation

