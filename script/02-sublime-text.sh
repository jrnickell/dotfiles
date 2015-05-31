#!/usr/bin/env bash

if [ ! -f "$HOME/.config/sublime-text-3/Installed Packages/Package Control.sublime-package" ]; then
    if [ ! -d "$HOME/.config/sublime-text-3/Installed Packages" ]; then
        mkdir -p "$HOME/.config/sublime-text-3/Installed Packages"
    fi
    cd "$HOME/.config/sublime-text-3/Installed Packages"
    wget -O "Package Control.sublime-package" "https://packagecontrol.io/Package%20Control.sublime-package"
fi
