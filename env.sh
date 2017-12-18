#!/usr/bin/env bash

# env
alias ea="vi ~/env/env.sh "
alias sa="source ~/env/env.sh "
alias eh="sudo vi /etc/hosts"

# aliases
alias cls="clear"
alias cb='xclip -sel clip'
alias yaml2json="ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF))'"
alias json2yaml="ruby -ryaml -rjson -e 'puts JSON.load(ARGF).to_yaml'"
alias pycharm="/opt/pycharm/bin/pycharm.sh>/dev/null"
alias csv="column -t -s,"
alias tsv="column -t -s$'\t'"
alias del_pyc="find . -name '*pyc' -delete"
alias beep='paplay /usr/share/sounds/ubuntu/ringtones/Harmonics.ogg'
alias noti='~/env/scripts/noti'

alias tawk="awk -F'\t'"
# bash functions

function ap {
   awk -v x=$1 '{print $x}'
}
function abs_path(){
	readlink -f $1
}
function mcd(){
    mkdir $1
    cd $1
}

# configuration variables
HISTSIZE=10000
HISTFILESIZE=200000
# vi default editor:
export EDITOR='vi'  


# appearance
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
   
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
[ -f ~/.git-completion.bash ] &&   . ~/.git-completion.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh
