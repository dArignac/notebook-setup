#!/bin/bash

# Azure Functions Core Tools
echo "Installing Azure Functions Core Tools..."
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" | sudo dd of=/etc/apt/sources.list.d/dotnetdev.list
sudo apt update
sudo apt install azure-functions-core-tools-3