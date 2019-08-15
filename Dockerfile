FROM ubuntu:18.04
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install --no-install-recommends -y apt-utils curl python3.5  python3-pip vim git python3-setuptools ca-certificates  gnupg2 build-essential libsm6 libxext6 libglib2.0-0 libxrender-dev
RUN apt-get update && apt-get install -y --no-install-recommends python3-dev python-dev libevent-dev build-essential
RUN echo "deb [arch=amd64] http://storage.googleapis.com/tensorflow-serving-apt stable tensorflow-model-server tensorflow-model-server-universal" | tee /etc/apt/sources.list.d/tensorflow-serving.list && curl https://storage.googleapis.com/tensorflow-serving-apt/tensorflow-serving.release.pub.gpg | apt-key add - && apt-get update && apt-get install tensorflow-model-server 
RUN pip3 install grpcio numpy opencv-python tensorflow tensorflow-serving-api keras-retinanet flask requests
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /root/.cache/*
ADD /model /etc/object-detection/model
RUN chmod 777 /etc/object-detection/model/run_tf_serving.sh
WORKDIR /etc/
ENTRYPOINT ["object-detection/model/run_tf_serving.sh"]

