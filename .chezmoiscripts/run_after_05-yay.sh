#!/bin/bash

set -euo pipefail

if command -v yay &> /dev/null; then
  exit 0
fi

cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd -
rm -rf yay
