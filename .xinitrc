#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# start gnome keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export $(gnome-keyring-daemon --start --components=pksc11,secrets,ssh,gpg)
export SSH_AUTH_SOCK


# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# program startup
wal -R
sxhkd &
nm-applet &
picom &
nabi &
keepassxc &
protonmail-bridge --no-window &
deadd-notification-center &
xss-lock --transfer-sleep-lock -- betterlockscreen -l blur &
/$HOME/.config/polybar/launch.sh >/dev/null 2>&1 &
mpdscribble --conf "$HOME/.config/mpdscribble/mpdscribble.conf" &
setxkbmap -option caps:escape

if [ -d /etc/X11/xinit/xinitrc.d ]; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [[ $(hostname) == 'somnia' ]]; then
	flatpak run com.discordapp.Discord --start-minimized &
	flatpak run com.spotify.Client &
fi

exec bspwm
