build:
	docker build -t goshad/pre-build:v${NEW_VERSION} .
push:
	docker login -u goshad -p "${DOCKER_TOKEN}" 
	docker push goshad/pre-build:v${NEW_VERSION}
build-and-push: build push