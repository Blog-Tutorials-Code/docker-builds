#!/bin/bash

#Notes: Script takes in MVN Version to be installed as $1

#Configurable properties
SHA=ce50b1c91364cb77efe3776f756a6d92b76d9038b0a0782f7d53acf1e997a14d
BASE_URL=https://apache.osuosl.org/maven/maven-3/$1/binaries

#Check maven version passed
if [ -z "$1" ]; then
  echo "Maven version needs to be passed to script"
  exit
fi

echo MVN_VERSION: $1

#Download maven and create soft link in bin which is scanned in path
mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-$1-bin.tar.gz \
  && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha256sum -c - \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz \
&& ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

#Set MAVEN_HOME or M2_HOME. Don't need to set unless a library is looking for it to be set.
#For future reference. To permanently set it system wide, need to add variable in /etc/environment or in .bashrc