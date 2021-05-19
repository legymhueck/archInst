echo "aur packages"
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --import -
paru -S --needed --noconfirm ventoy-bin filius jetbrains-toolbox spotify ttf-ms-fonts liberica-jdk-11-full-bin
paru -S --needed --noconfirm brave-bin simplenote-electron-bin bitwarden-bin breeze-red-cursor-theme
paru -S --needed --noconfirm breeze-red-cursor-theme chaotic-mirrorlist chaotic-keyring gimagereader

