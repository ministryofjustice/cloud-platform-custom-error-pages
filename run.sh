#!/bin/bash

IMAGE=ministryofjustice/cloud-platform-custom-error-pages:1.1.4

docker run --rm \
  --name errorpage \
  -p 8000:8080 \
  -it ${IMAGE}
