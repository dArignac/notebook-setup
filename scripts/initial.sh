#!/bin/bash
sudo apt-get install vim terminator curl keepass2 htop multitail p7zip-rar clamav vlc poedit gdebi gsmartcontrol fonts-powerline filezilla
echo "Adjusting default editor to vim:"
sudo update-alternatives --config editor
echo "Copying terminator config:"
[ -d ~/.config/terminator ] || mkdir -p ~/.config/terminator
cp .config/terminator/config ~/.config/terminator/config

# FIXME move to aws: s3cmd
# FIXME unclear xdotool digikam
# FIXME necessary ? echo "some package has postfix as dependency, disabling autostart..."
# sudo update-rc.d postfix disable
