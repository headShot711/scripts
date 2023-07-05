#!/bin/sh

wall=$(find ~/walls/ -type f -name "*.jpg" -o -name "*.png" | shuf -n 1)

# add this as background wallpaper
xwallpaper --zoom $wall

# generate color scheme
wal -c
wal -i $wall

xdotool key super+F5
