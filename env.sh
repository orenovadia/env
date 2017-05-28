#!/usr/bin/env bash

# env
alias ea="vi ~/env/env.sh "
alias sa="source ~/env/env.sh "

# aliases
alias cls="clear"
alias cb='xclip -sel clip'
alias yaml2json="ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF))'"
alias json2yaml="ruby -ryaml -rjson -e 'puts JSON.load(ARGF).to_yaml'"
alias pycharm="/opt/pycharm/bin/pycharm.sh>/dev/null"
alias csv="column -t -s,"
alias del_pyc="find . -name '*pyc' -delete"


# git
alias gchange='select i in `git recent`  ; do echo checking out  $i && git checkout $i ; git ss ; break; done'

garchive() {
	for branch in "$@"
	do
		echo archiving "${branch}"
		git tag archive/${branch} ${branch}
		git branch -D ${branch}
	done
}

# functions
function ap {
   awk -v x=$1 '{print $x}'
}
abs_path(){
	readlink -f $1
}

# configuration variables
HISTSIZE=20000
HISTFILESIZE=20000

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
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh
