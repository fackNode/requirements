#!/bin/bash

echo "docker and docker-compose installation"

cd $HOME
sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y < "/dev/null"

if ! docker --version; then
  . /etc/*-release
  rm /usr/share/keyrings/docker-archive-keyring.gpg
  sudo wget -qO- "https://download.docker.com/linux/ubuntu/gpg" | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt update
  sudo apt install docker-ce docker-ce-cli containerd.io -y
fi

if docker --version; then
  echo "docker installed successfully."
else
  echo "An error occurred while installing Docker."
  exit 1
fi

if ! docker-compose --version; then
  docker_compose_version=`wget -qO- https://api.github.com/repos/docker/compose/releases/latest | jq -r ".tag_name"`
  sudo wget -O /usr/bin/docker-compose "https://github.com/docker/compose/releases/download/${docker_compose_version}/docker-compose-`uname -s`-`uname -m`"
  sudo chmod +x /usr/bin/docker-compose
  . $HOME/.bash_profile
fi

if docker-compose --version; then
  echo "docker-compose installed successfully."
else
  echo "An error occurred while installing docker-compose."
fi
