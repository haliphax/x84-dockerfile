[![haliphax/x84 on Docker Hub](http://dockeri.co/image/haliphax/x84)](https://registry.hub.docker.com/u/haliphax/x84/)

# x/84 Docker image

This is a Dockerfile for creating a Docker image to run an installation of the
[x/84 BBS software](https://github.com/jquast/x84). It is based on the
[debian:latest](https://registry.hub.docker.com/_/debian/) Docker image.

This will build a fully-contained environment with all of the operating system
and Python dependencies necessary to run an ssh/telnet/https setup of x/84 --
including dosemu, libssl, and libffi.

- [Get it from Docker Hub](#get-it-from-docker-hub)
- [Ports](#ports)
- [Build it](#build-it)
- [Run it](#run-it)
  - [bash script](#bash-script)
  - [upstart](#upstart)
- [dosemu](#dosemu)

## Get it from Docker Hub

Easy peasy:

    $ sudo docker pull haliphax/x84

## Ports

The image exposes the following ports:

    6022 ssh
    6023 telnet
    8443 https

## Build it

To build it yourself rather than using
[Docker Hub](https://registry.hub.docker.com/u/haliphax/x84/), run the
supplied `build.sh` script. It's just a simple wrapper around `docker build`.

Use the script like so:

    $ ./build.sh

    or

    $ ./build.sh <image name/tag>

## Run it

### bash script

An example startup script, `init/start.sh`, is included which maps three
directories into the Docker container via the `persist` folder, which will be
created on demand:

    bbs  -> /home/x84/bbs            # bbs scripts if you want to change
                                     # your scriptpath from the default

    data -> /home/x84/.x84           # configuration files, databases, etc.

    sftp -> /home/x84/x84-sftp_root  # root directory for the sftp server

Simply run:

    $ init/start.sh

    or

    $ init/start.sh <image name/id>

### upstart

In the `init` directory, there is an `upstart` file. Rename it, modify it to fit
your system, and reinitialize your upstart configuration to enable x84 as a
service (as root):

    # cp init/upstart /etc/init/x84.conf

    edit /etc/init/x84.conf to fit your system

    # initctl reload-configuration
    # start x84

Other init system configurations will be added soon.

## dosemu

The image comes complete with dosemu and a basic setup. It attempts to route
the `D:` drive in dosemu to `/home/x84/bbs/dos` within the image. This is
where you should place your doors, FOSSIL drivers, and utilities. If you're
using `init/start.sh` to run your system, then this will be mapped to the
`persist/bbs/dos` folder (if it exists).
