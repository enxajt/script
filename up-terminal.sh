#!/bin/sh
gnome-terminal --geometry 100*100
wmctrl -r "Terminal" -e 0,0,0,800,1200
#gconftool-2 --type string --set /desktop/gnome/applications/terminal/exec 'gnome-terminal --geometry=120x40'
"Mozilla Firefox" --geometry 100*100
wmctrl -r "Mozilla Firefox" -e 0,1100,0,720,920
