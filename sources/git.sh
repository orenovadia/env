# git
alias gchange='git recent  | fzf --height 40% | xargs -t --no-run-if-empty git checkout'
alias groot='cd `git rev-parse --show-toplevel`'

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
