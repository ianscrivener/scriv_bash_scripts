#!/usr/bin/env sh

# From https://docs.docker.com/engine/install/ubuntu/

# uninstall unofficial packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done


# Add Docker's official GPG key:
sudo apt-get update
DEBIAN_FRONTEND=noninteractive sudo apt-get install ca-certificates curl -y
DEBIAN_FRONTEND=noninteractive sudo install -m 0755 -d /etc/apt/keyrings -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update


# To install the latest version of Docker 
DEBIAN_FRONTEND=noninteractive sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y


# start up
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

#Create the docker group.
sudo groupadd docker

# Add your user to the docker group.
sudo usermod -aG docker $USER


echo "##########################"
echo "# Complete"
echo "# Please logout and back in again"
echo "# "
echo "# You can verify your Docker install by running;"
echo "#    docker run hello-world"



