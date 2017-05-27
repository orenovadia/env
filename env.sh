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

# local sources
if [ -d ~/env/local/ ]; then
  for i in `ls ~/env/local/` ; do 
    source ~/env/local/${i}
  done  
fi

# imports
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

