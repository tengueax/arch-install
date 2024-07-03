#!/bin/sh

USERNAME="tengueax"

# First and foremost - networking
systemctl enable NetworkManager.service
systemctl start NetworkManager.service

# Regular user account
useradd -mg users -G wheel "$USERNAME"
passwd "$USERNAME"

# AMD GPU drivers
pacman -S mesa lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau

# Yay (AUR)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Essential fonts
yay -S noto-fonts noto-fonts-cjk adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts ttf-font-awesome ttf-material-design-icons ttf-agave-nerd ttf-dejavu

# ZSH
yay -S zsh
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Essential packages
yay -S xorg-xserver xorg-xinit pulseaudio pamixer pavucontrol python 3.12.4-1

# Le desktop
yay -S qtile polybar picom dunst rofi pywal-git nitrogen lxappearance pcmanfm ranger ueberzugpp

# Basic apps
yay -S alacritty flameshot ungoogled-chromium-bin telegram-desktop-bin
