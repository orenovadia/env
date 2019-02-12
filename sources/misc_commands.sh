#!/usr/bin/env bash
function __misc_cmds() {
# simply add here commands where 
# the first word is the name (and will be omited) 
# and the rest is the command
cat << EOM
weather curl http://wttr.in?1
cheats curl http://cheat.sh
EOM
}

function __misc_choose() {
__misc_cmds | fzf --reverse --ansi --height 20%  --with-nth 1 | sed  's,^\w\w*\s*,,g' 
}

function misc() {
    V=`__misc_choose`
    echo + ${V} 1>&2
    ${V}
}
