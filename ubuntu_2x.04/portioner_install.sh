#!/usr/bin/env sh

docker -- run -d \
-p 8000:8000 \
-p 9443:9443 \
--name portainer \
--restart=always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /home/azureuser/portainer_data:/data \
portainer/portainer-ce:latest


echo "##########################"
echo "portainer installed"
