IMAGE := cloud-platform-custom-error-pages:0.1

all: .built-image

.built-image:
	docker build -t $(IMAGE) .
	touch .built-image

clean:
	rm -f .built-image
	docker rm $(IMAGE)

.PHONY: .clean all
