#!/bin/bash

#使用中のエラーが出る場合は, clamav bundle clamav-freshclamが自動でupdateしてくれてる。
sudo freshclam --verbose

time sudo clamscan --verbose --infected --remove --recursive /
time sudo chkrootkit | grep INFECTED
