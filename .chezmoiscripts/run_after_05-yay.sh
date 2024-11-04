#!/bin/bash

set -euo pipefail

if command -v yay &> /dev/null; then
  exit 0
fi

echo "install yay? (y/n)"
read -r ans

if [[ "$ans" == "y" ]]; then
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd -
  rm -rf yay
fi
