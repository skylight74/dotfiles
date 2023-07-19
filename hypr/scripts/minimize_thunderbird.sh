# this script will minimize thunderbird for hyprland

# get the window id
WID=$(xdotool search --onlyvisible --class thunderbird)

# get the window state

STATE=$(xprop -id $WID | grep "_NET_WM_STATE(ATOM)" | grep "_NET_WM_STATE_MAXIMIZED_VERT" | grep "_NET_WM_STATE_MAXIMIZED_HORZ")

# if the window is maximized, then unmaximize it
# otherwise, minimize it

if [ -z "$STATE" ]; then
    xdotool windowminimize $WID
else
    xdotool windowunmaximize $WID
fi

exit 0
```
