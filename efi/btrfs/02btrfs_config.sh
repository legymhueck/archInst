ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc

sed -i '/de_DE.UTF-8 UTF-8/s/^#//g' /etc/locale.gen
sed -i '/en_US.UTF-8 UTF-8/s/^#//g' /etc/locale.gen

locale-gen

echo "KEYMAP=de-latin1" >> /etc/vconsole.conf

echo "arch" > /etc/hostname

echo "127.0.0.1 localhost
::1       localhost
127.0.1.1 arch.localdomain  arch" > /etc/hosts

echo "LANG=en_US.UTF-8
LANGUAGE=en_US
LC_CTYPE="de_DE.UTF-8"
LC_NUMERIC="de_DE.UTF-8"
LC_TIME="de_DE.UTF-8"
LC_COLLATE="de_DE.UTF-8"
LC_MONETARY="de_DE.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="de_DE.UTF-8"
LC_NAME="de_DE.UTF-8"
LC_ADDRESS="de_DE.UTF-8"
LC_TELEPHONE="de_DE.UTF-8"
LC_MEASUREMENT="de_DE.UTF-8"
LC_IDENTIFICATION="de_DE.UTF-8"
LC_ALL=" > /etc/locale.conf

passwd

bootctl --path=/boot install

echo "default arch
timeout 1
editor 0" > /boot/loader/loader.conf

echo "title ArchLinux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root=/dev/sda2 rootflags=subvol=@root quiet rw" > /boot/loader/entries/arch.conf

systemctl enable systemd-timesyncd
systemctl enable systemd-homed
# systemctl enable systemd-networkd
# systemctl enable systemd-resolved
systemctl enable acpid
systemctl enable NetworkManager
# avahi-daemon

sed -i '/%wheel ALL=(ALL) ALL/s/^#//g' /etc/sudoers
sed -i 'BUILDDIR=/tmp/makepkg/s/^#//g' /etc/makepkg.conf

echo "tmpfs                                           /tmp                   tmpfs   rw,nodev,nosuid 0  0
#tmpfs                                           /home/michael/.cache   tmpfs   rw,nodev,nosuid 0  0
" >> /etc/fstab

#echo "[Match]
#Name=en*

#[Network]
#DHCP=yes
##Address=192.168.2.11/24
#Gateway=192.168.2.1
#DNS=192.168.2.3
#" > /etc/systemd/network/20-wired.network

#ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# base udev block keymap keyboard autodetect modconf encrypt filesystems
exit
umount -R /mnt

