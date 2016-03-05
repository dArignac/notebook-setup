#!/bin/bash
echo "Install basic packages:"
sudo aptitude install vim curl keepass2 encfs git htop multitail p7zip-rar clamav vlc poedit s3cmd libdvdread4
sudo update-alternatives --config editor

# source: https://wiki.debian.org/BluetoothUser/a2dp
echo "Installing bluetooth:"
sudo aptitude install pulseaudio pulseaudio-module-bluetooth pavucontrol bluez-firmware
sudo service bluetooth restart
sudo killall pulseaudio

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
sudo aptitude install python-gpgme gnupg2 enigmail icedove icedove-l10n-de
echo -e "\e[1;33mInstall ImportExportTools from Website https://addons.mozilla.org/de/thunderbird/addon/importexporttools/\e[0m"
echo -e "\e[1;33mTo restore the profile, execute icdedove -ProfileManager, delete the default profile, create a new one and copy the profile files into the folder of the newly creattd profile\e[0m"

echo "Installing requirements for PIA"
sudo aptitude install openvpn network-manager-openvpn network-manager-openvpn-gnome uuid-runtime

echo "Installating Filezilla:"
sudo aptitude install filezilla

echo "Installing docker (have to logout and login again to use without sudo afterwards):"
curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker alex

echo "Installing terminator:"
sudo aptitude install terminator
[ -d ~/.config/terminator ] || mkdir -p ~/.config/terminator
cp .config/terminator/config ~/.config/terminator/config

echo "Installing Shutter:"
sudo aptitude install shutter
mkdir -p ~/Bilder/Screenshots
[ -d ~/.shutter/profiles ] || mkdir ~/.shutter/profiles
cp .shutter/profiles/alex* ~/.shutter/profiles/

echo "Installing Dropbox:"
curl -L -o /tmp/dropbox.deb https://www.dropbox.com/download?dl=packages/debian/dropbox_2015.10.28_amd64.deb
sudo dpkg -i /tmp/dropbox.deb
nautilus --quit
