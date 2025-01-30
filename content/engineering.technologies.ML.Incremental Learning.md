---
id: zpyix1u4xoskvj7o2rjva05
title: Incremental Learning
desc: ""
updated: 2024-12-15T22:35
created: 1645142020256
---

(Incremental Learning Algorithms)[https://datascience.stackexchange.com/questions/75198/which-model-is-better-for-incremental-learning]

Keras - freeze some layers, train last few
https://gokhang1327.medium.com/how-to-create-a-text-classifier-online-incremental-learning-with-creme-ml-6aac9d869e5c
[Creme](https://pypi.org/project/creme/)


From [datascience stack exchange ](https://datascience.stackexchange.com/questions/75198/which-model-is-better-for-incremental-learning)
```
I will say, it's an either Or situation

You can pick one of "Incremental/Online" training Or "addition of new class".

You may do a fine-tuning approach with a Neural network by adjusting the o/p layer and training the last few layers. But this approach expects the new data to be quite similar to the training set.
KNN - Can do the online stuff but it doesn't do training. It simply calculates all the distances at the time of prediction. So, no reduction in computing. But you might have to compromise on accuracy if it is not the best
Scikit-Learn SGD Classifier can help with online training but can't support new classes

For classification, a somewhat important thing to note is that although a stateless feature extraction routine may be able to cope with new/unseen attributes, the incremental learner itself may be unable to cope with new/unseen targets classes.
SGDClassifier

Other models e.g. SVM/DT doesn't support incremental learning naturally. Though there are suggested approaches on the internet. But may not be simple. See these references.
journalofbigdata A Good SE read

I am not sure how will you figure it out if it is a new Class unless you have a separate arrangement because the model will predict it an existing Class anyway. Assuming you have a setup for that. We may try below approach -
Till the time, the prediction is within "known class" - do an Online training.
When the data is for a "New Class", do a full-data training.
With this approach, you can reduce the frequency of full-data training.

A simple Neural network can be a good candidate for both purposes. You can also get class probability with it.
```

