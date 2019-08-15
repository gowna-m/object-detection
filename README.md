# TensorFlow Serving using Docker

### Hosting pretrained Object Detection model Tensorflow Serving, also create a Rest API.

In RetinaNet, an one-stage detector, by using Focal loss, lower loss is contributed by “easy” negative samples so that the loss is focusing on “hard” samples, which improves the prediction accuracy. With Resnet+FPN as the backbone for feature extraction, plus two task-specific subnetworks for classification and bounding box regression, forming the RetinaNet, which achieves state-of-the-art performance, outperforms Faster-RCNN, the well-known two-stage detectors.

Download the [zip file](https://drive.google.com/open?id=1Y7a5PzRlxcESmFMi7jB8hjeLS5VUYOYV) and extract it in the 'model' directory.

Steps to host an OD model on Tensorflow serving using Docker:
- Create a docker file with the base image as Ubuntu and other dependencies.
