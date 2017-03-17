#!/bin/sh

# prepare

# delete old vim
sudo apt-get -y remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
sudo rm -rf /usr/local/share/vim /usr/bin/vim
#sudo apt-get install checkinstall

# install languages for vim
sudo apt-get upgrade
sudo apt-get update
sudo apt-get install -y build-dep vim
sudo apt-get install -y lua5.2 liblua5.2-dev luajit libluajit-5.1 python-dev python3-dev python-pip python3-pip ruby-dev libperl-dev libncurses5-dev libatk1.0-dev libx11-dev libxpm-dev libxt-dev

# install vim
cd ~/.cache && git clone --depth 1 https://github.com/vim/vim.git && cd ./vim/src
/configure --prefix=/usr/local \
--with-features=huge \
--enable-multibyte \
--enable-perlinterp \
--enable-pythoninterp \
--enable-python3interp \
--enable-rubyinterp \
--enable-luainterp \
--disable-gui \
--with-luajit \
--without-x \
--enable-fail-if-missing
make && sudo make install
ln -s /vagrant/shared/vim/swp /home/enxajt/.vim/
ln -s /vagrant/shared/vim/backup /home/enxajt/.vim/
ln -s /vagrant/shared/vim/undo /home/enxajt/.vim/

# install dein.vim
pip install --upgrade pip
pip3 install --upgrade pip
mkdir -p /home/enxajt/.cache/dein
cd /home/enxajt/.cache/dein
curl -f https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh /home/enxajt/.cache/dein

# .vim
git clone https://github.com/enxajt/.vim.git
ln -nfs /vagrant/shared/vim/backup ~/.vim/backup
ln -nfs /vagrant/shared/vim/swp ~/.vim/swp
ln -nfs /vagrant/shared/vim/undo ~/.vim/undo
git remote set-url origin git@github.com:enxajt/.vim.git
