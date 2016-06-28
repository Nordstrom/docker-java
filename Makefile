container_name := java
container_registry := quay.io/nordstrom
container_release := 8

.PHONY: build/image tag/image push/image

build/image: Dockerfile
	docker build -t $(container_name) .

tag/image: build/image
	docker tag $(container_name) $(container_registry)/$(container_name):$(container_release)

push/image: tag/image
	docker push $(container_registry)/$(container_name):$(container_release)

