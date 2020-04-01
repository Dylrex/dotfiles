#!/bin/sh

# start gnome keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# wm-independant program startup
nm-applet &
picom &
nabi &
keepassxc &
protonmail-bridge --no-window &
dunstcolours &
xss-lock --transfer-sleep-lock -- betterlockscreen -l blur &
mpdscribble --conf "$HOME/.config/mpdscribble/mpdscribble.conf" &
setxkbmap -option caps:escape

numlockx &

if [ -d /etc/X11/xinit/xinitrc.d ]; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [[ $(hostname) == 'somnia' ]]; then
	flatpak run com.discordapp.Discord --start-minimized --disable-seccomp-filter-sandbox &
	flatpak run com.spotify.Client &
fi

# Colours
#wal -R
~/.fehbg &
[[ -f ~/.config/Xresources ]] && xrdb -merge ~/.config/Xresources

# BSPWM
sxhkd &
rpol >/dev/null 2>&1 &
exec bspwm

## DWM
#dwmblocks &
#while true; do
#    dwm 2> ~/.dwm.log
#    #dwm >/dev/null 2>&1
#done
