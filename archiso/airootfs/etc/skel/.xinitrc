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
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
# old: eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# old: export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
# old: export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

# Polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

systemctl --user import-environment DISPLAY

# Gnome related
#gsettings-data-convert &
#/usr/lib/gnome-settings-daemon/gnome-settings-daemon &
#xdg-user-dirs-gtk-update &

# Dbus fix
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi
dbus-update-activation-environment --systemd DISPLAY


# .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Autostart section
exec slstatus &
# exec sxhkd &
# exec megasync &

exec dwm
