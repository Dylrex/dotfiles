# ~/zprofile

# $HOME/.local/bin in path
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
export WGETRC="$HOME/.config/wget/wgetrc"
export INPUTRC="$HOME/.config/inputrc"

# Etc Progs
export DICS="/usr/share/stardict/dic/"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export _JAVA_AWT_WM_NONREPARENTING="1"

# Enable Hangul with Nabi
export XIM=nabi
export XIM_ARGS=
export XIM_PROGRAM="nabi"
export XMODIFIERS="@im=nabi"
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim

# Slow Gnome Apps Fix
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

# A E S T H E T I C
export PF_INFO="ascii title os kernel pkgs memory wm shell palette"

[ -f "$HOME/.config/.aliasrc" ] && source "$HOME/.config/.aliasrc"

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
