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

echo "Installing requirements for PIA"
sudo aptitude install openvpn network-manager-openvpn network-manager-openvpn-gnome uuid-runtime


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
