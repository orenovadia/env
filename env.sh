#!/bin/bash

# aliases
alias cls="clear"

# git
alias gchange='select i in `git recent`  ; do echo checking out  $i && git checkout $i ; git ss ; break; done'

# functions
function ap {
   awk -v x=$1 '{print $x}' 
}

# imports
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# to install fzf: 
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install

