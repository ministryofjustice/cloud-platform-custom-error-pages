#!/bin/bash

IMAGE=cloud-platform-custom-error-pages:0.1

docker run --rm \
  --name errorpage \
  -p 8000:8080 \
  -it ${IMAGE}
