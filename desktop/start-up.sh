#!/bin/sh

setxkbmap -option "ctrl:swapcaps"

#sudo tee brightness <<< 1

# resolution
# https://ubuntuforums.org/showthread.php?t=1966900
xrandr --newmode "1600x900_60.00" 118.25 1600 1696 1856 2112 900 903 908 934 -hsync +vsync
xrandr --addmode eDP-1 "1600x900_60.00"
xrandr --output eDP-1 --mode "1600x900_60.00" 
#rm $HOME/.config/monitors.xml

#redshift -O 3000
redshift -O 2500
#redshift -x

# color is strange in tmux nvim
#gnome-terminal -e 'tmux -2'
gnome-terminal

wmctrl -r "Terminal" -b toggle,maximized_vert,maximized_horz
#wmctrl -r "Terminal" -e 0,0,0,900,1000
#wmctrl -r "Terminal" -e 0,0,0,1930,1100
sh ~/.dotfiles/desktop/set-terminal.sh

firefox &
wmctrl -r firefox -e 0,700,0,900,1300

# dropbox (duplication with ansible)
dropbox lansync n
dropbox start

# goldendict &

sh ~/.dotfiles/always.sh &
