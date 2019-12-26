# ~/zprofile
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
export ZDOTDIR="$HOME/.config/zsh"

# A E S T H E T I C
export PF_INFO="ascii title os kernel pkgs memory wm shell palette"


[ -f "$HOME/.config/.aliasrc" ] && source "$HOME/.config/.aliasrc"

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
