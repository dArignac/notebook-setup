#!/bin/bash
PATH_ROOT=$1
PATH_CONFIG=".config/puddletag/puddletag.conf"
PATH_ACTIONS=".local/share/puddletag/actions"
PATH_CONFIG_TARGET="$HOME/$PATH_CONFIG"
PATH_ACTIONS_TARGET="$HOME/$PATH_ACTIONS"

echo "Installing puddletag..."
sudo aptitude install puddletag

echo "Linking config and actions..."
[ -e $PATH_CONFIG_TARGET ] && mv $PATH_CONFIG_TARGET "$PATH_CONFIG_TARGET.bak"
ln -s "$PATH_ROOT/$PATH_CONFIG" $PATH_CONFIG_TARGET
[ -e $PATH_ACTIONS_TARGET ] && mv $PATH_ACTIONS_TARGET "$PATH_ACTIONS_TARGET.bak"
ln -s -d "$PATH_ROOT/$PATH_ACTIONS" $PATH_ACTIONS_TARGET

echo "Done!"
