#!/bin/bash

set -euo pipefail

docker_packages="$CHEZMOI_WORKING_TREE/dot_packages/docker.list"

if command -v docker &> /dev/null; then
  exit 0
fi

echo "install docker? (y/n)"
read -r ans

if [[ "$ans" == "y" ]]; then
  sudo pacman -S $(cat $docker_packages | xargs)
  sudo usermod -aG docker $USER
  sudo systemctl start docker
  sudo systemctl enable --now docker
fi
