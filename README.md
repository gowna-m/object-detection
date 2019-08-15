# TensorFlow Serving using Docker

### Hosting pretrained Object Detection model Tensorflow Serving, also create a Rest API.

In RetinaNet, an one-stage detector, by using Focal loss, lower loss is contributed by “easy” negative samples so that the loss is focusing on “hard” samples, which improves the prediction accuracy. With Resnet+FPN as the backbone for feature extraction, plus two task-specific subnetworks for classification and bounding box regression, forming the RetinaNet, which achieves state-of-the-art performance, outperforms Faster-RCNN, the well-known two-stage detectors.

Download the [zip file](https://drive.google.com/open?id=1Y7a5PzRlxcESmFMi7jB8hjeLS5VUYOYV) and extract it in the 'model' directory.

Steps to host an OD model on Tensorflow serving using Docker:
- Create a docker file with the base image as Ubuntu and other dependencies.
- Build the Docker image using `$ sudo docker build -t retinanet_od_testing .` 
- Run the Docker container using `$ sudo docker run retinanet_od_testing:latest --name= retinanet_od_testing -p 8603:8603 --mount type=bind,source=<src directory>,target=<target directory> -e MODEL_NAME=retinanet_od -t tensorflow/serving`
- Run tf serving on the docker image using run_tf_serving.sh: `run_tf_serving.sh file($ tensorflow_model_server --port=8601 --rest_api_port=8602 --model_name=retinanet_od --model_base_path=target_path/retinanet_od`
- Predictions are viewed by running the client file(of the corresponding model architecture) using `$ python3 retinanet_client.py --server=127.0.0.1:8601 --img_path=<target-directory/image-name.jpg>` or you can use, `python3 retinanet_client_copy.py --server=127.0.0.1:8601 --img_path=<target-directory/image-name.jpg>`
- The result will be saved in the target directory.


### Creating a Flask API
  All the commands mentioned below are to be executed within the Target Directory.
- Run the Flask API inference file using: `python3 flask_api_prediction.py`
- Run requests_flask.py to make post request to image url using: `python3 requests_flask.py --img_url=<link to Image>`
  It will be saved under a default name '1234.jpg', in the target directory.
- Run python_retinanet_client.py using the image downloaded from the url: `python3 retinanet_client.py --server=127.0.0.1:8601 --img_path=<target-directory/1234.jpg`  or you can use, `python3 retinanet_client_copy.py --server=127.0.0.1:8601 --img_path=<target-directory>/1234.jpg`
