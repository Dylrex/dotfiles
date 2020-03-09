#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# start gnome keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export $(gnome-keyring-daemon --start --components=pksc11,secrets,ssh,gpg)
export SSH_AUTH_SOCK

# enable hangul with nabi
export XIM=nabi
export XIM_ARGS=
export XIM_PROGRAM="nabi"
export XMODIFIERS="@im=nabi"
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim

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
sxhkd &
nm-applet &
picom &
keepassxc &
nabi &
protonmail-bridge --no-window &
deadd-notification-center &
xss-lock --transfer-sleep-lock -- betterlockscreen -l blur &
/$HOME/.config/polybar/launch.sh >/dev/null 2>&1 &
mpdscribble --conf "/$HOME/.config/mpdscribble/mpdscribble.conf" &

if [ -d /etc/X11/xinit/xinitrc.d ]; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [[ $(hostname) == 'somnia' ]]; then
	flatpak run com.discordapp.Discord &
	flatpak run com.spotify.Client &
fi

wal -R

exec bspwm
