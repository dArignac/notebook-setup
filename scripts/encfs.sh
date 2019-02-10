#!/bin/bash
echo "Installing gnome-encfs-manager (with repo):"
sudo add-apt-repository ppa:gencfsm
sudo aptitude update
sudo aptitude install encfs gnome-encfs-manager
