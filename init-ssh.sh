#!/bin/sh

# Copy over private key, and set permissions
mkdir -p ~/.ssh/
ln -sf /vagrant/shared/id_rsa ~/.ssh/id_rsa
touch ~/.ssh/known_hosts

ssh-keyscan bitbucket.org >> ~/.ssh/known_hosts
[ ! -e ~/.private-config] && git clone git@bitbucket.org:enxajt/private-config.git ~/.private-config || echo already existing
sh ~/.private-config/git.sh
#sh ~/.private-config/user.sh
