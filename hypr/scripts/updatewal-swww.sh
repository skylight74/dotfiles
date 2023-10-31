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

DIR=$HOME/Pictures/wallpapers

# Fetch the Bing wallpaper
BING_URL="http://www.bing.com"
JSON_INFO=$(curl -s "$BING_URL/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US")
IMG_URL=$(echo $JSON_INFO | jq -r '.images[0].url')

# Generate a safe filename based on the current date
DATE=$(date +%Y%m%d)
IMG_NAME="bing_wallpaper_$DATE.jpg"

# echo "Downloading $BING_URL$IMG_URL to $WALLPAPER_DIR/$IMG_NAME"

wget -q "$BING_URL$IMG_URL" -O $DIR/$IMG_NAME
PICS=($(ls ${DIR}))


if [[ $(pidof swaybg) ]]; then
  pkill swaybg
fi

swww query || swww init
# ----------------------------------------------------- 
# Select random wallpaper and create color scheme
# ----------------------------------------------------- 
wal -q -i ~/Pictures/wallpapers/

# ----------------------------------------------------- 
# Load current pywal color scheme
# ----------------------------------------------------- 
source "$HOME/.cache/wal/colors.sh"

# ----------------------------------------------------- 
# Copy color file to waybar folder
# ----------------------------------------------------- 
cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/
cp ~/.cache/wal/colors.scss ~/.config/eww/
# ----------------------------------------------------- 
# get wallpaper iamge name
# ----------------------------------------------------- 
newwall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")

# ----------------------------------------------------- 
# Set the new wallpaper
# ----------------------------------------------------- 
swww img $wallpaper --transition-step 20 --transition-fps=20 \
  --transition-bezier .43,1.19,1,.4 \
  --transition-type random

~/.config/waybar/waybar.sh

# ----------------------------------------------------- 
# Send notification
# ----------------------------------------------------- 
notify-send "Theme and Wallpaper updated" "With image $newwall"


eww update
# eww kill
# prime-run eww open clock
echo "DONE!"
