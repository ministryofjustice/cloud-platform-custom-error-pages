# Cloud Platform Custom Error Pages

This repo creates a docker image containing custom HTTP error pages, to be used as per these [instructions].

This is a simplified version of the kubernetes/ingress-nginx [example].

## Usage

1. Create your custom HTTP error pages in the `rootfs/www` folder, following the existing `code`.`format` pattern.
2. Edit the `makefile` and change the version number of the `IMAGE` line near the top of the file.
3. Run `make all` to create a new version of the docker image, with your custom error pages.
4. Run `make push` to tag and push the image to docker hub.
5. Use `run.sh` to run the image locally, and `call.sh` to send http requests for the different error pages.

NB: This image can only respond with a single HTML file. So, if you want your custom error page to use other assets such as images, fonts, stylesheets, etc. you need to ensure that those are available at some fixed URLs, and hard-code those URLs into your error pages.

## Installation in a Kubernetes cluster

* Create a service and deployment of the error pages container

    kubectl create -f kubernetes/custom-default-backend.yaml

* Edit the nginx-ingress controller

    kubectl -n ingress-controllers edit deployment nginx-ingress-acme-controller

Change the value of `--default-backend-service` to `default/nginx-errors` (or wherever you deployed the error pages container)

* Edit the nginx-ingress controller configmap

    kubectl -n ingress-controllers edit configmap nginx-ingress-acme-controller

In the `data` section, add a `custom-http-errors` key, listing all the errors you want your service to handle.

    data:
      custom-http-errors: 400,403,404,502,504

[instructions]: https://github.com/kubernetes/ingress-nginx/tree/master/docs/examples/customization/custom-errors
[example]: https://github.com/kubernetes/ingress-nginx/tree/master/images/custom-error-pages
