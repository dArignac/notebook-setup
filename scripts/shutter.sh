#!/bin/bash
echo "Installing Shutter:"
sudo aptitude install shutter
mkdir -p ~/Bilder/Screenshots
[ -d ~/.shutter/profiles ] || mkdir -p ~/.shutter/profiles
cp .shutter/profiles/alex* ~/.shutter/profiles/
