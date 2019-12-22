# ~/.bash_profile
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Default Progs
export FILE="ranger"
export TERMINAL="st"
export EDITOR="nvim"
export BROWSER="firefox"
export READER="zathura"

# Clean
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export LESSHISTFILE="/dev/null/"

BASHRC_CONFIG_DIR="~/.config/bash"

if [ -f "$BASHRC_CONFIG_DIR/.bashrc" ]; then
    . "$BASHRC_CONFIG_DIR/.bashrc"
fi

#[[ -f ~/.bashrc ]] && . ~/.bashrc
