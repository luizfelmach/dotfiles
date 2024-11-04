#!/bin/bash

set -euo pipefail

function install() {
  if ! command -v $1 &> /dev/null; then
    sudo pacman -S $1 --noconfirm
  fi
}

install zsh
install git

USER_SHELL=$(grep "^$(whoami):" /etc/passwd | cut -d: -f7)

if [ "$USER_SHELL" != $(which zsh) ]; then
  chsh -s $(which zsh)
fi

folders=(
    "Downloads"
    "Images"
    "Docs"
    "Github"
    "Tmp"
)

for folder in "${folders[@]}"; do
    mkdir -p "$HOME/$folder"
done
