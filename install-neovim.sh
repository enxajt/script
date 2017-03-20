#!/bin/sh

# delete old vim
sudo apt-get -y remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
sudo rm -rf /usr/local/share/vim /usr/bin/vim
#sudo apt-get install checkinstall

# NeoVim
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim

# それぞれの言語の拡張 vim用
sudo apt-get update && sudo apt-get install -y \
  python3-dev python3-pip \
  python-dev python-pip \
  libperl-dev \
  ruby-dev \
  lua5.2 liblua5.2-dev  \
  luajit libluajit-5.1
sudo --set-home pip install --upgrade pip
sudo --set-home pip3 install --upgrade pip3
sudo --set-home pip3 install neovim

sudo apt autoremove -y

# .vim
#[ ! -e ~/.vim ] && git clone https://github.com/enxajt/.vim.git ~/.vim || echo already existing
#cd ~/.vim && git remote set-url origin git@github.com:enxajt/.vim.git
#ln -sf /vagrant/shared/vim/backup ~/.vim/
#ln -sf /vagrant/shared/vim/swp ~/.vim/
#ln -sf /vagrant/shared/vim/undo ~/.vim/
ln -s /vagrant/shared/.vim ~/
mkdir -p ~/.config/nvim 
ln -sf ~/.vim/vimrc ~/.config/nvim/init.vim

# install dein.vim
mkdir -p ~/.cache/dein
sudo chmod 777 -R ~/.cache
cd ~/.cache/dein \
  && curl -f https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh \
  && sh ./installer.sh ~/.cache/dein
nvim +":silent call dein#install()" +:q
nvim +":silent UpdateRemotePlugins" +:q
#RUN nvim -E -u NONE -S > /dev/null
