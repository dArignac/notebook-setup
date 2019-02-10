#!/bin/bash
echo "Installing Insync client (with repo):"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
[ -f /etc/apt/sources.list.d/insync.list ] || echo "deb http://apt.insynchq.com/ubuntu bionic non-free contrib" | sudo dd of=/etc/apt/sources.list.d/insync.list
sudo aptitude update
sudo aptitude install insync
