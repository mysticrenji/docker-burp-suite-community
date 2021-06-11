# Burp Suite Community

> If you're looking for the Burp Suite Professional Docker container, look [here](https://github.com/koenrh/docker-burp-suite-pro) (separately maintained).

This allows you to run Burp Suite Professional in a container. This guide describes
the steps to run Burp on a Mac, but steps for Linux and Windows should be fairly similar.

## Prerequisites

- You need to have the following installed on your host:
  - [Docker](https://docs.docker.com/install/)
  - An X Server (macOS: [XQuartz](https://www.xquartz.org/))

:warning: If you did not have installed X Server, make sure to reboot after the installation so that the X11 window server is set up correctly for the current user.

### X Server

This process can be replicated on Windows or Linux with your choice of X11 server by setting it to listen on 127.0.0.1.

1. Enable `XQuartz` > `Preferences` > `Security` > `Allow connections from network clients`
  - **TODO: ADD screenshot of turning on XQuartz option**
2. Start the X window server on localhost with XQuartz

```
xhost + 127.0.0.1
```

Note that you need to run this command from your host, not the XQuartz terminal.

## Installing

### From Docker Hub

The prebuilt container can be retrieved from [Docker Hub](https://hub.docker.com/repository/docker/hexcowboy/burpsuite).

```bash
docker pull hexcowboy/burpsuite
docker image tag hexcowboy/burpsuite burpsuite
```

### Building the image

First, clone this [GitHub repository](https://github.com/hexcowboy/docker-burp-suite-community) on your host:

```bash
git clone https://github.com/hexcowboy/docker-burp-suite-community.git && cd docker-burp-suite-community
```

## Running

Then, build the Docker image using the following command.

```bash
docker build -t burpsuite .
```

While building the image, the latest JAR (Java ARchive) of Burp Suite Community is pulled from the PortSwigger portal.

## Setup


## Usage

```bash
docker run --rm \
  -p 8080:8080 \
  burpsuite
```

You could make this command more easily accessible by putting it an executable,
and make sure that it is available in your `$PATH`. Alternative, you could create
wrapper functions for your `docker run` commands ([example](https://github.com/jessfraz/dotfiles/blob/master/.dockerfunc)).

### Burp Proxy

By default the container listens on port 8080 on all interfaces (see `config/project_options.json`).

1. Verify that the proxy is working by running the following command on your host:

```bash
curl -x http://127.0.0.1:8080 http://example.com
```

## Notes

* When prompted, do not updated Burp Suite through the GUI. Pull and build an updated image instead.
