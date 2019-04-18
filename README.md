# Docker CLI in Debian 9

[Docker hub image](https://hub.docker.com/r/deric/debian-docker-cli)

> Docker-in-Docker is not 100% made of sparkles, ponies, and unicorns.

[Using Docker-in-Docker for your CI or testing environment? Think twice.](https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/)

## Testing

Then run image with mounted socket to Docker daemon:
```
docker run -v /var/run/docker.sock:/var/run/docker.sock --entrypoint /bin/bash -it deric/debian-docker-cli
```

## Compiling

Usage:
```
make build v=5:18.09.5~3-0~debian-stretch t=18.09.5
```
first argument `v=` is debian package version, second `t=` is Docker tag.


