#!/bin/bash

if command -v go &> /dev/null; then
  echo "Go is already installed."
else
  # Update package list
  sudo apt update
  
  # Install dependencies
  sudo apt install build-essential -y
  
  cd $HOME
  export ver="1.19.2"
  sudo wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz"
  sudo rm -rf /usr/local/go
  sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz"
  sudo rm "go$ver.linux-amd64.tar.gz"
  echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile
fi
  # Check
if command -v go &> /dev/null; then
  echo "Go installed successfully."
else
  echo "An error occurred while installing GO."
fi
