#!/bin/bash
echo "Preparing for Android Development Tooling"
# for android emulation, speeds up the emulator
sudo aptitude install qemu-kvm
sudo adduser $USER kvm

# flutter linux desktop requirements
sudo aptitude install clang

# FIXME add the android studio setup stuff
