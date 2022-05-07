#!/bin/bash

##Basic System
var=$(lsb_release -ds | tr -d '"')
echo "$var"

##Chaotic AUR
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo sudo echo -e "\n[chaotic-aur] \nInclude = /etc/pacman.d/chaotic-mirrorlist " | sudo tee -a  /etc/pacman.conf

##Folder tmp
mkdir .tmp

##Frogging-Familly // CPU
cd .tmp
git clone https://github.com/Frogging-Family/linux-tkg.git
	cd linux-tkg
	makepkg -si
cd ..

##Frogging-Familly // NVIDIA
cd .tmp
git clone https://github.com/Frogging-Family/nvidia-all.git
	cd nvidia-all
	makepkg -si
cd ..

####Software Installer
##Natif
sudo pacman -Syyuu --noconfirm  base-devel flatpak snapd keepassxc steam latte-dock nextcloud-client kvantum zenity

##Flatpak
cd .tmp
git clone https://github.com/Chevek/Gaming-Flatpak.git
cd Gaming-Flatpak
sudo chmod+X gaming-flatpak.sh
./gaming-flatpak.sh
cd ..

##Snap
sudo snap install deckboard

# automatic installation - use this with care and only if you know what you're doing
# this question will answer every question pacman asks with the default answer - it may break your system
option_noconfirm="true"

##### end configuration #####
