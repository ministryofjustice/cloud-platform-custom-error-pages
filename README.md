# Cloud Platform Custom Error Pages

This repo creates a docker image containing custom HTTP error pages, to be used as per these [instructions].

This is a simplified version of the kubernetes/ingress-nginx [example].

## Usage

1. Create your custom HTTP error pages in the `rootfs/www` folder, following the existing `code`.`format` pattern.
2. Edit the `makefile` and change the version number of the `IMAGE` line near the top of the file.
3. Run `make all` to create a new version of the docker image, with your custom error pages.
3. Run `make push` to tag and push the image to docker hub.

NB: This image can only respond with a single HTML file. So, if you want your custom error page to use other assets such as images, fonts, stylesheets, etc. you need to ensure that those are available at some fixed URLs, and hard-code those URLs into your error pages.

[instructions]: https://kubernetes.github.io/ingress-nginx/user-guide/custom-errors/
[example]: https://github.com/kubernetes/ingress-nginx/tree/master/images/custom-error-pages
