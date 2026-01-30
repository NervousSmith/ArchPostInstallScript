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

sudo pacman -S solaar libreoffice-fresh okular 7zip discord firefox flatpak base-devel neovim wine gamemode gamescope steam partitionmanager mission-center kate libreoffice-fresh-pl powerdevil adobe-source-sans-pro-fonts ttf-dejavu ttf-opensans noto-fonts freetype2 terminus-font ttf-bitstream-vera ttf-dejavu ttf-droid ttf-fira-mono ttf-fira-sans ttf-freefont ttf-inconsolata ttf-liberation libertinus-font git --noconfirm  

