#!/bin/sh

# -a なるべくコピー元のファイルと同一条件でコピー
# -h でファイルサイズの視認性をよくする。
# -r --recursive 指定ディレクトリ配下をすべて対象とする
# -v で詳細を出力
# -z 圧縮して転送


#echo '\n\n --------------------- start backup.sh ' >> ~/.dotfiles/backup.log
#timedatectl >> ~/.dotfiles/backup.log
#sudo rsync -ahrv /vagrant/shared/Notes /vagrant/Dropbox/ >> ~/.dotfiles/backup.log
#sudo rsync -ahrv ~/.dotfiles /vagrant/shared/bak/ >> ~/.dotfiles/backup.log
#sudo rsync -ahrv ~/.dotfiles /vagrant/shared/bak/ 
#sudo rsync -ahrv ~/.vim /vagrant/shared/bak/ >> /vagrant/shared/bak/.vim/backup.log

echo '\n\n --------------------- start backup.sh ' 2>&1 | tee /media/enxajt/5b3636ab-a21c-41fd-9318-bcee2c17e8b4/gal-ubuntu-server.bak/rsync.log
timedatectl 2>&1 | tee /media/enxajt/5b3636ab-a21c-41fd-9318-bcee2c17e8b4/gal-ubuntu-server.bak/rsync.log
sudo rsync -ahrv /home/enxajt /media/enxajt/5b3636ab-a21c-41fd-9318-bcee2c17e8b4/gal-ubuntu-server.bak/enxajt 2>&1 | tee /media/enxajt/5b3636ab-a21c-41fd-9318-bcee2c17e8b4/gal-ubuntu-server.bak/rsync.log
