#!/bin/sh

# -a なるべくコピー元のファイルと同一条件でコピー
# -h でファイルサイズの視認性をよくする。
# -r --recursive 指定ディレクトリ配下をすべて対象とする
# -v で詳細を出力
sudo rsync -ahrv /vagrant/shared/Notes /vagrant/Dropbox/ >> ~/.dotfiles/backup.log
sudo rsync -ahrv ~/.dotfiles /vagrant/shared/bak/ >> ~/.dotfiles/backup.log
sudo rsync -ahrv ~/.dotfiles /vagrant/shared/bak/ 
