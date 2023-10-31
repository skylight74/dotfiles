#!/usr/bin/env bash

# Set the path to the directory containing the wallpapers
DIR="$HOME/Pictures/wallpapers"

# check if the gswww process is running if its running then exit
# else start the process

if pgrep -x "gswww" > /dev/null
then
    pkill gswww
else
  # just start gswww
   coproc (gswww)
fi
