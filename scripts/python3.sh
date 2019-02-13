#!/bin/bash
echo "Installing Python:"
sudo aptitude install python3-distutils
curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
python3 /tmp/get-pip.py --user
