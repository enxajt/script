#!/bin/sh
link=/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9

dconf write $link/use-transparent-background false
#dconf write $link/use-transparent-background true
#dconf write $link/background-transparency-percent '20'
#dconf write $link/background-transparency-percent '5'

#dconf write $link/cursor-shape 'ibeam'
