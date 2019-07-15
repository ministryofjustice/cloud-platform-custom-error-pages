IMAGE := cloud-platform-custom-error-pages:0.1

all: .built-image

.built-image:
	docker build -t $(IMAGE) .
	touch .built-image

push:
	docker tag $(IMAGE) ministryofjustice/$(IMAGE)
	docker push ministryofjustice/$(IMAGE)

clean:
	rm -f .built-image
	docker rm $(IMAGE)

.PHONY: .clean all
