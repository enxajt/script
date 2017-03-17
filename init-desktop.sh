#!/bin/sh

# background
convert -size 500x500 xc:black ~/black.jpg
export DISPLAY=:0.0
gsettings set org.mate.background picture-filename ~/black.jpg

# desktop icon
gsettings set org.mate.caja.desktop home-icon-visible false
gsettings set org.mate.caja.desktop volumes-visible false

# firefox vimfx
[ ! -e ~/.vimfx ] && git clone https://github.com/enxajt/vimfx.git ~/.vimfx || echo already existing
#sudo chmod 777 -R ~/.vimfx
