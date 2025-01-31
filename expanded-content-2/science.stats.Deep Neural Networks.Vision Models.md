---
id: zeywdat8604r66tx2ewrbrl
title: Image Classification
desc: ""
updated: 2024-12-15T22:35
created: 1644706160543
---
[[science.stats.Deep Neural Networks#^cnn]]

Normally these models are trained on ImageNet and top-5 classification accuracy is reported.

Here are some of the current champions that are also available as [[science.engineering.technologies.MLOps.ONNX]] models.

## VGG-16

![](/assets/images/2022-02-12-23-49-48.png)
[Keras Link](https://keras.io/api/applications/vgg/)

## ResNet

Uses Shortcut connections

## EfficientNet-Lite4

[Paper Link](https://arxiv.org/abs/1905.11946)
[ONXX](https://github.com/onnx/models/tree/main/vision/classification/efficientnet-lite4)

# Object detection and Image Segmentation

Object detection and image segmentation algorithms draw rectangles on a picture and put labels on them.

## Evaluation metrics

A common evaluation metric are (from [here](https://medium.com/@vijayshankerdubey550/evaluation-metrics-for-object-detection-algorithms-b0d6489879f3)):

### Intersection over Union (IoU):

 Evaluate the overlap of the two bounding boxes. Requires a true and predicted bounding box. So then we have something like:

 Intersection Over Union on top 5 Labels.

### COCO mAP

For the COCO 2017 challenge, the mAP was calculated by averaging the AP over all 80 object categories AND all 10 IoU thresholds from 0.5 to 0.95 with a step size of 0.05. The authors hypothesize that averaging over IoUs rewards detectors with better localization.

## Models/Algorithms

### Yolo3

[YoloV4](https://github.com/onnx/models/tree/main/vision/object_detection_segmentation/yolov3)

# Body, Face, And Gesture Analysis

# Image MNanipulation

- Unpaired Image To Image Translation
- Super REsolution 
- Fast Neural Style Transfer

