IMAGE := manage-a-workforce-custom-error-pages
TAG := 0.5
FULL_IMAGE := ministryofjustice/$(IMAGE):$(TAG)

PLATFORM := linux/amd64

all: .built-image

.built-image: rootfs/www/*
	docker buildx build \
		--platform $(PLATFORM) \
		--load \
		-t $(IMAGE):$(TAG) .
	touch .built-image

push: .built-image
	docker tag $(IMAGE):$(TAG) $(FULL_IMAGE)
	docker push $(FULL_IMAGE)

multiarch:
	docker buildx build \
		--platform linux/amd64,linux/arm64 \
		-t $(FULL_IMAGE) \
		--push .

clean:
	rm -f .built-image
	docker rmi $(IMAGE):$(TAG) || true
	docker rmi $(FULL_IMAGE) || true

.PHONY: all push multiarch clean