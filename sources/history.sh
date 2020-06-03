#!/usr/bin/env bash

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# HISTSIZE=1000
# HISTFILESIZE=2000

# configuration variables
HISTSIZE=10000
HISTFILESIZE=200000


function configure_history_for_multiple_terminals() {
	# This piece of script takes care of having consistent history
	# across multiple terminals which is good when working with
	# multiple x terminals or systems like screen or tmux
	# References:
	# - https://askubuntu.com/questions/80371/bash-history-handling-with-multiple-terminals
	[[ "${PROMPT_COMMAND}" =~ "history" ]] && return # we are already configured
        if [ -n "${PROMPT_COMMAND}" ]
	then
		export PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
	else
		export PROMPT_COMMAND="history -a; history -n"
	fi
	# read the history before every command by binding to RETURN
	# https://superuser.com/questions/117227/a-command-before-every-bash-command
	# This does not work
	# bind 'RETURN: "\e[1~history -n \e[4~\n"'
	return 0
}

configure_history_for_multiple_terminals
