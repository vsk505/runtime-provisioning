#!/bin/bash  
image_tag=${1}
mule_version=4.1.4
repository=mule-ee-runtime-${mule_version}

sudo docker --version
echo "Creating Mule ${mule_version} Docker Image [ repository=${repository}, image_tag=${image_tag} ] "
sudo docker build --tag "${repository}:${image_tag}" .
echo "Docker Images Available"
sudo docker image ls