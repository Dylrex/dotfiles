#!/bin/bash

# PS1='[\u@\h \W]\$ '
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

shopt -s autocd
HISTSIZE= HISTFILESIZE= #Infinite History
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="nvim"
export TERMINAL="st"

export PATH=$PATH:/opt/bin:/usr/contrib/bin:/bin:/usr/sbin:/usr/bin/X11:/var/lib/flatpak/exports/bin/:usr/bin/arduino:

[ -f "$HOME/.config/.aliasrc" ] && source "$HOME/.config/.aliasrc"
