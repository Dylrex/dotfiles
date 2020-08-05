#!/bin/sh

# merge with xinitrc.d, fix for some issues I had.
if [ -d /etc/X11/xinit/xinitrc.d ]; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# host based program startup
if [[ $(hostname) == 'somnia' ]]; then
#	dmigpumain &
	flatpak run com.spotify.Client &
#	mpdscribble --conf "$HOME/.config/mpdscribble/mpdscribble.conf" &
	numlockx &
elif [[ $(hostname) == 'laptop' ]]; then
	xrandr --output eDP1 --scale 1 --dpi 130
fi

# universal program startup
nm-applet &
dwmblocks &
nabi &
picom &
keepassxc &
dunstcolours &
#setxkbmap -option caps:escape
#nordvpn c Australia Sydney &
protonmail-bridge --noninteractive --no-window &
xss-lock --transfer-sleep-lock -- betterlockscreen -l blur &
#flatpak run com.discordapp.Discord --start-minimized --disable-seccomp-filter-sandbox &
flatpak run com.discordapp.Discord --start-minimized &

#wal -R
~/.fehbg &
[[ -f ~/.config/Xresources ]] && xrdb -merge ~/.config/Xresources

while true; do
    #dwm 2> ~/.cache/dwm.log
    dwm >/dev/null 2>&1
done
