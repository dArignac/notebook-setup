#!/bin/bash
echo "installing vim & preferred editor..."
sudo aptitude install vim
sudo update-alternatives --config editor
