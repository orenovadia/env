#!/usr/bin/env bash
if ! type fzf > /dev/null; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    yes | ~/.fzf/install
else
    echo "fzf is installed"
fi
