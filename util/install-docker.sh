#!/bin/bash

# This script installs Docker CE on a 64-bit Linux host using APT,
# for the purposes of a demo. Note that it does ZERO validation of
# authenticity of the downloaded artifacts. Using this approach in 
# a production setting is discouraged.

# remove old versions of docker
apt-get remove docker docker-engine docker.io

# install packages needed to use an HTTPS APT repo
apt-get update
apt-get install -y apt-transport-https ca-certificates curl \
                   software-properties-common

# install Docker's PGP key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add the stable repository for the 64-bit architecture
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable"

# install latest stable Docker CE 
apt-get update
apt-get install -y docker-ce

# fetch Docker Compose binary and make it executable
curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose
