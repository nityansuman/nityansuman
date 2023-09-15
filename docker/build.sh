#!/bin/bash

# Build and run the dev-env
# docker build --no-cache -t dev-image -f Dockerfile --rm --build-arg BUILD=dev .
# docker run --gpus all -it -d --name dev-env -p 8888:8888 -v /mnt/sda3/LabX:/LabX/ dev-image:latest

# Build and run the mongo-env
# docker pull mongodb/mongodb-community-server:latest
# docker run -d -p 27017:27017 --name mongo-env mongodb/mongodb-community-server:latest

# Create docker network
# docker network create docker-network
# docker network connect docker-network mongo-env
# docker network connect docker-network dev-env
# docker network inspect myNetwork
