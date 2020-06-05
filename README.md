# docker-cachetool
[![DockerHub Badge](http://dockeri.co/image/sbitio/cachetool)](https://hub.docker.com/r/sbitio/cachetool/)

[gordalina/cachetool](https://github.com/gordalina/cachetool) is a CLI App and library to manage apc & opcache. https://gordalina.github.io/cachetool/


## Usage

The image entrypoint is set to `/opt/cachetool/bin/cachetool`,
so running cachetool via docker looks like:

```bash
docker run --rm sbitio/cachetool [options] [arguments]
```

Example usage with web adapter:

```bash
APPDIR="/var/www/example.com"
DOCROOT="/var/www/example.com/current/web"
URL="http://example.com"
docker run --rm -v $APPDIR:$APPDIR -w $DOCROOT sbitio/cachetool cachetool --web --web-url=$URL [options] [arguments]
```

If the website is behind a proxy and/or load balancer you may want to
ask directly the webserver instead of the public facing ip.
Additionally, the webserver may be listening in another port.
This is an example for running cachetool from the webserver host in
such a setup:

```bash
DOMAIN="example.com"
PORT="8008"
APPDIR="/var/www/example.com"
DOCROOT="/var/www/example.com/current/web"
URL="http://$DOMAIN:$PORT"

docker run --rm --add-host $DOMAIN:172.17.0.1 -v $APPDIR:$APPDIR -w $DOCROOT sbitio/cachetool --web --web-url=$URL [options] [arguments]
```

## Customizations

### Using another local codebase

You may want to quickly test a change in the codebase before contributing a PR.
A quick way to do it is mounting your local copy on the docker image.

```bash
CACHETOOL_CODEBASE=/usr/src/cachetool

docker run --rm $CACHETOOL_CODEBASE:/opt/cachetool sbitio/cachetool
```

### Building an image with another fork

You may want to build an image based on a fork or git reference:

```bash
GIT_URL=https://github.com/gordalina/cachetool
GIT_REF=5.0.0
docker build . --build-arg REPOSITORY=$GIT_URL --build-arg REF=$GIT_REF -t cachetool:<tag>
```


## Development

Development happens on [GitHub](https://github.com/sbitio/puppet-monit).

Please log issues for any bug report, feature or support request.

Pull requests are welcome.


## License

MIT License, see LICENSE file


## Contact

Use contact form on http://sbit.io
