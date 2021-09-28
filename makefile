IMAGE := cloud-platform-custom-error-pages:0.6

all: .built-image

.built-image: rootfs/www/*
	docker build -t $(IMAGE) .
	touch .built-image

push: .built-image
	docker tag $(IMAGE) ministryofjustice/$(IMAGE)
	docker push ministryofjustice/$(IMAGE)

clean:
	rm -f .built-image
	docker rm $(IMAGE)

.PHONY: .clean all
