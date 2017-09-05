#!/bin/bash
echo "Enabling contrib nonfree in apt":
sudo sed -i 's/main/main contrib non-free/' /etc/apt/sources.list
[ -f /etc/apt/sources.list.d/deb-multimedia.list ] || echo "deb ftp://ftp.deb-multimedia.org stable main non-free" | sudo dd of=/etc/apt/sources.list.d/deb-multimedia.list
echo "Ignore the key warning for multimedia-keyring:"
sudo apt-get update -oAcquire::AllowInsecureRepositories=true
sudo apt-get install deb-multimedia-keyring -oAcquire::AllowInsecureRepositories=true
echo "now back to normal:"
sudo apt-get install aptitude
sudo aptitude install firmware-iwlwifi firmware-realtek bumblebee-nvidia primus
echo "To get the wifi and NVIDIA driver running, please restart and continue with setup.2.sh!"
