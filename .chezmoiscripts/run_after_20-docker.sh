#!/bin/bash

set -euo pipefail

sudo usermod -aG docker $USER
sudo systemctl start docker
sudo systemctl enable --now docker
