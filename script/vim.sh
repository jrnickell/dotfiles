#!/usr/bin/env bash

# vundle plugin directory
BUNDLE_DIR=$HOME/.vim/bundle
BACKUP_DIR=$HOME/.vim/backup
SWAP_DIR=$HOME/.vim/swap

# home dir
cd ~

# create backup directory
if [ ! -d $BACKUP_DIR ]; then
    mkdir -p $BACKUP_DIR
fi

# create swap directory
if [ ! -d $SWAP_DIR ]; then
    mkdir -p $SWAP_DIR
fi

# install or update plugins
if [ -d $BUNDLE_DIR ]; then
    vim +PluginUpdate +qall &>/dev/null
else
    vim +PluginInstall +qall &>/dev/null
fi
