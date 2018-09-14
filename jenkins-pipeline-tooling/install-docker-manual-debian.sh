#!/bin/bash

#Configurable properties
DOCKER_CHANNEL=pool/stable
DOCKER_VERSION=docker-ce_18.06.1~ce~3-0~debian_amd64.deb

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

LINUX_DISTRO_NAME=$(lsb_release -cs)

#Download debian stretch package
curl -fsSLO https://download.docker.com/linux/debian/dists/${LINUX_DISTRO_NAME}/${DOCKER_CHANNEL}/amd64/${DOCKER_VERSION}

#Install it
dpkg -i ${DOCKER_VERSION}
#Install any unsatisifed dependencies
apt-get -fy install

#Verify installation
# docker version