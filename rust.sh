#!/bin/bash

fmt=`tput setaf 45`
end="\e[0m\n"
err="\e[31m"
scss="\e[32m"

echo -e "${fmt}\nRust installation${end}" && sleep 1

if command -v rustc &> /dev/null; then
  echo -e "${fmt}\nRust is already installed.${end}" && sleep 1
else
  # Update package list
  sudo apt update

  # Install dependencies
  sudo apt install curl -y

  # Download and install rustup
  sudo curl https://sh.rustup.rs -sSf | sh -s -- -y

  # Add rust to PATH
  . $HOME/.cargo/env
  
  if command -v rustc &> /dev/null; then
    echo -e "${fmt}\nRust installed successfully.${end}" && sleep 1
  else
    echo -e "${err}\nAn error occurred while installing Rust.${end}" && sleep 1
  fi

fi


