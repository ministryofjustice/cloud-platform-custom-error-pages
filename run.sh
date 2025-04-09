#!/bin/bash

IMAGE=ministryofjustice/manage-a-workforce-custom-error-pages:0.4

docker run --rm \
  --name errorpage \
  -p 8000:8080 \
  -it ${IMAGE}
