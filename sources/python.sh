#!/usr/bin/env bash

alias pycharm="/opt/pycharm/bin/pycharm.sh>/dev/null"
alias del_pyc="find . -name '*pyc' -delete"


function prun() {
        # this function run a python module using python2 by its filename
        # remove .py
        module=${1%.py}
        # replace slashes by dots
        module=${module//\//.}
        # trailing slash / dot 
        module=${module%.}
        module=${module#.}
        # preceding  dot 
        module=${module#.}
        python -m $module "${@:2}"
}

