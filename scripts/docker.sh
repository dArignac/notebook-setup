#!/bin/bash
# see https://docs.docker.com/install/linux/docker-ce/ubuntu/
echo "Setting up docker..."
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo -E curl -L -o /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/v2.32.4/docker-compose-`uname -s`-`uname -m`
sudo chmod +x /usr/local/bin/docker-compose
sudo -E curl -L -o /etc/bash_completion.d/docker-compose https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose
sudo usermod -aG docker $USER
