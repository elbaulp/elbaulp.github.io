IMAGE_NAME := elbaulp.github.io
BUILD_VERSION := 1.0

.PHONY: build

docker-build:
	docker build --tag "${IMAGE_NAME}:${BUILD_VERSION}" .
docker-run: docker-build
	docker run -it "${IMAGE_NAME}:${BUILD_VERSION}"
docker-shell: docker-build
	docker run -it --rm --entrypoint "/bin/ash" "${IMAGE_NAME}:${BUILD_VERSION}"
