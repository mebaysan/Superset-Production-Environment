#! /bin/bash

# You should execute this script only if it's the first time you are setting up the Superset on your env

CONTAINER_NAME='superset'

sudo docker exec -it $CONTAINER_NAME superset fab create-admin \
               --username admin \
               --firstname Superset \
               --lastname Admin \
               --email admin@superset.com \
               --password admin

echo -e "\e[1;32m ADMIN USER CREATED! \e[0m"

sudo docker exec -it $CONTAINER_NAME superset db upgrade

echo -e "\e[1;32m DATABASE UPGRADED! \e[0m"

#sudo docker exec -it $CONTAINER_NAME superset load_examples

#echo -e "\e[1;32m EXAMPLES LOADED! \e[0m"

sudo docker exec -it $CONTAINER_NAME superset init

echo -e "\e[1;32m SUPERSET INIT COMPLETED! \e[0m"

echo -e "\e[1;32m YOU CAN VISIT: $APP_URL \e[0m"