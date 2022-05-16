#! /bin/bash

# You can execute this script when you want to run Superset on your environment.
# * You had to executed the `first-build-superset.sh` before execute this.

CONTAINER_NAME='superset-live'

APP_URL='http://localhost:8088/'

sudo docker container rm -f $CONTAINER_NAME

echo -e "\e[1;31m CONTAINER REMOVED: $CONTAINER_NAME \e[0m"


sudo docker run -d -p 8080:8088 --net=host --name $CONTAINER_NAME local/superset

echo -e "\e[1;32m CONTAINER CREATED: $CONTAINER_NAME \e[0m"

echo -e "\e[1;32m YOU CAN VISIT: $APP_URL \e[0m"
