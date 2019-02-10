#!/bin/bash
echo "adding user to sudo and adm group..."
sudo usermod -aG sudo,adm $USER
sudo apt-get install aptitude curl keepass2 htop multitail p7zip-rar clamav vlc poedit s3cmd gdebi digikam gsmartcontrol fonts-powerline filezilla
echo "some package has postfix as dependency, disabling autostart..."
sudo update-rc.d postfix disable
