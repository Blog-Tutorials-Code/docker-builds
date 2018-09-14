#!/bin/bash

#Notes: Script takes in Docker Version to be installed as $1

#Following offical tutorial for debian 9 (stretch): https://docs.docker.com/install/linux/docker-ce/debian/#set-up-the-repository 
#Follwing official tutorial for ubuntu: https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository

#Configurable properties
DOCKER_CHANNEL=stable
DOCKER_VERSION=$1

#Update package index
apt-get update

#Install packages for using a repo over https
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    lsb-release

#Add official docker GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

#Get distro name
LINUX_DISTRO_NAME=$(lsb_release -cs)
echo LINUX_DISTRO_NAME: $LINUX_DISTRO_NAME

#Add repo
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   ${LINUX_DISTRO_NAME} \
   ${DOCKER_CHANNEL}"

#Update package index
apt-get update

#Print available docker ce versions
apt-cache policy docker-ce

#Install specified docker version
apt-get -y install docker-ce=${DOCKER_VERSION}

#Print current user to see if root
whoami

#Cannot use docker daemon unless you mount the host socket when running the image. docker run -v /var/run/docker.sock:/var/run/docker.sock -it jenkins-pipeline-tooling:latest bash
#docker version