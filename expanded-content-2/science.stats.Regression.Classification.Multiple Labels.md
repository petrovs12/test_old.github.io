---
id: yc6l9ymk65fqe0gignxv795
title: Multiple Labels
desc: ""
updated: 2024-12-15T22:35
created: 1646305163402
---
<https://machinelearningmastery.com/multi-label-classification-with-deep-learning/>
<https://github.com/keras-team/keras/issues/741>

One way is to use sigmoid output, but not normalize w/ softmax/multilabel likelyhood, and have the loss function be point-wise binary crossentropy
loss for each element, and sum them up (it works).

```

Q:
I need train a multi-label softmax classifier, but there is a lot of one-hot code labels in examples, so how to change code to do it?

A:elanmart commented on Sep 28, 2015
Don't use softmax. Use sigmoid units in the output layer and then use "binary_crossentrpy" loss.
```

**Actually it's equivalent to train a single binary classifier to everything, but the learned hierarchical representation before the last label 
is shared.**

## Keras Example

```{python}

# Build a classifier optimized for maximizing f1_score (uses class_weights)

clf = Sequential()

clf.add(Dropout(0.3))
clf.add(Dense(xt.shape[1], 1600, activation='relu'))
clf.add(Dropout(0.6))
clf.add(Dense(1600, 1200, activation='relu'))
clf.add(Dropout(0.6))
clf.add(Dense(1200, 800, activation='relu'))
clf.add(Dropout(0.6))
clf.add(Dense(800, yt.shape[1], activation='sigmoid'))

clf.compile(optimizer=Adam(), loss='binary_crossentropy')

clf.fit(xt, yt, batch_size=64, nb_epoch=300, validation_data=(xs, ys), class_weight=W, verbose=0)

preds = clf.predict(xs)

preds[preds>=0.5] = 1
preds[preds<0.5] = 0

print f1_score(ys, preds, average='macro')

```

