#!/bin/bash

fmt=`tput setaf 45`
end="\e[0m\n"
err="\e[31m"
scss="\e[32m"

echo -e "${fmt}\nGO installation${end}" && sleep 1

CMD="command -v go"
if $CMD &> /dev/null; then
  echo -e "${fmt}\nGo is already installed.${end}" && sleep 1
else
  # Update package list
  CMD="sudo apt update"
  $CMD
  if [ $? -ne 0 ]; then
     echo -e "${err}\nFailed to update package list.${end}" && sleep 1
    exit 1
  fi
  
  # Install dependencies
  CMD="sudo apt install build-essential -y"
  $CMD
  if [ $? -ne 0 ]; then
    echo -e "${err}\nFailed to install build-essential.${end}" && sleep 1
    exit 1
  fi
  
  cd $HOME
  export ver="1.19.2"
  CMD="sudo wget https://golang.org/dl/go$ver.linux-amd64.tar.gz"
  $CMD
  if [ $? -ne 0 ]; then
    echo -e "${err}\nFailed to download Go.${end}" && sleep 1
    exit 1
  fi
  CMD="sudo rm -rf /usr/local/go"
  $CMD
  CMD="sudo tar -C /usr/local -xzf go$ver.linux-amd64.tar.gz"
  $CMD
  if [ $? -ne 0 ]; then
    echo -e "${err}\nFailed to extract Go.${end}" && sleep 1
    exit 1
  fi
  CMD="sudo rm go$ver.linux-amd64.tar.gz"
  $CMD
  echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile
fi
  # Check
CMD="command -v go"
if $CMD &> /dev/null; then
  echo -e "${fmt}\nGo installed successfully.${end}" && sleep 1
else
  echo -e "${err}\nAn error occurred while installing GO.${end}" && sleep 1
fi
