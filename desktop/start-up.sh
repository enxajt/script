#!/bin/sh

setxkbmap -option "ctrl:swapcaps"
setxkbmap -option "swapcaps:ctrl"

# ~/.xbindkeysrc volume, backlight
xbindkeys

xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Synaptics Scrolling Distance' -119 -119

# Device Accel Velocity Scaling : speed
# Acceleration: small is fast
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Device Accel Constant Deceleration' 1.0

#sh ~/.dotfiles/always.sh &

#sudo tee brightness <<< 1

# https://ubuntuforums.org/showthread.php?t=1966900
#xrandr --newmode "1600x900_60.00" 118.25 1600 1696 1856 2112 900 903 908 934 -hsync +vsync
xrandr --output eDP1 --mode "1600x900"
#xrandr --output HDMI1 --pos 1600x0 --above eDP1
xrandr --output DP1 --pos 1600x0 --above eDP1
xrandr --output eDP2 --mode 1600x900 --pos 0x0 --rotate normal --output HDMI1 --mode 1920x1080 --rotate normal --above eDP1

redshift -O 2700
#redshift -x

# color is strange in tmux nvim
#gnome-terminal -e 'tmux -2'
#gnome-terminal
termite&

# for mate not i3
#wmctrl -r "termite" -b toggle,maximized_vert,maximized_horz
#wmctrl -r "Terminal" -b toggle,maximized_vert,maximized_horz
#wmctrl -r "Terminal" -e 0,0,0,900,1000
#wmctrl -r "Terminal" -e 0,0,0,1930,1100
#sh ~/.dotfiles/desktop/set-terminal.sh

firefox&
#wmctrl -r firefox -e 0,700,0,900,1300

# disable touchpad while typing
syndaemon -i 1 -d -t -K

# dropbox (duplication with ansible)
#dropbox lansync n
#dropbox start

# goldendict &
