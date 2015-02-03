DOCKER_IMAGE=zvelo/zvelo-kibana
GIT_COMMIT=unknown

ifeq ("$(CIRCLECI)", "true")
	GIT_COMMIT = $(CIRCLE_SHA1)
endif

all: image

image:
	@sed -i '/^ENV GIT_COMMIT/d' Dockerfile
	@echo "ENV GIT_COMMIT $(GIT_COMMIT)" >> Dockerfile
	docker build -t $(DOCKER_IMAGE) .
