#!/bin/bash
# Get external IP
external=$(curl -s ifconfig.me)
internal=$(ip addr show eno1 | grep 'inet ' | awk '{print $2}')
# Get network speed with vnstat. -i specifies the interface, replace eno1 with your interface. -tr gives a short term 5 second report
network_speed=$(vnstat -i eno1 -tr 2 | grep -E "rx|tx" | awk '{print $1": "$2" "$3}')

# Split the network speeds into separate variables
download_speed=$(echo "$network_speed" | grep "rx" | awk '{print $2" "$3}')
upload_speed=$(echo "$network_speed" | grep "tx" | awk '{print $2" "$3}')

# Prepare tooltip data
tooltip="Download Speed: "$download_speed"\rUpload Speed: "$upload_speed

# Convert to JSON
json=$(jq -n \
        --arg ei "$external" \
        --arg t "$tooltip" \
        --arg ii "$internal" \
        '{text: $ei, internal_ip: $ii ,tooltip: $t, class: "normal"}')

echo -e "{\"text\":\""$external"\", \"alt\":\""$internal"\", \"tooltip\":\""$tooltip"\", \"class\":\""class"\"}"

