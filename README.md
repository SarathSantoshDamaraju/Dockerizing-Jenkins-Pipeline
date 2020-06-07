# Dockerizing Jenkins Pipeline

| Title | Details |
|---|---|
| Github URL | [here](https://github.com/SarathSantoshDamaraju/learning-jekins-docker) |
| Docker Image |   |

## Steps
### 1. Setting up dependencies
- Must have a docker installed in your system
- Must have at-least 512mb RAM and 10Gb Storage available

### 2. Creating the docker image

Now we will be creating a docker container that setups the jenkins pipeline. Following are the requirements -
- Jenkins - any version

#### Creating docker file

> Git, node and NPM installations will be handled from jenkins. So, its not required to mention them in the DockerFile
> 
Docker file is created with following steps

```dockerFile
  # file name: Dockerfile

  # Setup Ubuntu latest
  FROM ubuntu:latest
  ENV DEBIAN_FRONTEND noninteractive

  #just info about who created this
  MAINTAINER Krishna Damaraju

  #this is the base image we use to create our image from
  FROM jenkins/jenkins:lts
```

#### Creating the Docker image

Now, run the following command to generate a docker image 

```bash
  docker build -t dockerize_jenkins .
```
> 🧘‍♂️Breathe in - Breathe Out, this may take some time. Go grab a chai and come back.

This should ideally generate a docker image named  `dockerize_jenkins`

### 3. Setting up Jenkins

As we already have a docker image, lets run and continue the Jenkins pipeline setup.

Run, 

```bash
  docker run -p 8080:8080 --rm --name dockerize_jenkins dockerize_jenkins:latest
```
Give it some time to boot, and try to copy the password generated in the logs looks something like this

```bash
*************************************************************
*************************************************************
*************************************************************

Jenkins initial setup is required. An admin user has been created and a password generated.
Please use the following password to proceed to installation:

abcdefghijlk123456

This may also be found at: /var/jenkins_home/secrets/initialAdminPassword

*************************************************************
*************************************************************
*************************************************************
```

and wait till you see a message `INFO: Finished Download metadata. 16,827 ms`.  
Then try openng browser with port [localhost:8080](http://localhost:8080)

#### Setting up Jenkins

You may see an image like this, enter the **password** you copied from above and paste it here and proceed.

Then choose **Install suggested plugins**, give it some time to install

Then setup the admin password and remember this 😅

Then you see the following step and proceed till you see a screen **Jenkins is Ready**
