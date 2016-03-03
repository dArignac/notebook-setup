#!/bin/bash
echo "Install basic packages:"
sudo aptitude install vim curl keepass2 encfs git htop multitail p7zip-rar clamav
sudo update-alternatives --config editor

echo "Installing gnome-encfs-manager (with repo):"
[ -f /etc/apt/sources.list.d/gnome-encfs-manager.list ] || echo "deb http://download.opensuse.org/repositories/home:/moritzmolch:/gencfsm/Debian_8.0/ /" | sudo dd of=/etc/apt/sources.list.d/gnome-encfs-manager.list
sudo aptitude update
sudo aptitude install gnome-encfs-manager

echo "Getting bash config:"
curl -s https://raw.githubusercontent.com/darignac/fx/master/.bash_aliases > ~/.bash_aliases
source ~/.bash_aliases

echo "Configuring git:"
git config --global user.name "Alexander Herrmann"
git config --global user.email "darignac@gmail.com"
git config --global credential.helper cache
# cache 4 hours
git config --global credential.helper 'cache --timeout=14400'

echo "Installing Insync client (with repo):"
wget -qO - https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key | sudo apt-key add -
[ -f /etc/apt/sources.list.d/insync.list ] || echo "deb http://apt.insynchq.com/debian jessie non-free contrib" | sudo dd of=/etc/apt/sources.list.d/insync.list
sudo aptitude update
sudo aptitude install insync

echo "Installing TresorIT client:"
curl https://installerstorage.blob.core.windows.net/public/install/tresorit_installer.run -o /tmp/tresorit.run
chmod +x /tmp/tresorit.run && /tmp/tresorit.run

echo "Installing Thunderbird/Icedove:"
sudo aptitude install gnupg2 enigmail icedove icedove-l10n-de
echo -e "\e[1;33mInstall ImportExportTools from Website https://addons.mozilla.org/de/thunderbird/addon/importexporttools/\e[0m"

echo "Installing requirements for PIA"
sudo aptitude install openvpn network-manager-openvpn network-manager-openvpn-gnome uuid-runtime

echo "Installating Filezilla:"
sudo aptitude install filezilla

echo "Installing docker (have to logout and login again to use without sudo afterwards):"
curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker alex
