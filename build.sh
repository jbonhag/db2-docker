#!/bin/bash
IMAGE_NAME="db2"

docker build -t $IMAGE_NAME .
docker run --privileged=true -t $IMAGE_NAME ./create_database.sh
CONTAINER_ID=$(docker ps -l | grep $IMAGE_NAME:latest | awk '{print $1}')
docker commit $CONTAINER_ID $IMAGE_NAME
# Below is required to set the default command so that the image can be run using "docker run --privileged=true -P -d -t $IMAGE_NAME"
docker run --privileged=true -d -t $IMAGE_NAME su -c "db2start && read -p 'waiting'" - db2inst1
CONTAINER_ID=$(docker ps -l | grep $IMAGE_NAME:latest | awk '{print $1}')
docker stop $CONTAINER_ID
docker commit $CONTAINER_ID $IMAGE_NAME

