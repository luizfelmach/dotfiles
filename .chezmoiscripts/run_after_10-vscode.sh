#!/bin/bash

set -euo pipefail

extensions=(
  "bradlc.vscode-tailwindcss"
  "christian-kohler.path-intellisense"
  "donjayamanne.githistory"
  "esbenp.prettier-vscode"
  "miguelsolorio.symbols"
  "ms-python.debugpy"
  "ms-python.python"
  "ms-python.vscode-pylance"
  "ms-toolsai.jupyter"
  "ms-toolsai.jupyter-keymap"
  "ms-toolsai.jupyter-renderers"
  "ms-toolsai.vscode-jupyter-cell-tags"
  "ms-toolsai.vscode-jupyter-slideshow"
  "ms-vscode.cpptools"
  "mvllow.rose-pine"
  "natqe.reload"
  "nomicfoundation.hardhat-solidity"
  "pomdtr.excalidraw-editor"
  "prisma.prisma"
)

if ! command -v code &> /dev/null; then
  exit 0
fi

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
