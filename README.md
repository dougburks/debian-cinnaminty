# Overview
This is my own personal script for making Debian 13 Cinnamon a little more like Linux Mint. It is my opiniated take on a desktop environment that balances the ideals of productivity, efficiency, and beauty.

# Requirements
This script assumes the following requirements:
- Debian 13 Cinnamon
- user account with sudo privileges
- ability to connect to Github and package repos
  
# Warning
This script is totally unsupported. If it breaks your system, you get to keep both pieces!

# Installation
1. Download Debian 13 Cinnamon Live ISO image and install.
2. Reboot into your newly installed Debian 13 Cinnamon installation.
3. Download the script and review it (don't just blindly pipe it into bash):
```
curl -O https://raw.githubusercontent.com/dougburks/debian-cinnaminty/refs/heads/main/debian-cinnaminty.sh
```
4. Run the script:
```
bash debian-cinnaminty.sh
```
5. Enjoy your new Debian Cinnaminty desktop!

# FAQ

## Why not use Linux Mint or Linux Mint Debian Edition (LMDE)?

I want to be able to take Proxmox (or other Debian-based distros), add the Cinnamon desktop, and then use this script to make it more minty.

## But why though?

Because I can!

## Is this related to Security Onion?

No, this script is not really related to Security Onion. Debian-cinnaminty is intended to provide a general desktop environment. Of course, you could use the included Chromium web browser to connect to your Security Onion Console!
