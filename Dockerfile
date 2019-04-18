FROM debian:stretch

ARG version
RUN apt-get update && apt-get install -y --no-install-recommends make apt-transport-https curl gnupg2 software-properties-common\
 && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN echo 'deb [arch=amd64] https://download.docker.com/linux/debian stretch stable' > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y --no-install-recommends docker-ce-cli=$version \
  && rm -rf /var/lib/apt/lists/*
