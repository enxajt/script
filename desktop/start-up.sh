#!/bin/sh

gnome-terminal
wmctrl -r "Terminal" -b toggle,maximized_vert,maximized_horz
#wmctrl -r "Terminal" -e 0,0,0,900,1000
sh ~/dotfiles/set-terminal.sh

firefox &
wmctrl -r firefox -e 0,1000,0,900,1000

# dropbox (duplication with ansible)
dropbox lansync n
dropbox autostart y
dropbox start
