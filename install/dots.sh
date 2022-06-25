#!/usr/bin/env bash

# link all the dots to home dir
ln -f  -s ~/env/dots/.vimrc ~/.vimrc
ln -f  -s ~/env/dots/.psqlrc ~/.psqlrc
ln -f  -s ~/env/dots/.tmux.conf  ~/.tmux.conf

# not in home dir
mkdir -p ~/.config/htop/ || true
ln -f -s ~/env/dots/htoprc ~/.config/htop/htoprc
