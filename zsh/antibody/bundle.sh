#!/bin/sh
antibody bundle <"$(pwd)/bundles.txt" > $HOME/.zsh_plugins.sh
antibody update
