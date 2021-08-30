#!/bin/bash
echo "Installing libs for fingerprint sensor..."
sudo apt install libfprint-2-tod1
curl -fsSLo /tmp/dell-fingerprint.deb http://dell.archive.canonical.com/updates/pool/public/libf/libfprint-2-tod1-goodix/libfprint-2-tod1-goodix_0.0.6-0ubuntu1\~somerville1_amd64.deb
sudo dpkg -i /tmp/dell-fingerprint.deb
echo "Now restart. Afterwards configure the fingerprint in Settings>User and run 'sudo pam-auth-update' and select fingerprint as login method"