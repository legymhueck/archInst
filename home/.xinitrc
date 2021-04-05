#!/bin/sh

#.Xresources
userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setxkbmap de &

export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

# Autostart section
exec slstatus &
#exec megasync &
#exec insync start &
exec /home/michael/.screenlayout/arch.sh &
exec dbus-run-session dwm
