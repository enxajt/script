#!/usr/bin/env bash

echo "wifi"
echo -n "SSID: "
read -r ssid
echo -n "PSK: "
read -r psk

nmcli c add type wifi con-name $ssid ifname wlp2s0 ssid $ssid
nmcli c modify $ssid wifi-sec.key-mgmt wpa-psk wifi-sec.psk $psk
nmcli c up $ssid
