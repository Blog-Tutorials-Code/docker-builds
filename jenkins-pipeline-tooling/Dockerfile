#Inherits debian stretch distro with git, curl, other common tools and openjdk-8 installed and configured. Note: Difficult to upgrade java version unless override here.
FROM openjdk:8-jdk

#Versions of to be installed tools. Only range of minor versions supported (Most likely to be backwards compatible).
ARG MVN_VERSION=3.5.4
ARG GCLOUD_SDK_VERSION=216.0.0
ARG DOCKER_VERSION=18.06.1~ce~3-0~debian

#Copy the scripts
COPY install-mvn.sh /scripts/install-mvn.sh
COPY install-gcloud.sh /scripts/install-gcloud.sh
COPY install-docker.sh /scripts/install-docker.sh

#Install tools 
RUN ./scripts/install-mvn.sh ${MVN_VERSION} && \
   ./scripts/install-gcloud.sh ${GCLOUD_SDK_VERSION} && \
   ./scripts/install-docker.sh ${DOCKER_VERSION}