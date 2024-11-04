#!/bin/bash

set -euo pipefail

virt_packages="$CHEZMOI_WORKING_TREE/dot_packages/virt.list"

if command -v virsh &> /dev/null; then
  exit 0
fi

echo "install virt? (y/n)"
read -r ans

if [[ "$ans" == "y" ]]; then
  sudo pacman -S $(cat $virt_packages | xargs)

  FILE="/etc/libvirt/network.conf"
  CONTENT='firewall_backend = "iptables"'

  if ! grep -Fxq "$CONTENT" "$FILE"; then
      echo "$CONTENT" | sudo tee -a "$FILE" > /dev/null
  fi

  sudo systemctl enable --now libvirtd
  sudo usermod -aG libvirt $USER
fi
