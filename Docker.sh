#!/bin/bash

# Update the package index
sudo apt update

# Install packages to allow apt to use a repository over HTTPS
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable Docker repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index again
sudo apt update

# Install the latest version of Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Add the current user to the docker group to run Docker commands without sudo
sudo usermod -aG docker $USER

# Display  Display Docker version
docker --version
echo "Wait for a moment..."

echo "The Docker Socket Permissions ----> sudo /var/run/docker.sock" 
echo "Successfully Installed Docker...!!!"
sudo chmod 777 /var/run/docker.sock

echo "Successfully Installed Docker...!!!"

# sudo apt-get update
# sudo apt  install docker.io #one line install docker