#!/bin/sh

# Copy over private key, and set permissions
mkdir -p ~/.ssh/
ln -sf /vagrant/shared/.ssh/id_rsa ~/.ssh/id_rsa
ln -sf /vagrant/shared/.ssh/known_hosts ~/.ssh/known_hosts
[ -e .ssh/config ] && mv .ssh/config .ssh/config.bak
cp /vagrant/shared/.ssh/config_linux .ssh/config

ssh-keyscan bitbucket.org >> ~/.ssh/known_hosts
#[ ! -e ~/.private-config ] && git clone git@bitbucket.org:enxajt/private-config.git ~/.private-config || echo already existing
[ -e ~/.private-config ] && mv ~/.private-config ~/.private-config.bak
ln -s /vagrant/shared/.private-config ~/.private-config
sh ~/.private-config/git.sh
#sh ~/.private-config/user.sh
