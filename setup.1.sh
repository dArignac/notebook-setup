#!/bin/bash
echo "Enabling contrib nonfree in apt":
sudo sed -i 's/main/main contrib non-free/' sources.list
[ -f /etc/apt/sources.list.d/deb-multimedia.list ] || echo "deb ftp://ftp.deb-multimedia.org stable main non-free" | sudo dd of=/etc/apt/sources.list.d/deb-multimedia.list
sudo aptitude update
sudo apt-get install deb-multimedia-keyring
sudo aptitude install firmware-iwlwifi firmware-realtek bumblebee-nvidia primus
echo "To get the wifi running, please restart and continue with setup.2.sh!"
