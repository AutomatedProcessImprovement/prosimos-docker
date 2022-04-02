#!/bin/bash

echo "### Starting the execution..."
sudo apt-get update

### 1) INSTALL GIT
sudo apt-get install git


### 2) INSTALL DOCKER
### https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

echo "### Installing modules ..."
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    net-tools

echo "### Adding Docker's GPG key ..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "### Setting up the Docker repository ..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# install docker engine
echo "### Installing docker engine ..."
sudo apt-get update
sudo apt-get install docker-ce=5:20.10.14~3-0~ubuntu-focal docker-ce-cli=5:20.10.14~3-0~ubuntu-focal containerd.io

# install docker-compose
echo "### Installing docker-compose ..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


### 3) CLONE THE REPO
echo "### Cloning 'prosimos-docker' repo ..."
git clone https://github.com/AutomatedProcessImprovement/prosimos-docker.git
cd prosimos-docker


### 4) START THE SERVICES
echo "### Starting docker ..."
sudo service docker start

# run certbot (creation of the certificates)
# start the client
echo "### Starting client ..."
chmod +x init-letsencrypt.sh
sudo ./init-letsencrypt.sh

# start certbot (for checking the update of the certificates every 12 hours)
echo "### Starting certbot ..."
sudo docker-compose up -d certbot
