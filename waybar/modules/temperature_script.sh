#!/bin/bash

# Fetch the CPU temperature from the sensor
cpu_temperature="$(sensors | grep 'Package id' | awk '{print $4}' | cut -d '+' -f2| cut -d '.' -f1)"
gpu_temperature="$( sensors | grep -A2 'pch'| grep 'temp1' | awk '{print $2}' | cut -d '+' -f2| cut -d '.' -f1)"
# Check if the cpu_temperature variable is empty or contains non-numeric characters
if ! [[ $cpu_temperature =~ ^[0-9.]+$ ]]; then
    echo "Error: Unable to fetch CPU temperature."
    exit 1
fi

# Define the temperature range (in Celsius) for the color gradient
min_temperature=20
max_temperature=90

# Define the color gradient in hexadecimal format
min_color="#0000FF"  # Blue
max_color="#FF0000"  # Red
# Calculate the temperature percentage within the range
temperature_percentage=$((100 * (cpu_temperature - min_temperature) / (max_temperature - min_temperature)))

# Calculate the RGB values based on the temperature percentage
red=$((255 * temperature_percentage / 100))
green=$((255 * (100 - temperature_percentage) / 100))
blue=0

# Convert the RGB values to hexadecimal format
red_hex=$(printf "%02X" "$red")
green_hex=$(printf "%02X" "$green")
blue_hex=$(printf "%02X" "$blue")

# Generate the hexadecimal color code
color="#${red_hex}${green_hex}${blue_hex}"
json=$(jq -n \
    --arg text "$cpu_temperature" \
    --arg alt "$gpu_temperature" \
    --arg tooltip "$color" \
    --arg class "$color" \
    '{text: $text, alt: $alt, tooltip: $tooltip, class: $class}')
# Output the CSS class with the generated color as a json object
# echo -e "{\"text\":\"$cpu_temperature\", \"alt\":\"$gpu_temperature\", \"tooltip\":\"$color\", \"class\":\"$color\"}"
echo -e "{\"text\":\"<span background='$color'><big>  $cpu_temperature </big></span>\", \"alt\":\"<span background='$color'><big> ⚙$gpu_temperature </big></span>\", \"tooltip\":\"$tooltip\"}"
# echo -e "{\"text\":\"<span style='background: $color; font-size: 20px; padding: 20px;'>$cpu_temperature</span>\", \"alt\":\"<span style='background: $color; font-size: 20px; padding: 20px;'>$gpu_temperature</span>\", \"tooltip\":\"$tooltip\"}"

