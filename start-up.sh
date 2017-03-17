#!/bin/sh
gnome-terminal
wmctrl -r "Terminal" -e 0,0,0,900,1000
#gconftool-2 --type string --set /desktop/gnome/applications/terminal/exec 'gnome-terminal --geometry=120x40'
firefox
wmctrl -r firefox -e 0,1000,0,900,1000
