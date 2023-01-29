#!/bin/bash -x

CMD="command -v go"
if $CMD &> /dev/null; then
  echo "Go is already installed."
else
  # Update package list
  CMD="sudo apt update"
  $CMD
  if [ $? -ne 0 ]; then
    echo "Failed to update package list."
    exit 1
  fi
  
  # Install dependencies
  CMD="sudo apt install build-essential -y"
  $CMD
  if [ $? -ne 0 ]; then
    echo "Failed to install build-essential."
    exit 1
  fi
  
  cd $HOME
  export ver="1.19.2"
  CMD="sudo wget https://golang.org/dl/go$ver.linux-amd64.tar.gz"
  $CMD
  if [ $? -ne 0 ]; then
    echo "Failed to download Go."
    exit 1
  fi
  CMD="sudo rm -rf /usr/local/go"
  $CMD
  CMD="sudo tar -C /usr/local -xzf go$ver.linux-amd64.tar.gz"
  $CMD
  if [ $? -ne 0 ]; then
    echo "Failed to extract Go."
    exit 1
  fi
  CMD="sudo rm go$ver.linux-amd64.tar.gz"
  $CMD
  echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile
fi
  # Check
CMD="command -v go"
if $CMD &> /dev/null; then
  echo "Go installed successfully."
else
  echo "An error occurred while installing GO."
fi
