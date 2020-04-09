#!/usr/bin/env bash
# Python:
function _grep_fzf(){ 
PATTERN=$1
ref=$( grep  --include '*.py' -o -n  -r -P "${PATTERN}" . \
| fzf --height 40%  -d':' -n1 --with-nth 3 )

[[ -z $ref ]] &&  return
vi `echo $ref  |  awk -F':' '{print "+"$2 ,$1}' ` ;
}; 

function _grep_fzf_file_ref(){ 
PATTERN=$1
ref=`grep  --include '*.py' -o -n  -r -P "${PATTERN}" . | grep -v test | awk -F':' '{print $3, $1, $2}'| fzf --height 40% `
# name file line
[[ -z $ref ]] &&  return
vi `echo $ref  |  awk '{print "+"$3 ,$2}' ` ;
}; 
function fspymethod(){
_grep_fzf_file_ref  '(?<=def\s)(\b\w+\b)'
}
function fspyclass(){
_grep_fzf  '(?<=class\s)(\b\w+)'
}
bind '"\C-n":"fspyclass\n"'  # Ctrl+n opens `fspyclass`
bind '"\C-f":"fspymethod\n"' # Ctrl+f opens `pymethod`

# Git:

if [ "${ENV_MAC}" = "true" ]
then
    function gitbrowse() {
        git lgng "$@" |  fzf --reverse --ansi --bind "ctrl-m:execute: (echo {1} | pbcopy  && git show --color=always {1} | less -r  )"
    }
else
    function gitbrowse() {
        git lgng "$@" |  fzf --reverse --ansi --bind "ctrl-m:execute: (echo {1} | xclip && git show --color=always {1} | less -r  )"
    }
fi
bind '"\C-b":"gchange\n"' # Ctrl+b opens changes git branch
bind '"\C-g":"gchange\n"' # Ctrl+g opens changes git branch


function fspyclassreference () 
{ 
    ref=$( grep  --include '*.py' -o -r -P "${PATTERN}" .     | fzf --height 40%  -d':' -n1 --with-nth 2 );
    [[ -z $ref ]] && return;
    echo $ref |python -c 'import sys; print sys.stdin.read().replace("/", ".").replace(".py:", ".").strip().strip(".")'  
}

alias fspy='$(echo fspymethod,fspyclass,fspyclassreference |tr "," "\n"|fzf --height 10%)'
