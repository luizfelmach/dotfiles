#!/bin/bash


LIST="$CHEZMOI_WORKING_TREE/dot_packages.list"

packages=()

while IFS= read -r line; do
  if [[ -z "$line" || "$line" == \#* ]]; then
    continue
  fi
  if ! pacman -Q "$line" &>/dev/null; then
    packages+=("$line")
  fi
done < "$LIST"


yay -S "${packages[@]}"
