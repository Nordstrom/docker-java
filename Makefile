IMAGE_REGISTRY := quay.io/nordstrom
IMAGE_NAME := java
IMAGE_TAG := 8
JDK_IMAGE_NAME := java-jdk
JDK_IMAGE_TAG := 8

ifdef http_proxy
IMAGE_BUILD_ARGS += --build-arg http_proxy=$(http_proxy)
IMAGE_BUILD_ARGS += --build-arg https_proxy=$(http_proxy)
endif

.PHONY: pull/image
pull/image:
	docker pull $(IMAGE_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: push/image
push/image: tag/image
	docker push $(IMAGE_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: tag/image
tag/image: build/image
	docker tag $(IMAGE_NAME) $(IMAGE_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: build/image
build/image: Dockerfile pull/from_image
	docker build -t $(IMAGE_NAME) $(IMAGE_BUILD_ARGS) .

.PHONY: pull/from_image
pull/from_image:
	docker pull $(IMAGE_REGISTRY)/baseimage-ubuntu:16.04

.PHONY: push/jdk_image
push/jdk_image: tag/jdk_image
	docker push $(IMAGE_REGISTRY)/$(JDK_IMAGE_NAME):$(JDK_IMAGE_TAG)

.PHONY: tag/jdk_image
tag/jdk_image: build/jdk_image
	docker tag $(JDK_IMAGE_NAME) $(IMAGE_REGISTRY)/$(JDK_IMAGE_NAME):$(JDK_IMAGE_TAG)

.PHONY: build/jdk_image
build/jdk_image: Dockerfile.jdk pull/image
	docker build -t $(JDK_IMAGE_NAME) $(IMAGE_BUILD_ARGS) -f "$<" .
