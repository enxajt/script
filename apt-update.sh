#!/bin/sh

sudo apt update 

echo "\n" 
sudo apt upgrade -y 

echo "\n" 
sudo apt autoremove -y

echo "\n" 
sudo apt dist-upgrade
