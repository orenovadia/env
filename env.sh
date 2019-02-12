#!/usr/bin/env bash

# env
alias ea="vi ~/env/env.sh "
alias sa="source ~/env/env.sh "
alias eh="sudo vi /etc/hosts"
alias did="vim +'r!date' +$'normal o\t'  ~/did.txt"

# aliases
alias cls="clear"
alias cb='xclip -sel clip'
alias beep='paplay /usr/share/sounds/ubuntu/ringtones/Harmonics.ogg'

function abs_path(){
	readlink -f $1
}
function mcd(){
    mkdir $1
    cd $1
}

# path:
export PATH="${PATH}:~/env/tools/"

# Make vi default editor:
export EDITOR='vi'  


# appearance
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1='$(__E=$? ; if [ $__E == 0 ]; then true; else echo "(exit:$__E) "; fi)${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
   
# local sources
if [ -d ~/env/local/ ]; then
  for i in `ls ~/env/local/` ; do
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

# Third party  imports
[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh
