#!/bin/bash
echo "Installing terminator:"
sudo aptitude install terminator
[ -d ~/.config/terminator ] || mkdir -p ~/.config/terminator
cp .config/terminator/config ~/.config/terminator/config
