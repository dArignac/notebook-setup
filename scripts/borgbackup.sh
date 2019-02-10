#!/bin/bash
echo "Installing borg backup:"
sudo add-apt-repository ppa:costamagnagianfranco/borgbackup
sudo aptitude update
sudo aptitude install borgbackup
