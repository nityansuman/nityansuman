#!/bin/bash
docker build --no-cache -t dev-image -f Dockerfile --rm --build-arg BUILD=dev .
docker run --gpus all -it -d --name dev-env -p 8888:8888 -v /mnt/sda3/LabX:/LabX/ dev-image:latest
