#!/bin/bash

while true
do
  sudo ./backup.sh
  sleep 300 # 5minutes
done


# sudo clamscan --verbose --infected --remove --recursive /
# sudo chkrootkit | grep INFECTED
