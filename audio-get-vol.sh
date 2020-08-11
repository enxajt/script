#!/bin/bash
volume="$(pacmd list-sinks | grep -m 1 'volume: front-left:' | cut -f 2 -d / | tr -d ' \t%')"
#bth=`hcitool con | grep 00:87:63:11:19:1D`
bth=`hcitool con | grep -E '00:87:63:11:19:1D|36:00:AB:CD:3B:48|CB:20:06:00:A4:9D'`

if [ -z "$bth" ]
then
  #emoji='🔇' #mute
  emoji='🔈' #low-volume
  status="speaker"
else
  emoji="🎧"
  status="headphones"
fi

if [ $volume -gt 0 ] && [ $status == "speaker" ]
then
  emoji="🔊"
  foreground='#000000'
  background='#BB0000'
else
  foreground='#999999'
  background='#000000'
fi

# Full and short texts
text="<span foreground='$foreground' background='$background'><b>""$emoji$volume""</b></span>"
echo "$text"
echo "$text"

#[ ${volume?} -gt 10 ] && exit 33
exit 0
