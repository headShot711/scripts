#!/bin/sh

# Make directories
cd
mkdir -v walls
mkdir -v ~/.config
mkdir -v ~/.config/i3
mkdir -v ~/.config/alacritty

#Add parallel downloading
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf

# Packages to install from Arch Linux official repos

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm --needed xorg-server xorg-xinit xorg-apps go lxappearance nitrogen picom curl base-devel mtools dosfstools exfat-utils linux-headers gvfs gvfs-mtp ntfs-3g vim htop neofetch tlp lm_sensors yt-dlp dunst xclip unzip p7zip bluez bluez-utils blueman networkmanager network-manager-applet dhcpcd wpa_supplicant xdg-utils xdg-user-dirs alsa-utils ranger leafpad ttf-liberation ttf-font-awesome scrot mpv thunar feh alacritty firefox vim polkit-gnome qbittorrent libvirt qemu-full iptables-nft dnsmasq virt-manager qemu-arch-extra ovmf vde2 ebtables bridge-utils openbsd-netcat

# Install XFCE
#sudo pacman -S --noconfirm --needed xfce4

# Install yay
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install yay packages
cd
yay -S --noconfirm ly

# Copy config files
cd
sudo cp -rv ~/dotfiles/i3/* ~/.config/i3/
sudo cp -rv ~/dotfiles/alacritty/* ~/.config/alacritty/
sudo cp -rv ~/dotfiles/polybar/* ~/.config/polybar/
sudo cp -rv ~/dotfiles/walls/* ~/walls/
sudo chmod +x ~/.config/polybar/launch.sh

# Enable services
sudo systemctl enable bluetooth.service
sudo systemctl enable libvirtd.service
sudo systemctl enable ly.service

# Most important command! Get rid of the beep!
sudo -i
rmmod pcspkr
echo "blacklist pcspkr" >/etc/modprobe.d/nobeep.conf

echo "Installation completed. Reboot system"
printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
