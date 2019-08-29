#!/usr/bin/env bash

# Disable ctrl-s and ctrl-q.
stty -ixon

# cd into directory merely by typing the directory name.
shopt -s autocd
# Correct cd typos.
shopt -s cdspell

# Update $LINES and $COLUMNS if necessary.
shopt -s checkwinsize

# Include .<filename> when globbing.
shopt -s dotglob
# Enable extended pattern matching.
shopt -s extglob

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# Infinite history.
export HISTSIZE= 
export HISTFILESIZE= 
export HISTTIMEFORMAT="[%F %T]"
# Change the file location because some bash sessions truncate
# the default .bash_history file.
export HISTFILE=$HOME/.eb_history
# Force the prompt to write to history after every command.
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Git powerline bash script.
# shellcheck source=/home/xlxs4/.bash-powerline.sh
source "$HOME/.bash-powerline.sh"

# Shortcuts and aliases.
# shellcheck source=/home/xlxs4/.config/shortcutrc
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
# shellcheck source=/home/xlxs4/.config/aliasrc
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
