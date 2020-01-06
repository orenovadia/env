#!/usr/bin/env bash
# git aliases
if [ "${ENV_MAC}" = "true" ]
then
  function gchange(){
    local branch=$(git recent  | fzf --height 40%)
    if [ ! -z "${branch}" ]
    then
      git checkout "${branch}"
    fi
  }
else
  alias gchange='git recent  | fzf --height 40% | xargs -t --no-run-if-empty git checkout'
fi

alias groot='cd `git rev-parse --show-toplevel`'
alias gshort-commit='git rev-parse --short HEAD | cb && git rev-parse --short HEAD && echo "Copied to clipboard"'

mgit(){
for i in `ls -d  */.git  | sed 's/\/\.git//g'`; do echo "For ${i}:"; cd $i; git $@; echo "-----------------"; cd ..; done
}

garchive() {
	for branch in "$@"
	do
		echo archiving "${branch}"
		git tag archive/${branch} ${branch}
		git branch -D ${branch}
	done
}
