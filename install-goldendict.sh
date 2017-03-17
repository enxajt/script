#!/bin/sh

# 英辞郎をgoldendict/stardictで読める形式に変換
# http://takoshi.com/archives/266
#sudo apt-get install stardict
# ftp.br.debian.org/debian から stardict-tools 2.4.8 をダウンロード
#cd stardict-tools_2.4.8-0.1_amd64.deb
#sudo ./configure
#sudo make
#sudo make install
#cat EIJI-141.TXT | nkf -Lu -w8 | ruby ./install-goldendict_pdic1line2tab.rb > EIJI-141.tab
#/usr/lib/stardict-tools/tabfile EIJI-141.tab
#WAEI-141.TXT, REIJI141.TXT, RYAKU141.TXT についても
#sudo mv *.dict.dz *.idx *.ifo /usr/share/stardict/dic/

sudo apt-get install -y goldendict
