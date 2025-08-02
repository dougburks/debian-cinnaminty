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
1. In your Debian 13 Cinnamon desktop, download the script and review it (don't just blindly pipe it into bash):
```
curl -O https://raw.githubusercontent.com/dougburks/debian-cinnaminty/refs/heads/main/debian-cinnaminty.sh
```
2. Run the script:
```
bash debian-cinnaminty.sh
```
3. Enjoy your new Debian Cinnaminty desktop!

# FAQ

## Why not use Linux Mint or Linux Mint Debian Edition (LMDE)?

I want to be able to take Debian 13 derivatives (like Proxmox 9), add the Cinnamon desktop, and then use this script to make it more minty.

## But why though?

Because I can!

## Is this related to Security Onion?

No, this script is not really related to Security Onion. Debian-cinnaminty is intended to provide a general desktop environment. Of course, you could use the included Chromium web browser to connect to your Security Onion Console!
