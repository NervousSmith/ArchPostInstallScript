#!/bin/bash

echo "Starting script!"

#Config pacman 
pacmanConfig = "/etc/pacman.conf"

echo "Editing pacman.conf"

if [[ $EUID -ne 0 ]]; then
  echo "You need sudo privilages to continue!"
  exit 1
fi

sed -i 's/^#Color/Color/' "$pacmanConfig"
sed -i 's/^#VerbosePkgLists/VerbosePkgLists/' "$pacmanConfig"
sed -i '/^\[multilib\]/,/^Include/s/^#//' "$pacmanConfig"

echo "Edited pacman.conf successfully"

echo "Updating pacman"

sudo pacman -Sy
sudo pacman -Syu

echo "Installing packages"

sudo pacman -S solaar libreoffice-fresh okular 7zip discord flatpak base-devel wine gamemode gamescope steam partitionmanager kate libreoffice-fresh-pl powerdevil git ttf-inter-font noto-fonts-cjk noto-fonts-emoji ttf-liberation --noconfirm  
