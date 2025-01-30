---
id: rgwltmcvtqgmwwpp7frbw2x
title: Paper Reads
desc: ""
updated: 2024-11-28T14:06
created: 1732792647128
---

#[Rethinking few shot image classification](https://arxiv.org/pdf/2003.11539) 
from 2020.

summary:

talking about meta learning, or learning to learn.

Setup
* many tasks (can think of classification tasks) with relatively few examples per task.
* have to fiture out how to make us good on all tasks, or how to learn to get good at a task quickly.

Approach:
 they make this simple **baseline**:
* learn a good input representation via self supervised learning, where input s from similar tasks are close to each other.
* train a line'ar classificer as a last layer on top of the representation.


Approaches they compare themselves to:
* metric based
   (find a metric)
* optimization based

They find that their approach is better than the others, and that meta learning stuff is not so important.




