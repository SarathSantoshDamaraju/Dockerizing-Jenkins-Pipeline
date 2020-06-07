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

You may see an image like this, enter the **password** you copied from above and paste it here and **continue**.

<img width="1440" alt="Screenshot 2020-06-07 at 12 09 04" src="https://user-images.githubusercontent.com/10527102/83962568-1225b300-a8bc-11ea-9d79-7a1e34acf778.png">

Then choose **Install suggested plugins**, give it some time to install

<img width="1368" alt="Screenshot 2020-06-07 at 12 29 34" src="https://user-images.githubusercontent.com/10527102/83962597-397c8000-a8bc-11ea-9ef9-2a1b5ac2f893.png">

<img width="1368" alt="Screenshot 2020-06-07 at 12 30 26" src="https://user-images.githubusercontent.com/10527102/83962576-18b42a80-a8bc-11ea-844c-7f02da8e2fe3.png">

Then setup the admin password and remember this 😅 and click **save and Continue** till you see a screen **Jenkins is Ready**

<img width="1440" alt="Screenshot 2020-06-07 at 12 35 47" src="https://user-images.githubusercontent.com/10527102/83962574-181b9400-a8bc-11ea-9539-1cf7b9eaa409.png">

<img width="1422" alt="Screenshot 2020-06-07 at 12 36 05" src="https://user-images.githubusercontent.com/10527102/83962573-1782fd80-a8bc-11ea-99f2-3084ebd52be8.png">

<img width="1440" alt="Screenshot 2020-06-07 at 12 36 15" src="https://user-images.githubusercontent.com/10527102/83962572-1651d080-a8bc-11ea-8712-11567d9584ea.png">
