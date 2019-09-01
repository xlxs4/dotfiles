#!/usr/bin/env sh
# Profile file. Runs on login.

# Adds `~/.local/bin/` and all subdirectories to $PATH
BIN_PATH="$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
YARN_PATH="$(yarn global bin)"
export PATH="$YARN_PATH:$BIN_PATH:$PATH"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="qutebrowser"
export READER="zathura"
export FILE="vifm"
export BIB="$HOME/Documents/LaTeX/uni.bib"
export REFER="$HOME/Documents/referbib"
export SUDO_ASKPASS="$HOME/.local/bin/tools/dmenupass"
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
# TODO: export GREP_COLORS=""

# less/man colors
LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"
export LESS=-R
export LESS_TERMCAP_mb
export LESS_TERMCAP_md
export LESS_TERMCAP_me
export LESS_TERMCAP_so
export LESS_TERMCAP_se
export LESS_TERMCAP_us
export LESS_TERMCAP_ue

mpd >/dev/null 2>&1 &

[ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1

# shellcheck source=/home/xlxs4/.bashrc
echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && . "$HOME/.bashrc"

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# Switch escape and caps if tty:
sudo -n loadkeys ~/.local/bin/ttymaps.kmap 2>/dev/null

# shellcheck source=/home/xlxs4/.xinitrc
. "$HOME/.xinitrc"
