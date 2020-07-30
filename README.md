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

## Versions

We follow SemVer. PLCC-in-Docker's version is not the same as PLCC's version. However, if there is a change in PLCC versions, the PLCC-in-Docker version will reflect that change appropriately.

## Docker tags

When a new image is released, the following tags are updated or created to point to the new image.

- `:latest`
- `:MAJOR`
- `:MAJOR.MINOR`
- `:MAJOR.MINOR.PATCH`
- `:MAJOR.MINOR.PATCH-plccVERSION`

In the above tags MAJOR, MINOR, and PATCH are the SemVer components of the version number of PLCC-in-Docker version number. VERSION is the version number of PLCC.

For example, suppose version 2.4.5 of PLCC-in-Docker is release and it contains vesion 1.3.2 of PLCC. Then the following tags are created or updated to point to the new image.

- `:latest`
- `:2`
- `:2.4`
- `:2.4.5`
- `:2.4.5-plcc1.3.2`

If you want to always have the latest and greatest (but are willing to accept breaking changes), regularly pull and use `:latest`. If you only want new features and bug fixes for the version 2 family of releases (no breaking changes), then regularly pull and use `:2`. If you want only bug fixes for the 2.4 family, the regularly pull and use `2.4`. And if you don't want any updates, and want to use a specific version, either pull and use `:2.4.5` or `:2.4.5-plcc1.3.2`. Neither of these will move once pointed to an image. The only difference is that the longer one also encodes the version of PLCC you are pinned to.
