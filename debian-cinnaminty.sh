#!/bin/bash

clear
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

clear

echo "#########################################################"
echo "First, we need some more color!"
echo "#########################################################"
echo
sudo apt update
sudo apt -y install python3-terminaltexteffects

echo
cat << EOF | tte slide --merge
#########################################################
That's better! Now let's install some new packages
#########################################################
EOF
echo
sudo apt update
sudo apt -y install bibata-cursor-theme binutils btop chromium curl git gimp golang gvfs-backends htop iperf3 keepassxc openvpn pdftk-java python-is-python3 python3-terminaltexteffects screenfetch vim wget xdotool

echo
cat << EOF | tte slide --merge
#########################################################
Removing unnecessary packages
#########################################################
EOF
echo
sudo apt -y purge brasero firefox* thunderbird firefox* gnome-chess gnome-games goldendict-ng hexchat hoichess remmina thunderbird transmission*
sudo apt autoremove

echo
cat << EOF | tte slide --merge
#########################################################
Installing new themes
#########################################################
EOF
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
cat << EOF | tte slide --merge
#########################################################
Installing all updates
#########################################################
EOF
echo
sudo apt -y dist-upgrade

echo
cat << EOF | tte slide --merge
#########################################################
Installation complete!
#########################################################
EOF

echo
screenfetch -N | tte slide --merge

cat << EOF | tte slide --merge
#########################################################
Press Enter to reboot or Ctrl-c to cancel.
#########################################################
EOF
read input
sudo reboot
