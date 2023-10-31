#!/bin/bash
#  _____ _                           ______        ____        ____        __ 
# |_   _| |__   ___ _ __ ___   ___  / ___\ \      / /\ \      / /\ \      / / 
#   | | | '_ \ / _ \ '_ ` _ \ / _ \ \___ \\ \ /\ / /  \ \ /\ / /  \ \ /\ / /  
#   | | | | | |  __/ | | | | |  __/  ___) |\ V  V /    \ V  V /    \ V  V /   
#   |_| |_| |_|\___|_| |_| |_|\___| |____/  \_/\_/      \_/\_/      \_/\_/    
#                                                                             
#  
# by Stephan Raabe (2023) 
# ----------------------------------------------------- 


swww query || swww init
# ----------------------------------------------------- 
# Select random wallpaper and create color scheme
# ----------------------------------------------------- 

wal -q -i Pictures/wallpapers/6069078.jpg


sleep 5
# ----------------------------------------------------- 
# Load current pywal color scheme
# ----------------------------------------------------- 
source "$HOME/.cache/wal/colors.sh"
wallpaper=~/Pictures/wallpapers/6069078.jpg

# ----------------------------------------------------- 
# Copy color file to waybar folder
# ----------------------------------------------------- 
cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/
cp ~/.cache/wal/colors.scss ~/.config/eww/
# ----------------------------------------------------- 
# get wallpaper iamge name
# ----------------------------------------------------- 
newwall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")
echo $newwall
# ----------------------------------------------------- 
# Set the new wallpaper
# ----------------------------------------------------- 
prime-run swww img $wallpaper --transition-step 20 --transition-fps=20 \
  --transition-bezier .43,1.19,1,.4 \
  --transition-type random

prime-run ~/.config/waybar/waybar.sh

# ----------------------------------------------------- 
# Send notification
# ----------------------------------------------------- 
notify-send "Theme and Wallpaper Started" "With image $newwall"


prime-run eww open clock
# eww kill
# prime-run eww open clock
echo "DONE!"
