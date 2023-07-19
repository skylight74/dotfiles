#!/bin/fish
# This script is executed by the root user at startup.

hyprctl dispatch renameworkspace 1 General
hyprctl dispatch renameworkspace 10 SideScreen

prime-run keepassxc 2>/dev/null &
sleep 3

hyprctl dispatch workspace special

hyprctl dispatch "togglegroup"

prime-run thunderbird &
hyprctl dispatch workspace General

prime-run cachy-browser &
