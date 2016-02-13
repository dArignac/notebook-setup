#!/bin/bash
echo "Install basic packages:"
sudo aptitude install vim curl keepass2 encfs git htop multitail
sudo update-alternatives --config editor

echo "Getting bash config:"
curl -s https://raw.githubusercontent.com/darignac/fx/master/.bash_aliases > ~/.bash_aliases
source ~/.bash_aliases

echo "Configuring git:"
git config --global user.name "Alexander Herrmann"
git config --global user.email "darignac@gmail.com"
git config --global credential.helper cache
# cache 4 hours
git config --global credential.helper 'cache --timeout=14400'

echo "Installing Insync client..."
wget -qO - https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key | sudo apt-key add -
[ -f /etc/apt/sources.list.d/insync.list ] || echo "deb http://apt.insynchq.com/debian jessie non-free contrib" | sudo dd of=/etc/apt/sources.list.d/insync.list
sudo aptitude update && sudo aptitude install insync

echo "Installing requirements for PIA"
sudo aptitude install openvpn network-manager-openvpn network-manager-openvpn-gnome uuid-runtime
