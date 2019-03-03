#!/bin/bash  

image_tag=$1
mule_version=4.1.4
repository=mule-ee-runtime-${mule_version}
container=mule-ee-runtime-${mule_version}-${image_tag}
# From this shared directory between the host operating system and the Docker container, you will have access to log files.
mule_logs_dir="$(pwd)/mule-${mule_version}/logs"
echo "Creating shared logs directory on host [ ${mule_logs_dir} ]"
mkdir -v -p ${mule_logs_dir} 
echo "Running Docker Container: ${container}"
sudo docker run -it -d -p 8081:8081 -v "${mule_logs_dir}":/opt/mule/logs --name ${container} ${repository}:${image_tag} 
sudo docker ps -a
echo "TIP #1: Run 'docker ps -a' to list and check Docker container(s) status. "
echo "TIP #2: Run 'docker exec -it ${container} /opt/mule/bin/mule start' to start the Mule Runtime. "


