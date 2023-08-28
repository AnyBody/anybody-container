# AnyBody Container

> Docker images for running containerized AnyBody simulations

The AnyBody container images can be used to run AnyBody simulations in Linux docker containers. Containers are hosted on the
GitHub container registry.

``` 
docker pull ghcr.io/anybody/anybodycon:7.4.4-3
```


## Container variants


The linux based containers uses [Wine](https://www.winehq.org/) when running the Windows
based AnyBody console application. The images uses wine "4.0.4" (slightly older version) to keep image as small as possible.

The containers come in multiple flavors:

* [ghcr.io/anybody/anybodycon-slim](https://github.com/AnyBody/anybody-container/pkgs/container/anybodycon-slim):

    > This is the minimal version of the container. It is based on [`debian:bullseye-slim`](https://hub.docker.com/_/debian). It is stripped down to keep the image as small as possible. 
    > It does not include the AnyBody Managed Model Repository (AMMR) or AnyBody's own windows based Python distribution.
    > The total image size is 844 MB. 

* [anybodycon](https://github.com/AnyBody/anybody-container/pkgs/container/anybodycon):

    > This container has the complete version of the AnyBody modeling system (i.e. including AMMR etc.) 

* [anybodycon-micromamba](https://github.com/AnyBody/anybody-container/pkgs/container/anybodycon-micromamba):

    > Both the slim and full image exist in versions with `-micromamba` postfix, which is has [micromamba](https://github.com/mamba-org/micromamba-docker)
    > (conda) preinstalled in the container.  

* [anybodycon-github-actions](https://github.com/AnyBody/anybody-container/pkgs/container/anybodycon-github-actions):

    > This is the full anybodycon-micromamba image configured for running in the GitHub actions CI system. It slso comes with python 
    > libaries relevant to AnyBody (e.g. `anypytools`, `pytest`) preinstalled to make CI jobs load faster. See the
    > [GitHub actions example ](https://github.com/AnyBody/GitHub-Actions-Example) for more info. 

* [anybodycon-devcontainer](https://github.com/AnyBody/anybody-container/pkgs/container/anybodycon-devcontainer):

    > This is the full anybodycon image configured for [Development Containers](https://containers.dev/), like for example GitHub Codespaces
    > and similar services. See the VSCode [documentaiton](https://code.visualstudio.com/docs/devcontainers/containers) for more info. 
    > This image is based on the Microsoft [Universal development container image](https://hub.docker.com/_/microsoft-devcontainers-universal) 
    > but with AnyBody added on top.  
    
    
## Handle license for AnyBody

The container images only work with a floating based license for the
AnyBody Modeling System (i.e. a license server). The license server can
be specified using the two environment variables

* `RLM_LICENSE=<port>@<server-ip>`
* `RLM_LICENSE_PASSWORD=*********`

> Note: The license password is not required, but if the container is used in public cloud infrastructure (AWS/Azure/GitHub etc.) it is highly recommended :)

The license information can be passed to the docker container like this: 

``` 
export RLM_LICENSE=<port-number>@<license-server-ip>
export RLM_LICENSE_PASSWORD=<license-server-password>

docker run -it -e RLM_LICENSE -e RLM_LICENSE_PASSWORD ghcr.io/anybody/anybodycon-linux:7.4.1-0
```

  
### Windows based container

This is currently a work in progress. 

