#!/bin/bash
DIRHERE=`pwd`

echo "Install basic packages:"
sudo aptitude install vim curl keepass2 encfs git htop multitail p7zip-rar clamav vlc poedit s3cmd libdvdread4 vobcopy libdvdcss2 imagemagick jpegoptim
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

echo "Installing VirtualBox:"
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
[ -f /etc/apt/sources.list.d/virtualbox.list ] || echo "deb http://download.virtualbox.org/virtualbox/debian jessie contrib" | sudo dd of=/etc/apt/sources.list.d/virtualbox.list
sudo aptitude update
sudo aptitude install virtualbox-5.0

echo "Installing docker (have to logout and login again to use without sudo afterwards):"
curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker alex
sudo curl -L -o /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m`
sudo chmod +x /usr/local/bin/docker-compose
sudo curl -L -o /etc/bash_completion.d/docker-compose https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose
sudo curl -L -o /usr/local/bin/docker-machine https://github.com/docker/machine/releases/download/v0.6.0/docker-machine-`uname -s`-`uname -m`
sudo chmod +x /usr/local/bin/docker-machine
sudo curl -L -o /etc/bash_completion.d/docker-machine.bash https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine.bash
sudo curl -L -o /etc/bash_completion.d/docker-machine-wrapper.bash https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-wrapper.bash

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

echo "Installing gnormalize:"
# may need to install libavcodec-extra - but is conflicts with already installed packages
sudo aptitude install mpg321 faac faad lame flac libcdaudio1 libcdaudio-dev libperl-dev musepack-tools cmake vorbis-tools cdparanoia
curl -L -o /tmp/gnormalize.tar.gz /tmp/gnormalize.tar.gz http://prdownloads.sourceforge.net/gnormalize/gnormalize-0.63.tar.gz?download
cd /tmp
tar xzf gnormalize.tar.gz
cd gnormalize*
sudo ./install
cd ${DIRHERE}

echo "Installing Python:"
sudo aptitude install python3-dev python-dev libffi-dev libxml2-dev libxslt1-dev libpq-dev libsqlite3-dev libjpeg-dev
curl https://bootstrap.pypa.io/get-pip.py | sudo python
curl https://bootstrap.pypa.io/get-pip.py | sudo python3
sudo python /usr/local/lib/python2.7/dist-packages/pip install virtualenv
sudo python3 /usr/local/lib/python3.4/dist-packages/pip install virtualenv
mkdir -p /tmp/py
curl -o /tmp/py/py35.tgz https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz
tar xzf /tmp/py/py35.tgz -C /tmp/py/
cd /tmp/py/Python-3.5.2/
./configure && make && sudo make altinstall
curl -o /tmp/py/py33.tgz https://www.python.org/ftp/python/3.3.6/Python-3.3.6.tgz
tar xzf /tmp/py/py33.tgz -C /tmp/py/
cd /tmp/py/Python-3.3.6/
./configure && make && sudo make altinstall

cd ${DIRHERE}
