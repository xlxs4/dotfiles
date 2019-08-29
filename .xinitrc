#!/usr/bin/env sh

# shellcheck source=/home/xlxs4/.xprofile
[ -f "$HOME/.xprofile" ] && . ~/.xprofile
# shellcheck source=/home/xlxs4/.Xresources
[ -f ~/.Xresources ] && xrdb -merge -I"$HOME" ~/.Xresources

exec i3
