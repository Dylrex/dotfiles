#!/bin/bash

PS1='[\u@\h \W]\$ '

shopt -s autocd
HISTSIZE= HISTFILESIZE= #Infinite History
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="nvim"
export TERMINAL="st"

export PATH=$PATH:/opt/bin:/usr/contrib/bin:/bin:/usr/sbin:/usr/bin/X11:/var/lib/flatpak/exports/bin/:usr/bin/arduino:

[ -f "$HOME/.config/.aliasrc" ] && source "$HOME/.config/.aliasrc"
