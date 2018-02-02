#!/bin/bash
sudo freshclam --verbose
time sudo clamscan --verbose --infected --remove --recursive /
time sudo chkrootkit | grep INFECTED
