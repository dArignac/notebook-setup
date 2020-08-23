#!/bin/bash
echo "setting up git..."
sudo apt install git
git config --global user.name "Alexander Herrmann"
git config --global user.email "106409+dArignac@users.noreply.github.com"
git config --global credential.helper cache
# cache 4 hours
git config --global credential.helper 'cache --timeout=14400'

echo "adding git-lfs"
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt update && sudo apt install git-lfs
git lfs install
