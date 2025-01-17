#!/bin/bash
echo "Installing Insync client:"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
[ -f /etc/apt/sources.list.d/insync.list ] || echo "deb http://apt.insync.io/ubuntu  $(. /etc/os-release && echo "$VERSION_CODENAME") non-free contrib" | sudo dd of=/etc/apt/sources.list.d/insync.list
sudo apt update
sudo apt install insync
