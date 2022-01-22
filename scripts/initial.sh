#!/bin/bash
sudo apt install clamav curl filezilla fonts-powerline gdebi gsmartcontrol htop jq multitail net-tools p7zip-rar poedit terminator vlc vim
echo "Adjusting default editor to vim:"
sudo update-alternatives --config editor
echo "Copying terminator config:"
[ -d ~/.config/terminator ] || mkdir -p ~/.config/terminator
cp .config/terminator/config ~/.config/terminator/config
