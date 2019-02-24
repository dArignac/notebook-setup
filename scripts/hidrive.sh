#!/bin/bash
echo "Preparing for HiDrive via WebDAV:"
sudo aptitude install davfs2 ca-certificates
sudo usermod -aG davfs2 $USER
echo "# HiDrive" | sudo dd of=/etc/fstab
echo "https://webdav.hidrive.strato.com/ /mnt/hidrive davfs _netdev,noauto,user,rw 0 0" | sudo dd of=/etc/fstab
sudo mkdir -p /mnt/hidrive
echo "Done! Mount it via 'mount /mnt/hidrive'"
