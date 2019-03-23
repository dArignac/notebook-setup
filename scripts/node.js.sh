#!/bin/bash
echo "Installting nvm"
mkdir -p $HOME/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | PROFILE=~/.zshrc bash

echo "Installing yarn"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo aptitude update
sudo aptitude install yarn

