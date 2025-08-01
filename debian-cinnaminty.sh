#!/bin/bash

clear
cat << EOF
#########################################################
This script will turn Debian 13 Cinnamon into Cinnaminty.

Now with more minty freshness!

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
First, this terminal needs more color!
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
sudo DEBIAN_FRONTEND=noninteractive apt -y install bibata-cursor-theme binutils btop chromium curl git gimp golang gvfs-backends htop iperf3 keepassxc openvpn pdftk-java python-is-python3 screenfetch vim wget xdotool

echo
cat << EOF | tte print
#########################################################
Removing unnecessary packages
#########################################################
EOF
echo
sudo apt -y purge brasero firefox* thunderbird firefox* gnome-chess gnome-games goldendict-ng hexchat hoichess pidgin remmina thunderbird transmission*
sudo apt -y autoremove

echo
cat << EOF | tte print
#########################################################
Installing new themes
#########################################################
EOF
MINTLIST="/etc/apt/sources.list.d/mint.list"
MINTKEY="linuxmint-keyring_2022.06.21_all.deb"
MINTURL="http://packages.linuxmint.com/pool/main/l/linuxmint-keyring/$MINTKEY"
echo
echo "Temporarily adding the following repo:"
echo "deb http://packages.linuxmint.com virginia main" | sudo tee -a $MINTLIST
wget -q $MINTURL
echo
sudo dpkg -i $MINTKEY
echo
sudo rm -f $MINTKEY
sudo apt update && sudo apt -y install mint-themes
echo
sudo rm -f $MINTLIST
sudo apt update
echo
sudo apt -y purge linuxmint-keyring

echo
cat << EOF | tte print
#########################################################
Setting Cinnamon theme
#########################################################
EOF
dconf write /org/cinnamon/theme/name "'Mint-Y-Dark-Aqua'"

echo
cat << EOF | tte print
#########################################################
Setting cursor theme
#########################################################
EOF
dconf write /org/cinnamon/desktop/interface/cursor-theme "'Bibata-Modern-Classic'"

echo
cat << EOF | tte print
#########################################################
Setting GTK theme
#########################################################
EOF
dconf write /org/cinnamon/desktop/interface/gtk-theme "'Mint-Y-Dark-Aqua'"

echo
cat << EOF | tte print
#########################################################
Setting icon theme
#########################################################
EOF
dconf write /org/cinnamon/desktop/interface/icon-theme "'Mint-Y-Sand'"

echo
cat << EOF | tte print
#########################################################
Setting wallpaper
#########################################################
EOF
dconf write /org/cinnamon/desktop/background/picture-uri "'file:///usr/share/backgrounds/gnome/sheet-l.jxl'"

echo
cat << EOF | tte print
#########################################################
Setting alttab switcher style
#########################################################
EOF
dconf write /org/cinnamon/alttab-switcher-style "'coverflow'"

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
