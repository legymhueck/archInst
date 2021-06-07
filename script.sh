#!/bin/bash
#set -e

func_install() {
  if pacman -Qi "$1" &>/dev/null; then
    tput setaf 2
    echo "###############################################################################"
    echo "The package '$1' is already installed"
    echo "###############################################################################"
    echo
    tput sgr0
  else
    tput setaf 3
    echo "###############################################################################"
    echo "Installing package " "$1"
    echo "###############################################################################"
    echo
    tput sgr0
    sudo pacman -S --noconfirm --needed "$1"
  fi
}

###############################################################################
echo "Installation of sound software"
###############################################################################

list=(
  intellij-idea-community-edition
)

count=0

for name in "${list[@]}"; do
  count=$((count + 1))
  tput setaf 3
  echo "Installing package nr.  "$count " " "$name"
  tput sgr0
  func_install "$name"
done

###############################################################################

tput setaf 11
echo "################################################################"
echo "All packages have been installed"
echo "################################################################"
echo
tput sgr0
