#!/usr/bin/env bash
if [ -f  ~/.vim/autoload/plug.vim ]
then
    echo "vim plugin installed"
else
    # install vim-plug https://github.com/junegunn/vim-plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # sudo apt-get install cmake exuberant-ctags
    # vim -s <(echo ':PlugInstall\n')
    # ~/.vim/plugged/youcompleteme/install.py
fi