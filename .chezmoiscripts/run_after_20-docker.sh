#!/bin/bash

set -euo pipefail

if command -v docker &> /dev/null; then
  exit 0
fi

echo "install docker? (y/n)"
read -r ans

if [[ "$ans" == "y" ]]; then
  sudo pacman -S docker docker-compose docker-buildx
  sudo usermod -aG docker $USER
  sudo systemctl start docker
  sudo systemctl enable --now docker
fi
