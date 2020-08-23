#!/bin/bash
DIR_ROOT=$1
echo "Installing ZSH, after oh-my-zsh was installed, type 'exit' to go back and finalize the installation..."
read -p "Understood and continue? [YyJj] " -n 1 -r
echo
if [[ $REPLY =~ ^[YyJj]$ ]]
then
  sudo apt install zsh
  cd $HOME
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  git clone https://github.com/dArignac/fx.git .fx
  $HOME/.fx/zsh/install.sh
  cd $DIR_ROOT
fi
