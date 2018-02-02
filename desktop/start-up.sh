#!/bin/sh

setxkbmap -option "ctrl:swapcaps"
setxkbmap -option "swapcaps:ctrl"

# ~/.xbindkeysrc volume, backlight
xbindkeys
# Device Accel Velocity Scaling : speed
# Acceleration: small is fast
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Device Accel Constant Deceleration' 1.0
# Natural scrolling
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Synaptics Scrolling Distance' -119 -119
# Horizontal scrolling
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Synaptics Two-Finger Scrolling' 1 1
# Disable touchpad while typing
syndaemon -i 1 -d -t -K

# https://ubuntuforums.org/showthread.php?t=1966900
#xrandr --output eDP1 --mode "1600x900"
#xrandr --output DP1 --pos 1600x0 --above eDP1
xrandr --output eDP1 --mode "1600x900" --output DP1 --auto --above eDP1 # VGA@KRC
xrandr --output eDP2 --mode 1600x900 --pos 0x0 --rotate normal --output HDMI1 --mode 1920x1080 --rotate normal --above eDP1

redshift -O 3200
termite -e 'tmux -2' &
firefox&
dropbox lansync n
dropbox start
#sh ~/.dotfiles/always.sh &
#sudo tee brightness <<< 1

# for mate not i3
#wmctrl -r "termite" -b toggle,maximized_vert,maximized_horz
#wmctrl -r "Terminal" -b toggle,maximized_vert,maximized_horz
#wmctrl -r "Terminal" -e 0,0,0,900,1000
#wmctrl -r "Terminal" -e 0,0,0,1930,1100
#sh ~/.dotfiles/desktop/set-terminal.sh
