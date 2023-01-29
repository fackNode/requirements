#!/bin/bash

echo "Rust installation"

if command -v rustc &> /dev/null; then
  echo "Rust is already installed."
else
  # Update package list
  sudo apt update

  # Install dependencies
  sudo apt install curl -y

  # Download and install rustup
  sudo curl https://sh.rustup.rs -sSf | sh -s -- -y

  # Add rust to PATH
  . $HOME/.cargo/env
fi

if command -v rustc &> /dev/null; then
  echo "rust installed successfully."
else
  echo "An error occurred while installing docker-compose."
