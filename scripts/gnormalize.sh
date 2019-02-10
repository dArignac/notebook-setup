#!/bin/bash
DIR_ROOT=$1
VERSION="0.63"
echo "Installing gnormalize:"
# may need to install libavcodec-extra - but is conflicts with already installed packages
sudo aptitude install mpg321 faac faad lame flac libcdaudio1 libcdaudio-dev libperl-dev musepack-tools cmake vorbis-tools cdparanoia
curl -L -o /tmp/gnormalize.tar.gz "http://prdownloads.sourceforge.net/gnormalize/gnormalize-${VERSION}.tar.gz?download"
cd /tmp
tar xzf gnormalize.tar.gz
cd "/tmp/gnormalize-${VERSION}" && sudo "/tmp/gnormalize-${VERSION}/install"
cd ${DIR_ROOT}
