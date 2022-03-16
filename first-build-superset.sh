#! /bin/bash

# You should execute this script only if it's the first time you are setting up the Superset on your env

CONTAINER_NAME='superset'

sudo docker container rm -f $CONTAINER_NAME

echo "Container silindi!: $CONTAINER_NAME"

sudo docker run -d -p 8080:8088 --net=host --name $CONTAINER_NAME local/superset

echo "Container olusturuldu!: $CONTAINER_NAME"

sudo docker exec -it $CONTAINER_NAME superset fab create-admin \
               --username admin \
               --firstname Superset \
               --lastname Admin \
               --email admin@superset.com \
               --password admin

echo "admin user olusturuldu!"

sudo docker exec -it $CONTAINER_NAME superset db upgrade

echo "database upgrade edildi!"

sudo docker exec -it $CONTAINER_NAME superset load_examples

echo "example loaded!"

sudo docker exec -it $CONTAINER_NAME superset init

echo "superset init completed!"