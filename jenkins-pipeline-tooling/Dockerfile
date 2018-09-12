#Inherits debian distro with git, curl, other common tools and openjdk-8 installed and configured. Note: Difficult to upgrade java version unless override here.
FROM openjdk:8-jdk

#Versions of to be installed tools. Only range of minor versions supported (Most likely to be backwards compatible).
ARG MVN_VERSION=3.5.4
ARG GCLOUD_SDK_VERSION=216.0.0

#Copy the scripts
COPY install-mvn.sh /scripts/install-mvn.sh
# COPY install-gcloud.sh /scripts/install-gcloud.sh

#Install tools 
RUN ./scripts/install-mvn.sh ${MVN_VERSION}
#    ./install-gcloud.sh ${GCLOUD_SDK_VERSION}

#Keep the docker container running by a tail watch.
#Was used for sshing and testing container setup. May need to remove when used as a Jenkins agent.
#NOTE: You can ssh while first the image. docker run -it <image name> <command>. Reference: http://phase2.github.io/devtools/common-tasks/ssh-into-a-container/
CMD tail -f /dev/null