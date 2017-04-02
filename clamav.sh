sudo apt-get -y install clamav
sudo sed -i -e "s/^NotifyClamd/#NotifyClamd/g" /etc/clamav/freshclam.conf
sudo freshclam 
sudo clamscan --infected --remove --recursive /

# お試し無害ウィルスをダウンロード
sudo wget http://www.eicar.org/download/eicar.com
sudo clamscan --infected --remove --recursive ./ 
