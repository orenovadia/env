#!/usr/bin/env bash
# git aliases

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

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
alias gshort-commit='git rev-parse --short HEAD | tr -d "\n" | cb && git rev-parse --short HEAD && echo "Copied to clipboard"'

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

function _branch_completion () {
  is_in_git_repo || return 1
  FZF_COMPLETION_OPTS=("--preview-window right:70% --preview 'git lgs --color=always {}'")
  FZF_COMPLETION_TRIGGER='@' _fzf_complete  \
       < <(git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)' );
}

# Note: The default git completion is loaded from ~/.git-completion.bash
# If you want to use '@' trigger for branch completion with fzf, you can
# create a custom completion for specific git commands, but we don't override
# the main 'git' completion here to preserve all git completions.