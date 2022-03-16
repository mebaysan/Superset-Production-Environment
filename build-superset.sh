#! /bin/bash

# You can execute this script when you want to run Superset on your environment.
# * You had to executed the `first-build-superset.sh` before execute this.

CONTAINER_NAME='superset'

sudo docker container rm -f $CONTAINER_NAME

echo "Container silindi!: $CONTAINER_NAME"

sudo docker run -d -p 8080:8088 --net=host --name $CONTAINER_NAME local/superset

echo "Container olusturuldu!: $CONTAINER_NAME"
