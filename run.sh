#!/bin/bash

IMAGE=cloud-platform-custom-error-pages:0.6

docker run --rm \
  --name errorpage \
  -p 8000:8080 \
  -it ${IMAGE}
