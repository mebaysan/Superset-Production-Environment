#! /bin/bash

# You should execute this script everytime when you changed something in `superset_config.py`
IMAGE_TAG='local/superset'

sudo docker image build -t $IMAGE_TAG .