#!/bin/bash

#Notes: Scipt takes in GCLOUD SDK VERSION as first parameter

#Install lsb_release
apt-get -qqy update && apt-get install -qqy \
        apt-transport-https \
        lsb-release 

#Install GCLOUD_SDK_TOOLS version and OS
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y google-cloud-sdk=$1-0 \
        google-cloud-sdk-app-engine-python=$1-0 \
        google-cloud-sdk-app-engine-python-extras=$1-0 \
        google-cloud-sdk-app-engine-java=$1-0 \
        google-cloud-sdk-app-engine-go=$1-0 \
        google-cloud-sdk-datalab=$1-0 \
        google-cloud-sdk-datastore-emulator=$1-0 \
        google-cloud-sdk-pubsub-emulator=$1-0 \
        google-cloud-sdk-bigtable-emulator=$1-0 \
        google-cloud-sdk-cbt=$1-0 \
        kubectl && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image && \
    gcloud --version && \
    kubectl version --client