#!/bin/bash

clear
cat << EOF
#########################################################
This script will turn Debian 13 Cinnamon into Cinnaminty.

I got a fever and the only prescription is more mint!

Press Enter to continue or Ctrl-c to cancel.
#########################################################
EOF
read input

if ! grep -q "13 (trixie)" /etc/os-release; then
	echo "This script is designed for Debian 13 Cinnamon. Exiting!"
	exit 1
fi

clear

cat << EOF
#########################################################
First, we need some more color!
#########################################################
EOF
echo
sudo apt update
sudo apt -y install python3-terminaltexteffects

echo
cat << EOF | tte print
#########################################################
That's better! Now let's install some new packages
#########################################################
EOF
echo
sudo apt update
sudo apt -y install bibata-cursor-theme binutils btop chromium curl git gimp golang gvfs-backends htop iperf3 keepassxc openvpn pdftk-java python-is-python3 python3-terminaltexteffects screenfetch vim wget xdotool

echo
cat << EOF | tte print
#########################################################
Removing unnecessary packages
#########################################################
EOF
echo
sudo apt -y purge brasero firefox* thunderbird firefox* gnome-chess gnome-games goldendict-ng hexchat hoichess remmina thunderbird transmission*
sudo apt autoremove

echo
cat << EOF | tte print
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
dconf write /org/gnome/desktop/interface/cursor-theme "'Bibata-Modern-Classic'"
dconf write /org/gnome/desktop/interface/gtk-theme "'Mint-Y-Dark-Aqua'"
dconf write /org/gnome/desktop/interface/icon-theme "'Mint-Y-Sand'"
dconf write /org/cinnamon/theme/name "'Mint-Y-Dark-Aqua'"

echo
cat << EOF | tte print
#########################################################
Installing all updates
#########################################################
EOF
echo
sudo apt -y dist-upgrade

echo
cat << EOF | tte print
#########################################################
Installation complete!
#########################################################
EOF

echo
screenfetch -N | tte slide --merge
echo

cat << EOF | tte print
#########################################################
Press Enter to reboot or Ctrl-c to cancel.
#########################################################
EOF
read input
sudo reboot
