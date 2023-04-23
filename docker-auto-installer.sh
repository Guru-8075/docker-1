#!/bin/bash
apt-get update
apt-get install -y \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
if [  -n "$(uname -a | grep Ubuntu)" ]; then
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
else
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
fi
apt-get update
apt-get install -y docker-ce

apt-get update
apt-get install docker-compose-plugin