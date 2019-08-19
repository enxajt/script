#!/bin/bash
volume="$(pacmd list-sinks | grep -m 1 'volume: front-left:' | cut -f 2 -d / | tr -d ' \t%')"
bth=`hcitool con | grep 00:87:63:11:19:1D`

if [ -z "$bth" ]
then
  foreground='#DD0000'
  background='#003300'
  status="NC_BTH"
else
  foreground='#c0c5ce'
  background='#000000'
  status="HBQ-Q13S"
fi

if [ $volume -gt 20 ]
then
foreground='#000000'
background='#FF0000'
elif [ $volume -gt 10 ]
then
foreground='#000000'
background='#BB0000'
elif [ $volume -gt 0 ]
then
foreground='#c0c5ce'
background='#660000'
else
foreground='#c0c5ce'
background='#000000'
fi

text="<span foreground='$foreground' background='$background'><b>""🔊$volume""</b></span>"

# Full and short texts
echo "$text"
echo "$text"

#[ ${volume?} -gt 10 ] && exit 33
exit 0
