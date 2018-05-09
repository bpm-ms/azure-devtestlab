#!/bin/bash

# Check if docker is already installed.
docker -v
installationStatus=$(echo $?)

if [ $installationStatus -eq 127 ] ; then
    wget -qO- https://get.docker.com/ | sh
fi

[ -n "$1" ] && echo $1 > /etc/docker/daemon.json
sudo systemctl restart docker