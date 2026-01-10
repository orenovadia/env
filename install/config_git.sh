#!/usr/bin/env bash

git config --global core.editor "vim"

# Aliases
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" 
git config --global alias.lgng "log --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" 
git config --global alias.lgs "log --color --stat --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" 
git config --global alias.ss "status --short --branch" 
git config --global alias.stats "shortlog -sn" 
git config --global alias.recent "for-each-ref --count=10 --sort=-committerdate refs/heads/ --format='%(refname:short)'"

# Install git completion if it doesn't exist
if [ ! -f ~/.git-completion.bash ]; then
    echo "Installing git-completion.bash..."
    curl -fLo ~/.git-completion.bash \
        https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "✓ git-completion.bash installed successfully"
    else
        echo "✗ Failed to download git-completion.bash"
    fi
else
    echo "git-completion.bash already exists"
fi
