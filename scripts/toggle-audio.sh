declare -A nicknames
nicknames["alsa_output.pci-0000_03_00.1.hdmi-stereo-extra2"]="Speakers"
nicknames["alsa_output.usb-SteelSeries_Arctis_Nova_Pro_Wireless-00.iec958-stereo"]="Arctis Nova Pro"
nicknames["alsa_output.usb-Sony_Interactive_Entertainment_DualSense_Wireless_Controller-00.Direct__Direct__sink"]="DualSense Controller"

declare -A icons
icons["alsa_output.pci-0000_03_00.1.hdmi-stereo-extra2"]="video-display"
icons["alsa_output.usb-SteelSeries_Arctis_Nova_Pro_Wireless-00.iec958-stereo"]="audio-headphones"
icons["alsa_output.usb-Sony_Interactive_Entertainment_DualSense_Wireless_Controller-00.Direct__Direct__sink"]="input-gaming"

sinks=($(pactl list short sinks | awk '{print $2}'))
current=$(pactl get-default-sink)
idx=0

for i in "${!sinks[@]}"; do
    if [[ "${sinks[$i]}" == "$current" ]]; then
        idx=$i
        break
    fi
done

next_sink="${sinks[$(( (idx + 1) % ${#sinks[@]} ))]}"
pactl set-default-sink "$next_sink"

for input in $(pactl list short sink-inputs | awk '{print $1}'); do
    pactl move-sink-input "$input" "$next_sink" 2>/dev/null
done

display_name="${nicknames[$next_sink]:-$(pactl list sinks | grep -A 8 "Name: $next_sink" | grep "Description:" | cut -d: -f2- | xargs)}"
icon="${icons[$next_sink]:-audio-volume-high}"
NOTIF_ID_FILE="${XDG_RUNTIME_DIR}/audio_toggle_notif_id"
LAST_ID=$(cat "$NOTIF_ID_FILE" 2>/dev/null || echo 0)
NEW_ID=$(notify-send -p -r "${LAST_ID:-0}" -i "$icon" "Audio Output" "$display_name")
echo "$NEW_ID" > "$NOTIF_ID_FILE"