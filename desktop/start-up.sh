#!/bin/sh

# background
convert -size 500x500 xc:black ~/.black.jpg
export DISPLAY=:0.0
gsettings set org.mate.background picture-filename ~/.black.jpg
sleep 1 && rm ~/black.jpg
# /usr/share/lightdm/lightdm-gtk-greeter.conf.d/01_ubuntu.conf 

# desktop icon
gsettings set org.mate.caja.desktop home-icon-visible false
gsettings set org.mate.caja.desktop volumes-visible false

gnome-terminal
wmctrl -r "Terminal" -b toggle,maximized_vert,maximized_horz
#wmctrl -r "Terminal" -e 0,0,0,900,1000
sh ~/.dotfiles/desktop/set-terminal.sh

firefox &
wmctrl -r firefox -e 0,1000,0,900,1000

# dropbox (duplication with ansible)
dropbox lansync n
dropbox autostart y
dropbox start

goldendict &
