#!/usr/bin/env bash

# Xorg
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput

# Build-essential.
sudo apt install -y build-essential

# Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update

# i3 WM
sudo apt install -y i3-wm suckless-tools sxhkd

# Network File Tools/System Events
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends xfce4-power-manager
sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# Networking
sudo apt install -y policykit-1-gnome network-manager network-manager-gnome

# Pcmanfm
sudo apt install -y pcmanfm

# Terminal (eg. terminator,kitty,xcfe4-terminal)
sudo apt install -y rxvt-unicode xterm

# Sound packages
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa pamixer

# Appearance
sudo apt install -y lxappearance 

# Browsers
sudo apt install -y firefox-esr 

# Desktop background browser/handler 
# feh --bg-fill /path/to/directory 
# sudo apt install -y nitrogen 
sudo apt install -y feh
 
# Fonts and icons for now
sudo apt install -y fonts-recommended fonts-ubuntu fonts-font-awesome fonts-terminus

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls='exa -al --long --header --color=always --group-directories-first' 
sudo apt install -y exa

# Bluetooth
sudo apt install -y bluez blueman
sudo systemctl enable bluetooth

# Packages needed for window manager installation
sudo apt install -y picom rofi dunst libnotify-bin unzip 

# tools
sudo apt install -y geany l3afpad scrot evince transmission-gtk gimp mkvtoolnix-gui
sudo apt install -y vim neofetch htop mpv vlc qimgv galculator redshift cpu-x

# Install Lightdm Console Display Manager
sudo apt install -y lightdm lightdm-gtk-greeter-settings
sudo systemctl enable lightdm

# Copy config files
cd ~Downloads
git clone https://github.com/headShot711/dotfiles
\cp -r ~/Downloads/dotfiles/.config/dunst/ ~/.config/
\cp -r ~/Downloads/dotfiles/.config/i3/ ~/.config/
\cp -r ~/Downloads/dotfiles/.config/picom/ ~/.config/
\cp -r ~/Downloads/dotfiles/.config/polybar/ ~/.config/
\cp -r ~/Downloads/dotfiles/.config/sxhkd/ ~/.config/
\cp -r ~/Downloads/dotfiles/.config/rofi/ ~/.config/

sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
