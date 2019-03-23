#!/bin/bash
echo "setting up git..."
sudo aptitude install git
git config --global user.name "Alexander Herrmann"
git config --global user.email "darignac@gmail.com"
git config --global credential.helper cache
# cache 4 hours
git config --global credential.helper 'cache --timeout=14400'

echo "adding git-lfs"
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo aptitude update && sudo aptitude install git-lfs
git lfs install