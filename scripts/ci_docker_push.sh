#!/bin/sh

set -e
IMAGE="leftshifters/leftshift.io"
GIT_VERSION=$(git describe --always --abbrev --tags --long)
docker build -t ${IMAGE}:${GIT_VERSION} .
docker tag ${IMAGE}:${GIT_VERSION} ${IMAGE}:latest

echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
docker push ${IMAGE}:${GIT_VERSION}
docker push ${IMAGE}:latest