#!/bin/bash

echo
echo "#########################################################"
echo "This script will turn Debian 13 Cinnamon into Cinnaminty."
echo
echo "I got a fever and the only prescription is more mint!"
echo
echo "Press Enter to continue or Ctrl-c to cancel."
echo "#########################################################"
read input

if ! grep -q "13 (trixie)" /etc/os-release; then
	echo "This script is designed for Debian 13 Cinnamon. Exiting!"
	exit 1
fi

echo "#########################################################"
echo "Updating repo info"
echo "#########################################################"
echo
sudo apt update

echo
echo "#########################################################"
echo "Installing new packages"
echo "#########################################################"
echo
sudo apt -y install bibata-cursor-theme binutils btop chromium curl fastfetch git gimp golang gvfs-backends htop iperf3 keepassxc openvpn pdftk-java python-is-python3 vim wget xdotool

echo
echo "#########################################################"
echo "Removing unnecessary packages"
echo "#########################################################"
echo
sudo apt -y purge brasero firefox* thunderbird firefox* gnome-chess gnome-games goldendict-ng hexchat hoichess remmina thunderbird transmission*
sudo apt autoremove

echo
echo "#########################################################"
echo "Installing new themes"
echo "#########################################################"
MINTLIST="/etc/apt/sources.list.d/mint.list"
MINTKEY="linuxmint-keyring_2022.06.21_all.deb"
URL="http://packages.linuxmint.com/pool/main/l/linuxmint-keyring/$MINTKEY"
echo
echo "Temporarily adding the following repo:"
echo "deb http://packages.linuxmint.com virginia main" | sudo tee -a $MINTLIST
wget -q $URL
echo
sudo dpkg -i $MINTKEY
echo
sudo rm -f $MINTKEY
sudo apt update && sudo apt install mint-themes
echo
sudo rm -f $MINTLIST
sudo apt update
echo
sudo apt -y purge linuxmint-keyring

echo
echo "#########################################################"
echo "Installing all updates"
echo "#########################################################"
echo
sudo apt -y dist-upgrade

echo
echo "#########################################################"
echo "Installation complete!"
echo
echo "Press Enter to reboot or Ctrl-c to cancel."
echo "#########################################################"
read input
sudo reboot
