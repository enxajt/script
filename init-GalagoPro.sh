#!/bin/sh
setxkbmap -option "ctrl:swapcaps"
sed -ie 's/TimeoutStartSec=5min/TimeoutStartSec=5sec/g' /etc/systemd/system/network-online.target.wants/networking.service
chsh -s /bin/zsh
