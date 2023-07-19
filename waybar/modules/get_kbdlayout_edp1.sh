#!/usr/bin/env sh

layout=$(hyprctl devices -j | jq -r '.keyboards[]| select(.name=="at-translated-set-2-keyboard")| .active_keymap')


# layout=$(hyprctl devices | awk '/at-translated-set-2-keyboard/,/main/' | perl -n -e'/l \"(.*?)\"/ && print $1')
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

