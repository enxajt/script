#!/bin/sh

setxkbmap -option "ctrl:swapcaps"

redshift -O 3600
#redshift -x

gnome-terminal
wmctrl -r "Terminal" -b toggle,maximized_vert,maximized_horz
#wmctrl -r "Terminal" -e 0,0,0,900,1000
sh ~/.dotfiles/desktop/set-terminal.sh

firefox &
wmctrl -r firefox -e 0,700,0,900,1300

# dropbox (duplication with ansible)
dropbox lansync n
dropbox start

# goldendict &

sh ~/.dotfiles/always.sh &
