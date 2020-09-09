# PLCC-in-Docker
PLCC installed into a Docker container

## Getting started

```bash
docker run -it --rm -v "${PWD}:/home/my/work" ourplcc/plcc-in-docker:latest
```

You are now in a Bash shell running inside a linux-based Docker container with PLCC, Java, and Python pre-installed, and all your files in the current working directory available in your current working directory within the container (/home/my/work). Any changes you make to those files inside or outside the container will be reflected both inside and outside the container.

When you are done, exit the container.

```bash
exit
```

## How it works

The first time you run the command, Docker downloads the `ourplcc/plcc-in-docker:latest` image, creates a container from that image, and runs the container. Subsequent runs will be faster because Docker will not have to download the image again.

`-it` causes Docker to attach your current shell to the container so that you can interact with it in your current terminal session.

`--rm` causes Docker to remove the container when you exit the container. This keeps things tidy. When you run the command again, a new container will be created. Creation of a new container is a very fast operation in Docker. So don't let that worry you.

`-v "${PWD}:/home/my/work"` mounts your current working directory into the container's filesystem at the location `/home/my/work`, making your files on the host aviable to you within the container.

Docker's `run` command looks for an image named `ourplcc/plcc-in-docker:latest` locally. If it doesn't find it, it looks for on Docker Hub and downloads it.

## Upgrading to a new version

When a new version of the image comes out, you won't immediately receive it because Docker caches the version that it first downloaded. To get the most recent image, run the following command.

```bash
docker pull ourplcc/plcc-in-docker:latest
```

Now the new image will be used the next time you run plcc-in-docker.

## Versions and Docker tags

The version number of PLCC-in-Docker mirrors that of PLCC. So PLCC-in-Docker v2.0.1 contains PLCC v2.0.1.