#!/usr/bin/env bash
tensorflow_model_server --port=8601 --rest_api_port=8602 --model_name=retinanet_od --model_base_path=/etc/object-detection/model/retinanet_od/
