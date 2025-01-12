#!/bin/bash

set -euo pipefail

FILE="/etc/libvirt/network.conf"
CONTENT='firewall_backend = "iptables"'

if ! grep -Fxq "$CONTENT" "$FILE"; then
    echo "$CONTENT" | sudo tee -a "$FILE" > /dev/null
fi

sudo usermod -aG libvirt $USER