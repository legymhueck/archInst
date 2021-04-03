#!/bin/sh
echo "zram" > /etc/modules-load.d/zram.conf
echo "options zram num_devices=2" > /etc/modprobe.d/zram.conf
echo "KERNEL=="zram0", ATTR{disksize}="512M" RUN="/usr/bin/mkswap /dev/zram0", TAG+="systemd"" > /etc/udev/rules.d/99-zram.rules
echo "/etc/fstab" >> /etc/fstab
