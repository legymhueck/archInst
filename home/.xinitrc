#!/bin/sh

# Language
setxkbmap de &

#.Xresources
userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Java applications
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

# Autostart
exec slstatus &
#exec megasync &
#exec insync start &
exec /home/michael/.screenlayout/arch.sh &
exec dbus-run-session dwm
