# Manage A Workforce Custom Error Pages

This repo creates a docker image containing custom HTTP error pages, to be used as per these [instructions].

A default-backend is served by nginx as a fall-back. This is typically when the sub-domain, for example `https://wrongdomain.cloud-platform.service.justice.gov.uk/`, isn't recognized. Otherwise, the default nginx page would show, which doesn't look professional.

This is a simplified version of the kubernetes/ingress-nginx [example].

## Usage

1. Create your custom HTTP error pages in the `rootfs/www` folder, following the existing `code`.`format` pattern.
2. Edit the `makefile` and change the version number of the `IMAGE` line near the top of the file.
3. Run `make all` to create a new version of the docker image, with your custom error pages.
4. Run `make push` to tag and push the image to docker hub.
5. Use `run.sh` to run the image locally, and `call.sh` to send http requests for the different error pages.

NB: This image can only respond with a single HTML file. So, if you want your custom error page to use other assets such as images, fonts, stylesheets, etc. you need to ensure that those are available at some fixed URLs, and hard-code those URLs into your error pages.

## Installation in a Kubernetes cluster

Update the defaultBackend config in the [nginx-ingress-acme.tf][infrastructure-repo], with the docker image created above containing custom HTTP error pages.

```
defaultBackend:
  enabled: true

  name: default-backend
  image:
    repository: ministryofjustice/manage-a-workforce-custom-error-pages 
    tag: "0.5"
    pullPolicy: IfNotPresent

  extraArgs: {}

  port: 8080
```

[instructions]: https://github.com/kubernetes/ingress-nginx/tree/master/docs/examples/customization/custom-errors
[example]: https://github.com/kubernetes/ingress-nginx/tree/master/images/custom-error-pages
[infrastructure-repo]: https://github.com/ministryofjustice/cloud-platform-infrastructure/blob/master/terraform/cloud-platform-components/nginx-ingress-acme.tf
