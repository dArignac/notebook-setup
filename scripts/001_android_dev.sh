#!/bin/bash
echo "Preparing for Android Development Tooling"
sudo aptitude install qemu-kvm
sudo adduser $USER kvm
# FIXME add the android studio setup stuff
