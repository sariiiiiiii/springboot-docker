#!/bin/bash

VERSION=1.0.2

IMAGE_NAME=registry.postline.co.kr/post-saas/docker-test-app
IMAGE_TAG=$VERSION

IMAGE_NAME_TAG=$IMAGE_NAME:$IMAGE_TAG


if [[ "$(docker container ls -a --filter="status=exited" -q 2> /dev/null)" != "" ]]; then
    docker rm $(docker container ls -a --filter="status=exited" -q)
fi

if [[ "$(docker images "dangling=true" -q 2> /dev/null)" != "" ]]; then
    echo "Remove dangling images"
    docker rmi $(docker images -f "dangling=true" -q)
fi

docker build . -t $IMAGE_NAME_TAG