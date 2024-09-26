#!/usr/bin/env sh

docker -- run -d \
-p 8000:8000 \
-p 9443:9443 \
-p 127.0.0.1:9000:9000 \
--name portainer \
--restart=always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /home/azureuser/portainer_data:/data \
portainer/portainer-ce:latest


echo "##########################"
echo "portainer installed"
