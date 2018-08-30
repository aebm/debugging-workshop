#!/bin/bash

set -e

if [ $(id -u) -ne 0 ]; then
    echo "You must run this script as root. Attempting to sudo" 1>&2
    exec sudo -H -n bash $0 $@
fi

sleep 10

apt-get update
#apt-get upgrade -y
apt-get install -y git python3-pip

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y docker-ce
curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

usermod -G docker -a ubuntu

sudo -u ubuntu git clone --depth=1 https://github.com/avishai-ish-shalom/debugging-workshop

cd ~ubuntu/debugging-workshop/ex3
docker-compose build
