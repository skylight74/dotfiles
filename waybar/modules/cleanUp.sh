#!/bin/bash

# this script will clean up the cache and log files in addition to 
# running a btrfs balance and scrub to the system

cacheDir=["/var/cache", "/var/log", "/var/tmp", "~/.cache", "~/.thumbnails", "~/.local/share/Trash"]


# clean up the cache and log files
for i in "${cacheDir[@]}"
do
    echo "Cleaning up $i"
    rm -rf $i/*
done


# run a btrfs balance and scrub
#
# scrub
#
# scrub status
btrfs scrub start /
