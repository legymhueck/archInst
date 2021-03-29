#!/bin/sh

userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources
#usermodmap=$HOME/.Xmodmap
#sysmodmap=/etc/X11/xinit/.Xmodmap

setxkbmap de &

export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# gnome-keyring-daemon (arch linux wiki)
# start Gnome keyring
if [ -f /usr/bin/gnome-keyring-daemon ]; then
  dbus-update-activation-environment --systemd DISPLAY
  eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
  export SSH_AUTH_SOCK
fi

# Polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Dbus fix
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

#.Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Autostart section
# exec xrandr --output Virtual-1 --mode 1920x1200 &
exec slstatus &
exec megasync &
exec insync start &
exec /home/michael/.screenlayout/arch.sh &
exec dbus-run-session dwm

# old: eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# old: export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
# old: export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK
systemctl --user import-environment DISPLAY

# Gnome related
# gsettings-data-convert &
# /usr/lib/gnome-settings-daemon/gnome-settings-daemon &
# xdg-user-dirs-gtk-update &
# exec sxhkd &
