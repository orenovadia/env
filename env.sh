#!/usr/bin/env bash

# env
alias ea="vi ~/env/env.sh "
alias sa="source ~/env/env.sh "

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

