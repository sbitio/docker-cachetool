# docker-cachetool
[![DockerHub Badge](http://dockeri.co/image/sbitio/cachetool)](https://hub.docker.com/r/sbitio/cachetool/)

A simple docker helper for running [gordalina's cachetool](https://github.com/gordalina/cachetool)

Invoking without command pints cachetool's help:
```bash
docker run --rm sbitio/cachetool
```

## Using
The most common use will be clearing caches.

Example Using web adapter:
```bash
docker run --rm -v <your-local-webserber-path>:<your-local-webserber-path> -w <your-local-webserber-path> sbitio/cachetool cachetool -v --web --web-url=<your-reachable-url> <your-cachetool-cmd-with-args>
```
Note: You can use docker's `--add-host` to leaverage nameserver resolution


## Extending

You can build containers using a fork:
```bash
docker build . --build-arg REPOSITORY=https://github.com/gordalina/cachetool REF=5.0.0 -t cachetool:<your-custom-tag>
```

## Testing code changes
Just mount the new code at `WORKDIR`:
```bash
docker run --rm -v <your-changed-code>:/opt/cachetool sbitio:cachetool <your-cachetool-cmg-with-args>
```
