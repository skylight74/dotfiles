#!/usr/bin/env sh

# Terminate already running bar instances
killall -q waybar
pkill -9 -f "/home/mohamed/.config/waybar/modules/mediaplayer.py"

# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done

# Launch main
prime-run waybar -s ~/.config/waybar/style.css -c ~/.config/waybar/config-hypr-hdmiA1 &
prime-run waybar -s ~/.config/waybar/style.css -c ~/.config/waybar/config-hypr-edp1 1>/dev/null 2>/dev/null &
