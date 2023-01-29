#!/bin/bash

if command -v go &> /dev/null; then
  echo "Go is already installed."
  exit 0
fi

# Update package list
sudo apt update

# Install dependencies
sudo apt install build-essential -y

cd $HOME
ver="1.19.2"
wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz"
rm "go$ver.linux-amd64.tar.gz"

# Add Go to PATH for all users
sudo echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/environment

# Check
if command -v go &> /dev/null; then
  echo "Go installed successfully."
else
  echo "An error occurred while installing Go."
fi
