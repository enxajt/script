#!/bin/zsh
zsh -c 'VOLUME='0'; for SINK in `pacmd list-sinks | grep 'index:' | cut -b12-`; do; pactl set-sink-volume $SINK $VOLUME; done';
pactl set-sink-mute 0 1
