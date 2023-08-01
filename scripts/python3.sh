#!/bin/bash
# install pdm
curl -sSL https://pdm.fming.dev/dev/install-pdm.py | python3 -

mkdir -p $ZSH_CUSTOM/plugins/pdm
pdm completion zsh > $ZSH_CUSTOM/plugins/pdm/_pdm

