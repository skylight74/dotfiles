#!/bin/fish
# This script is executed by the root user at startup.

# hyprctl dispatch renameworkspace 1 General
# hyprctl dispatch renameworkspace 10 SideScreen

prime-run keepassxc 2>/dev/null &
sleep 3

hyprctl dispatch togglespecialworkspace

hyprctl dispatch "togglegroup"

prime-run thunderbird &

# sleep 3
hyprctl dispatch togglespecialworkspace
hyprctl distpatch workspace 1

# sleep 3
prime-run cachy-browser 
