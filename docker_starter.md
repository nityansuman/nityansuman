# Docker
**Version**: 20.10.10

## Docker Engine Overview

Docker Engine is an open source containerization technology for building and containerizing your applications. Docker Engine acts as a client-server application with:

- A server with a long-running daemon process dockerd.
- APIs which specify interfaces that programs can use to talk to and instruct the Docker daemon.
- A command line interface (CLI) client docker.
- The CLI uses Docker APIs to control or interact with the Docker daemon through scripting or direct CLI commands. Many other Docker applications use the underlying API and CLI. The daemon creates and manage Docker objects, such as images, containers, networks, and volumes.

## Download and Install Docker

This tutorial assumes you have a current version of Docker installed on your machine. If you do not have Docker installed, choose your preferred operating system below to download Docker:

- [Install Docker Engine (Linux)](https://docs.docker.com/engine/install/)
- [Post-installation steps for Linux](https://docs.docker.com/engine/install/linux-postinstall/)

## Docker Context

A single Docker CLI can have multiple contexts. Each context contains all of the endpoint and security information required to manage a different cluster or node. The docker context command makes it easy to configure these contexts and switch between them.

As an example, a single Docker client on your company laptop might be configured with two contexts; dev-k8s and prod-swarm. dev-k8s contains the endpoint data and security credentials to configure and manage a Kubernetes cluster in a development environment. prod-swarm contains everything required to manage a Swarm cluster in a production environment. Once these contexts are configured, you can use the top-level docker context use <context-name> to easily switch between them.

To follow the examples in this guide, you’ll need:

- A Docker client that supports the top-level context command

Run `docker context` to verify that your Docker client supports contexts.

You will also need one of the following:

- Docker Swarm cluster
- Single-engine Docker node
- Kubernetes cluster

[Docker Contexts](https://docs.docker.com/engine/context/working-with-contexts/)

## Docker Scan

Vulnerability scanning for Docker local images.

Vulnerability scanning for Docker local images allows developers and development teams to review the security state of the container images and take actions to fix issues identified during the scan, resulting in more secure deployments. Docker Scan runs on Snyk engine, providing users with visibility into the security posture of their local Dockerfiles and local images.

Users trigger vulnerability scans through the CLI, and use the CLI to view the scan results. The scan results contain a list of Common Vulnerabilities and Exposures (CVEs), the sources, such as OS packages and libraries, versions in which they were introduced, and a recommended fixed version (if available) to remediate the CVEs discovered.

[How to scan docker images](https://docs.docker.com/engine/scan/)

## Docker Compose

Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.

Compose works in all environments: production, staging, development, testing, as well as CI workflows.

Using Compose is basically a three-step process:

- Define your app’s environment with a Dockerfile so it can be reproduced anywhere.
- Define the services that make up your app in docker-compose.yml so they can be run together in an isolated environment.
- Run docker compose up and the Docker compose command starts and runs your entire app. You can alternatively run docker-compose up using the docker-compose binary.

[Docker Compose](https://docs.docker.com/compose/)

## Python Application with Docker

Let’s create a simple Python application using the Flask framework that we’ll use as our example. Create a directory in your local machine named python-docker and follow the steps below to create a simple web server.

```
$ cd /path/to/python-docker
$ pip3 install Flask
$ pip3 freeze | grep Flask >> requirements.txt
$ touch app.py
```

Now, let’s add some code to handle simple web requests. Open this working directory in your favorite IDE and enter the following code into the app.py file.

```
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, Docker!'
```

Let’s start our application and make sure it’s running properly. Open your terminal and navigate to the working directory you created.

```
$ python3 -m flask run
```
To test that the application is working properly, open a new browser and navigate to http://localhost:5000.

Switch back to the terminal where our server is running and you should see the following requests in the server logs. The data and timestamp will be different on your machine.

```
127.0.0.1 - - [22/Sep/2020 11:07:41] "GET / HTTP/1.1" 200 -
```

### Dockerfile for Python

A Dockerfile is a text document that contains the instructions to assemble a Docker image. When we tell Docker to build our image by executing the docker build command, Docker reads these instructions, executes them, and creates a Docker image as a result.

The first line to add to a Dockerfile is a # syntax parser directive. While optional, this directive instructs the Docker builder what syntax to use when parsing the Dockerfile, and allows older Docker versions with BuildKit enabled to upgrade the parser before starting the build. Parser directives must appear before any other comment, whitespace, or Dockerfile instruction in your Dockerfile, and should be the first line in Dockerfiles.

[Parse Directive](https://docs.docker.com/engine/reference/builder/#parser-directives)

We recommend `docker/dockerfile:1`, which always points to the latest release of the version 1 syntax. BuildKit automatically checks for updates of the syntax before building, making sure you are using the most current version.

```
# syntax=docker/dockerfile:1
```

Next, we need to add a line in our Dockerfile that tells Docker what base image we would like to use for our application.

```
# syntax=docker/dockerfile:1

FROM docker-image:tag
```

To make things easier when running the rest of our commands, let’s create a working directory. This instructs Docker to use this path as the default location for all subsequent commands. By doing this, we do not have to type out full file paths but can use relative paths based on the working directory.

```
WORKDIR /app
```

Usually, the very first thing you do once you’ve downloaded a project written in Python is to install pip packages. This ensures that your application has all its dependencies installed.

Before we can run pip3 install, we need to get our requirements.txt file into our image. We’ll use the COPY command to do this. The COPY command takes two parameters. The first parameter tells Docker what file(s) you would like to copy into the image. The second parameter tells Docker where you want that file(s) to be copied to. We’ll copy the requirements.txt file into our working directory /app.

```
COPY requirements.txt requirements.txt
```

Once we have our requirements.txt file inside the image, we can use the RUN command to execute the command pip3 install

```
RUN pip3 install -r requirements.txt
```

At this point, we have an image that is based on Python version 3.8 and we have installed our dependencies. The next step is to add our source code into the image.

```
COPY . .
```

This COPY command takes all the files located in the current directory and copies them into the image.

Now, all we have to do is to tell Docker what command we want to run when our image is executed inside a container. We do this using the CMD command. Note that we need to make the application externally visible (i.e. from outside the container) by specifying --host=0.0.0.0.

```
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
```

### Building an Image

Now that we’ve created our Dockerfile, let’s build our image. To do this, we use the docker build command. The docker build command builds Docker images from a Dockerfile and a “context”. A build’s context is the set of files located in the specified PATH or URL. The Docker build process can access any of the files located in this context.

The build command optionally takes a --tag flag. The tag is used to set the name of the image and an optional tag in the format name:tag. We’ll leave off the optional tag for now to help simplify things. If you do not pass a tag, Docker uses “latest” as its default tag.

```
docker build --tag python-docker .
```

## Useful Commands

- View docker images

```
docker images
```

- View docker containers

```
docker ps -a
```

- Remove docker image

```
docker rmi image-name:tag
```

- Run docker conatiner

To run an image inside of a container, we use the docker run command. The docker run command requires one parameter which is the name of the image.

```
docker run -p host-port:container-port image-name
```

- Run in detached mode

This is great so far, but our sample application is a web server and we don’t have to be connected to the container. Docker can run your container in detached mode or in the background. To do this, we can use the --detach or -d for short. Docker starts your container the same as before but this time will “detach” from the container and return you to the terminal prompt.

```
docker run -d -p host-port:container-port (optional) image-name
```

- Run in foreground mode

In foreground mode (the default when -d is not specified), docker run can start the process in the container and attach the console to the process’s standard input, output, and standard error. It can even pretend to be a TTY (this is what most command line executables expect) and pass along signals.

```
docker run -it -p host-port:container-port (optional) image-name:tag bash
```

[More on Docker with Python](https://docs.docker.com/language/python/)
