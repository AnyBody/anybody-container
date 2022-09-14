# AnyBody Container

> Docker images with Anybody console application for running containerized AnyBody simulations


The AnyBody container images can be used to run the AnyBody simulations in Linux and Windows docker containers. Containers are hosted on the
GitHub container registry.

``` 
docker pull ghcr.io/anybody/anybodycon-linux:7.4.1-0
```

## Handle license for AnyBody

The container images only works with a floating based license for the
AnyBody Modeling System (i.e. a license server). The license server can
be specified using the environment variable `RLM_LICENSE=<port>@<server-ip>`. 

If the container is used in public cloud infrastructure (AWS/Azure/GitHub etc.)
then the license server needs to be accesable from the internet. In that case the license server should be 
password protected. The password can then be specified with environment variable `RLM_LICENSE_PASSWORD`.

The license information can be passed to the docker container like this: 

``` 
export RLM_LICENSE=<port-number>@<license-server-ip>
export RLM_LICENSE_PASSWORD=<license-server-password>

docker run -it -e RLM_LICENSE -e RLM_LICENSE_PASSWORD ghcr.io/anybody/anybodycon-linux:7.4.1-0
```


## Linux based container images

The linux based containers uses [Wine](https://www.winehq.org/) for running the Windows
based AnyBody console application in linux. Linux image is based on Debian (bullseye-slim). 
The images uses an older wine version "4.0.4" to keep image as small as possible.

The AnyBody linux containers come in two flavors:

* anybodycon-linux-minimal
    This is minimal version of the AnyBody Console application. It has been stripped down to keep image size as small as possible. 
    It does not include the AnyBody Managed Model Repository or AnyBody's own windows based Python distribution.
    The total image size is 820 MB. 

* anybodycon-linux
    This ships with a complete version of the AnyBody modeling system. 

The linux based container images are based on ["micromamba-docker"](https://github.com/mamba-org/micromamba-docker) image,
which makes easy to install any conda python packages to the images. 
Please see this [micromamba documentation] on how to customize the
image with Python libraries or special entry points.

## Windows based container images

This is currently a work in progress. 

