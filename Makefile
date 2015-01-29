DOCKER_IMAGE=zvelo/zvelo-kibana

all: image

image:
	docker build -t $(DOCKER_IMAGE) .
