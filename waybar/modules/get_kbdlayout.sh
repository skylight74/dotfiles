#!/usr/bin/env sh

# List of keyboard names
keyboards=("by-tech-gaming-kb" "compx-2.4g-wireless-receiver" "semico-usb-keyboard" "bt5.0-kb-keyboard" "at-translated-set-2-keyboard")

# Initialize layout as unknown
layout="unknown"

# Loop over the keyboards
for keyboard in "${keyboards[@]}"; do
  # Get the active keymap of the current keyboard
  current_layout=$(hyprctl devices -j | jq -r --arg keyboard "$keyboard" '.keyboards[]| select(.name==$keyboard)| .active_keymap')

  # If the current keyboard is connected and has an active keymap, update the layout
  if [ -n "$current_layout" ]; then
    layout=$current_layout
    break
  fi
done

# Print the layout
case $layout in
  "English (US)")
    echo "US"
    ;;
  "Turkish")
    echo "TR"
    ;;
  "Arabic")
    echo "AR"
    ;;
  *)
    echo "unknown"
    ;;
esac

