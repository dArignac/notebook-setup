#!/bin/bash
DIRHERE=`pwd`

echo "Install basic packages:"
sudo aptitude install vim curl keepass2 encfs git htop multitail p7zip-rar clamav vlc poedit s3cmd libdvdread4 vobcopy libdvdcss2 imagemagick jpegoptim puddletag davfs2 gdebi digikam
sudo update-alternatives --config editor

# davfs2 group
sudo usermod -aG davfs2 $USER

# source: https://wiki.debian.org/BluetoothUser/a2dp
# FIXME stilla problem in stretch?
#echo "Installing bluetooth:"
#sudo aptitude install pulseaudio pulseaudio-module-bluetooth pavucontrol bluez-firmware
#sudo service bluetooth restart
#sudo killall pulseaudio

echo "Installing gnome-encfs-manager (with repo):"
[ -f /etc/apt/sources.list.d/gnome-encfs-manager.list ] || echo "deb http://download.opensuse.org/repositories/home:/moritzmolch:/gencfsm/Debian_9.0/ /" | sudo dd of=/etc/apt/sources.list.d/gnome-encfs-manager.list
wget -nv http://download.opensuse.org/repositories/home:moritzmolch:gencfsm/Debian_9.0/Release.key -O /tmp/gnome-encfs-manager-release.key
sudo apt-key add - < /tmp/gnome-encfs-manager-release.key
rm /tmp/gnome-encfs-manager-release.key
sudo aptitude update
sudo aptitude install gnome-encfs-manager

echo "Configuring git:"
git config --global user.name "Alexander Herrmann"
git config --global user.email "darignac@gmail.com"
git config --global credential.helper cache
# cache 4 hours
git config --global credential.helper 'cache --timeout=14400'

echo "Installing Insync client (with repo):"
wget -qO - https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key | sudo apt-key add -
[ -f /etc/apt/sources.list.d/insync.list ] || echo "deb http://apt.insynchq.com/debian stretch non-free contrib" | sudo dd of=/etc/apt/sources.list.d/insync.list
sudo aptitude update
sudo aptitude install insync

echo "Installing requirements for PIA"
sudo aptitude install openvpn network-manager-openvpn network-manager-openvpn-gnome uuid-runtime

echo "Installating Filezilla:"
sudo aptitude install filezilla

echo "Installing VirtualBox:"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
[ -f /etc/apt/sources.list.d/virtualbox.list ] || echo "deb http://download.virtualbox.org/virtualbox/debian stretch contrib" | sudo dd of=/etc/apt/sources.list.d/virtualbox.list
sudo aptitude update
sudo aptitude install virtualbox-5.1

echo "Installing docker (have to logout and login again to use without sudo afterwards), Source: https://docs.docker.com/engine/installation/linux/docker-ce/debian/#install-using-the-repository:"
sudo aptitude install apt-transport-https ca-certificates gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo aptitude update
sudo aptitude install docker-ce
sudo usermod -aG docker $USER
sudo -E curl -L -o /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m`
sudo chmod +x /usr/local/bin/docker-compose
sudo -E curl -L -o /etc/bash_completion.d/docker-compose https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose
sudo -E curl -L -o /usr/local/bin/docker-machine https://github.com/docker/machine/releases/download/v0.12.2/docker-machine-`uname -s`-`uname -m`
sudo chmod +x /usr/local/bin/docker-machine
sudo -E curl -L -o /etc/bash_completion.d/docker-machine.bash https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine.bash
sudo -E curl -L -o /etc/bash_completion.d/docker-machine-wrapper.bash https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-wrapper.bash

echo "Installing terminator:"
sudo aptitude install terminator
[ -d ~/.config/terminator ] || mkdir -p ~/.config/terminator
cp .config/terminator/config ~/.config/terminator/config

echo "Installing Shutter:"
sudo aptitude install shutter
mkdir -p ~/Bilder/Screenshots
[ -d ~/.shutter/profiles ] || mkdir -p ~/.shutter/profiles
cp .shutter/profiles/alex* ~/.shutter/profiles/

echo "Installing Dropbox:"
sudo aptitude install python-gpgme
curl -L -o /tmp/dropbox.deb https://www.dropbox.com/download?dl=packages/debian/dropbox_2015.10.28_amd64.deb
sudo gdebi /tmp/dropbox.deb
nautilus --quit

echo "Installing gnormalize:"
# may need to install libavcodec-extra - but is conflicts with already installed packages
sudo aptitude install mpg321 faac faad lame flac libcdaudio1 libcdaudio-dev libperl-dev musepack-tools cmake vorbis-tools cdparanoia
curl -L -o /tmp/gnormalize.tar.gz http://prdownloads.sourceforge.net/gnormalize/gnormalize-0.63.tar.gz?download
cd /tmp
tar xzf gnormalize.tar.gz
cd gnormalize*
sudo ./install
cd ${DIRHERE}

echo "Installing Python:"
curl https://bootstrap.pypa.io/get-pip.py | sudo -E python3

echo "Installing asciidoctor"
sudo aptitude install ruby graphviz
sudo gem install asciidoctor asciidoctor-diagram
sudo pip3 install blockdiag

echo "Setting up fish shell:"
wget -qO - http://download.opensuse.org/repositories/shells:fish:release:2/Debian_9.0/Release.key | sudo apt-key add -
[ -f /etc/apt/sources.list.d/fish.list ] || echo "deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_9.0/ /" | sudo dd of=/etc/apt/sources.list.d/fish.list
sudo aptitude update
sudo aptitude install fish
mkdir -p ~/.config/fish
curl -s https://raw.githubusercontent.com/darignac/fx/master/config.fish > ~/.config/fish/config.fish
echo "Changing shell to fish:"
chsh -s /usr/bin/fish

echo "Installing rclone:"
curl -L -o /tmp/rclone.zip https://downloads.rclone.org/rclone-v1.37-linux-amd64.zip
cd /tmp
unzip rclone.zip
mv rclone-* $HOME/
sudo cp $HOME/rclone-*/rclone /usr/bin/
sudo chown root:root /usr/bin/rclone
sudo chmod 755 /usr/bin/rclone
sudo mkdir -p /usr/local/share/man/man1
sudo cp $HOME/rclone-*/rclone.1 /usr/local/share/man/man1/
sudo mandb

cd ${DIRHERE}
