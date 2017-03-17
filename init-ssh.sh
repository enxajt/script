#!/bin/sh

# Copy over private key, and set permissions
mkdir -p ~/.ssh/
ln -sf /vagrant/shared/id_rsa ~/.ssh/id_rsa
touch ~/.ssh/known_hosts

ssh-keyscan bitbucket.org >> ~/.ssh/known_hosts
[ ! -e ~/.confi/vimfx ~/.config/private-config] && git clone git@bitbucket.org:enxajt/private-config.git ~/.config/private-config
sh ~/.config/private-config/git.sh
#sh ~/.config/private-config/user.sh
