#!/bin/sh

deb http://download.virtualbox.org/virtualbox/debian xenial contrib
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y virtualbox

wget https://releases.hashicorp.com/vagrant/1.9.5/vagrant_1.9.5_x86_64.deb
sudo dpkg --install vagrant_1.9.5_x86_64.deb
