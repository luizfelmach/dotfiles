#!/bin/bash

set -euo pipefail

if ! command -v zsh &> /dev/null; then
  sudo pacman -S zsh --noconfirm
fi

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
