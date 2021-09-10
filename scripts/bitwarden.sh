#!/bin/bash
echo "setting up Bitwarden..."
curl -L -o ~/Bitwarden.AppImage https://vault.bitwarden.com/download/?app=desktop&platform=linux
cp .local/share/applications/BitWarden.desktop ~/.local/share/applications/BitWarden.desktop
