#!/bin/bash

IMAGE=quay.io/kubernetes-ingress-controller/custom-error-pages-amd64:0.4

docker run --rm \
  --name errorpage \
  -p 8000:8080 \
  -it ${IMAGE}
