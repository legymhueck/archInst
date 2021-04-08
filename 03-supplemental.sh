#!/bin/sh

# Internet not essential 
#echo "Internet not essential"
#sudo pacman -S --needed --noconfirm network-manager-applet nm-connection-editor

# Audio
echo "Audio"
sudo pacman -S --needed --noconfirm audacity

# Video
echo "Video"
sudo pacman -S --needed --noconfirm vlc mpv handbrake mediathek libva-mesa-driver libva-intel-driver

# Image
echo "Image"
sudo pacman -S --needed --noconfirm imagemagick gimp feh geeqie gpicview-gtk3 ristretto sxiv

# Codecs
echo "Codecs"
sudo pacman -S --needed --noconfirm gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav
sudo pacman -S --needed --noconfirm gst-libav libdvdcss

# Spelling
echo "Spelling"
sudo pacman -S --needed --noconfirm hunspell hunspell-de hunspell-en_GB hunspell-en_US aspell aspell-de aspell-en hyphen
sudo pacman -S --needed --noconfirm hyphen-de hyphen-en

# Packer
sudo pacman -S --needed --noconfirm p7zip unzip libunrar

# Printer
echo "Printer"
sudo pacman -S --needed --noconfirm cups libcups gsfonts system-config-printer ghostscript gtk3-print-backends

# Printer Driver
echo "Printer Driver"
sudo pacman -S --needed --noconfirm foomatic-db foomatic-db-engine foomatic-db-nonfree foomatic-db-nonfree-ppds
sudo pacman -S --needed --noconfirm foomatic-db-gutenprint-ppds splix gutenprint

# PDF
echo "PDF"
sudo pacman -S --needed --noconfirm epdfview img2pdf xpdf cups-pdf

# Nextcloud
#echo "Nextcloud"
#sudo pacman -S --needed --noconfirm nextcloud nextcloud-client nextcloud-app-tasks nextcloud-app-spreed
#sudo pacman -S --needed --noconfirm nextcloud-app-notes nextcloud-app-mail nextcloud-app-contacts
#sudo pacman -S --needed --noconfirm nextcloud-app-calendar nextcloud-app-bookmarks

# Wireless
echo "Wireless"
sudo pacman -S --needed --noconfirm wpa_supplicant broadcom-wl

#Virtualisation
sudo pacman -S --needed --noconfirm qemu libvirt virt-manager ebtables dnsmasq bridge-utils dmidecode ovmf qemu-arch-extra dnsmasq openbsd-netcat screen
sudo gpasswd -a michael libvirt
sudo gpasswd -a michael kvm

# Programme
echo "Programme"
sudo pacman -S --needed --noconfirm aria2 osdbattery catfish mlocate plocate gpart gparted mc rofi alacritty
sudo pacman -S --needed --noconfirm doublecmd-gtk2 lxappearance-gtk3 youtube-dl simplescreenrecorder simple-scan
sudo pacman -S --needed --noconfirm notepadqq deadbeef upower rsync discord python-pip libreoffice-fresh obs-studio
sudo pacman -S --needed --noconfirm veracrypt l3afpad

# Keyboard shortcuts dwm
#echo "Keyboard shortcuts dwm"
#sudo pacman -S --needed --noconfirm sxhkd

# Firewall
echo "Firewall"
sudo pacman -S --needed --noconfirm firewalld ipset ebtables
sudo systemctl enable --now firewalld
# in a browser, open 'localhost:9090'

# Firewalld rules
sudo firewall-cmd --add-service libvirt --zone=libvirt --permanent
sudo firewall-cmd --add-port=1025-65535/tcp --zone=libvirt --permanent
sudo firewall-cmd --add-port=1025-65535/udp --zone=libvirt --permanent
sudo firewall-cmd --reload

# Cockpit
#sudo pacman -S --needed --noconfirm cockpit packagekit
#sudo systemctl enable --now cockpit.socket

# Activating services
echo "Activating services"
sudo systemctl enable fstrim.timer

git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -si --noconfirm

echo "YAY packages"
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --import -
pikaur -S --needed --noconfirm ventoy-bin filius jetbrains-toolbox spotify ttf-ms-fonts liberica-jdk-11-full-bin
pikaur -S --needed --noconfirm brave-bin simplenote-electron-bin bitwarden-bin breeze-red-cursor-theme
pikaur -S --needed --noconfirm breeze-red-cursor-theme chaotic-mirrorlist chaotic-keyring gimagereader

sudo sh -c "echo '[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist' >> /etc/pacman.conf"
