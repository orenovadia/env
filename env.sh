#!/usr/bin/env bash

# Configuration
if [ $(uname -s) = "Darwin" ]
then
    ENV_MAC=true
else
    ENV_MAC=false
fi

# env
alias ea="vi ~/env/env.sh "
alias sa="source ~/env/env.sh "
alias eh="sudo vi /etc/hosts"
alias did="vim +'r!date' +$'normal o\t'  ~/did.txt"
alias todo="vi ~/todo.txt"

# aliases
alias cls="clear"
alias beep='paplay /usr/share/sounds/ubuntu/ringtones/Harmonics.ogg'
if [ "${ENV_MAC}" = "true" ]
then
    function cb()
    {
        pbcopy
    }
    function abs_path(){
            # (requires `brew install coreutils`)
            greadlink -f $1
    }
    export GREP_OPTIONS=--color=auto
    export BASH_SILENCE_DEPRECATION_WARNING=1
else
    function cb()
    {
        xclip -sel clip
    }

    function abs_path(){
            readlink -f $1
    }
fi

function mcd(){
    mkdir $1
    cd $1
}

# path:
append_to_path () {
  if ! echo "$PATH" | grep -Eq "(^|:)$1($|:)" ; then
    export PATH="$PATH:$1"
  fi
}


append_to_path "~/env/tools/"
# Make vi default editor:
export EDITOR='vi'  


# appearance
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1='$(__E=$? ; if [ $__E == 0 ]; then true; else echo "(exit:$__E) "; fi)${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\] \n \$ '
   
# Third party  imports
[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

# local sources
if [ -d ~/env/local/ ]; then
  for i in `ls ~/env/local/ | sort` ; do
    source ~/env/local/${i}
  done  
fi

# per host
if [ -f ~/env/per_host/${HOSTNAME} ]; then
  source ~/env/per_host/${HOSTNAME}
fi

# source for every machine
for i in `ls ~/env/sources/` ; do
    source ~/env/sources/${i}
done  


if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi

true # do not finish with a non 0 exit code due to above conditions

