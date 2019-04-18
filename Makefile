NAME=deric/debian-docker-cli
all: releases

pull:
	docker pull `head -n 1 Dockerfile | awk '{ print $$2 }'`

release: pull
	$(call RELEASE,$(v),$(t))

build:
	$(call BUILD,$(v),$(t))

define BUILD
	docker build --build-arg version=$(1) -t $(NAME) .
	docker tag $(NAME) $(NAME):$(2)
endef

define RELEASE
	$(call BUILD,$(1),$(2));
	docker tag $(NAME) $(NAME):latest
	docker push $(NAME):$(2)
endef

shell:
	docker run -v /var/run/docker.sock:/var/run/docker.sock --entrypoint /bin/bash -it $(NAME)

