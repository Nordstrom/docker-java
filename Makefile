container_name := java
container_registry := nordstrom
container_release := 7

.PHONY: build tag release

build: Dockerfile $(build_container_prereqs)
	docker build -t $(container_name) .

tag: build
	docker tag -f $(container_name) $(container_registry)/$(container_name):$(container_release)
