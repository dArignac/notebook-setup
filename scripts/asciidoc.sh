#!/bin/bash
echo "Installing asciidoctor"
sudo aptitude install ruby graphviz
sudo gem install asciidoctor asciidoctor-diagram
$HOME/.local/bin/pip3 install --user blockdiag
