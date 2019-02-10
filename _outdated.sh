#!/bin/bash
DIRHERE=`pwd`

#echo "Enabling contrib nonfree in apt":
#sudo sed -i 's/main/main contrib non-free/' /etc/apt/sources.list
#[ -f /etc/apt/sources.list.d/deb-multimedia.list ] || echo "deb ftp://ftp.deb-multimedia.org stable main non-free" | sudo dd of=/etc/apt/sources.list.d/deb-multimedia.list
#echo "Ignore the key warning for multimedia-keyring:"
#sudo apt-get update -oAcquire::AllowInsecureRepositories=true
#sudo apt-get install deb-multimedia-keyring -oAcquire::AllowInsecureRepositories=true
#echo "now back to normal:"
#sudo apt-get install aptitude
#sudo aptitude install firmware-iwlwifi firmware-realtek bumblebee-nvidia primus
#echo "To get the wifi and NVIDIA driver running, please restart and continue with setup.2.sh!"

echo "Install basic packages:"
sudo aptitude install  libdvdread4 vobcopy libdvdcss2 imagemagick jpegoptim  

# source: https://wiki.debian.org/BluetoothUser/a2dp
# FIXME stilla problem in stretch?
#echo "Installing bluetooth:"
#sudo aptitude install pulseaudio pulseaudio-module-bluetooth pavucontrol bluez-firmware
#sudo service bluetooth restart
#sudo killall pulseaudio


echo "Installing requirements for PIA"
sudo aptitude install openvpn network-manager-openvpn network-manager-openvpn-gnome uuid-runtime

#echo "Installing VirtualBox:"
#wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
#[ -f /etc/apt/sources.list.d/virtualbox.list ] || echo "deb http://download.virtualbox.org/virtualbox/debian stretch contrib" | sudo dd of=/etc/apt/sources.list.d/virtualbox.list
#sudo aptitude update
#sudo aptitude install virtualbox-5.1

echo "Installing docker (have to logout and login again to use without sudo afterwards), Source: https://docs.docker.com/engine/installation/linux/docker-ce/debian/#install-using-the-repository:"
sudo aptitude install apt-transport-https ca-certificates gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo aptitude update
sudo aptitude install docker-ce
sudo usermod -aG docker $USER
sudo -E curl -L -o /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m`
sudo chmod +x /usr/local/bin/docker-compose
sudo -E curl -L -o /etc/bash_completion.d/docker-compose https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose
sudo -E curl -L -o /usr/local/bin/docker-machine https://github.com/docker/machine/releases/download/v0.12.2/docker-machine-`uname -s`-`uname -m`
sudo chmod +x /usr/local/bin/docker-machine
sudo -E curl -L -o /etc/bash_completion.d/docker-machine.bash https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine.bash
sudo -E curl -L -o /etc/bash_completion.d/docker-machine-wrapper.bash https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-wrapper.bash


#echo "Installing Dropbox:"
#sudo aptitude install python-gpgme
#curl -L -o /tmp/dropbox.deb https://www.dropbox.com/download?dl=packages/debian/dropbox_2015.10.28_amd64.deb
#sudo gdebi /tmp/dropbox.deb
#nautilus --quit

#echo "Installing rclone:"
#curl -L -o /tmp/rclone.zip https://downloads.rclone.org/v1.45/rclone-v1.45-linux-amd64.zip
#cd /tmp
#unzip rclone.zip
#mv rclone-* $HOME/
#sudo cp $HOME/rclone-*/rclone /usr/bin/
#sudo chown root:root /usr/bin/rclone
#sudo chmod 755 /usr/bin/rclone
#sudo mkdir -p /usr/local/share/man/man1
#sudo cp $HOME/rclone-*/rclone.1 /usr/local/share/man/man1/
#sudo mandb

cd ${DIRHERE}
