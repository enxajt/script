#!/bin/sh

# -a なるべくコピー元のファイルと同一条件でコピー
# -h でファイルサイズの視認性をよくする。
# -r --recursive 指定ディレクトリ配下をすべて対象とする
# -v で詳細を出力
# -z 圧縮して転送


echo '\n\n --------------------- start backup.sh ' >> ~/.dotfiles/backup.log
timedatectl >> ~/.dotfiles/backup.log

sudo rsync -ahrv /vagrant/shared/Notes /vagrant/Dropbox/ >> ~/.dotfiles/backup.log
sudo rsync -ahrv ~/.dotfiles /vagrant/shared/bak/ >> ~/.dotfiles/backup.log
sudo rsync -ahrv ~/.dotfiles /vagrant/shared/bak/ 

sudo rsync -ahrv ~/.vim /vagrant/shared/bak/ >> /vagrant/shared/bak/.vim/backup.log
