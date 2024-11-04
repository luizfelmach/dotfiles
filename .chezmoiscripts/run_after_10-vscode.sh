#!/bin/bash

set -euo pipefail

if ! command -v code &> /dev/null; then
  exit 0
fi

mapfile -t extensions < "$CHEZMOI_WORKING_TREE/dot_extensions.list"

installed=$(code --list-extensions)

for ext in "${extensions[@]}"; do
    if ! echo "$installed" | grep -q "$ext"; then
        code --install-extension "$ext"
    fi
done

for ext in $installed; do
    if ! [[ " ${extensions[@]} " =~ " $ext " ]]; then
        code --uninstall-extension "$ext"
    fi
done
