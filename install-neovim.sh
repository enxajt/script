#!/bin/sh

# delete old vim
sudo apt-get -y remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
sudo rm -rf /usr/local/share/vim /usr/bin/vim
#sudo apt-get install checkinstall

# それぞれの言語の拡張 vim用
sudo apt-get update && apt-get install -y \
  libperl-dev \
  python-dev python3-dev  \
  python-pip \
  python3-pip \
  ruby-dev \
  lua5.2 liblua5.2-dev  \
  luajit libluajit-5.1
sudo pip install --upgrade pip
sudo pip3 install --upgrade pip
sudo pip3 install neovim

# NeoVim
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim

# .vim
[ ! -e ~/.vim ] && git clone https://github.com/enxajt/.vim.git ~/.vim || echo already existing
cd ~/.vim && git remote set-url origin git@github.com:enxajt/.vim.git
ln -sf /vagrant/shared/vim/swp ~/.vim/
ln -sf /vagrant/shared/vim/backup ~/.vim/
ln -sf /vagrant/shared/vim/undo ~/.vim/

# https://github.com/enxajt/nvim.git ~/.config/nvim || echo already existing

# install dein.vim
mkdir -p ~/.cache/dein
cd ~/.cache/dein \
  && curl -f https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh \
  && sh ./installer.sh ~/.cache/dein
nvim +":silent call dein#install()" +:q
nvim +":silent UpdateRemotePlugins" +:q
#RUN nvim -E -u NONE -S > /dev/null
