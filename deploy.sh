#! /bin/bash
INPUT_SERVER="server"
INPUT_CLIENT="client"
DOCKER_IMAGE_SERVER=devignesh/grpc_server
DOCKER_IMAGE_CLIENT=devignesh/grpc_client

if [ "$1" == "" ]; then
    echo "Please tell what to run, eg: ./deploy server";
    exit 1;
    # Run Server
elif [ "$1" == $INPUT_SERVER ]; then
    echo "Running server...";
    docker run -it $DOCKER_IMAGE_SERVER;
    # Run Client
elif [ "$1" == $INPUT_CLIENT ]; then
    echo "Running client...";
    docker run -it $DOCKER_IMAGE_CLIENT;
else
    echo "invalid command!";
    exit 1;
fi