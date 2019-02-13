#!/bin/bash
echo "Installing asciidoctor"
sudo aptitude install ruby graphviz
sudo gem install asciidoctor asciidoctor-diagram
pip3 install --user blockdiag
