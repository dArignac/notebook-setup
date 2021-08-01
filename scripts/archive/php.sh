#!/bin/bash
echo "Installing PHP:"
sudo aptitude install php7.3-cli php7.3-bz2 libbz2-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libxslt-dev libcurl4-gnutls-dev
sudo -E curl -L -o /usr/local/bin/phpbrew -O https://github.com/phpbrew/phpbrew/releases/latest/download/phpbrew.phar
sudo chmod +x /usr/local/bin/phpbrew
phpbrew init
