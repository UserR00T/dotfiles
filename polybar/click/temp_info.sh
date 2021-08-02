#!/bin/sh

OUTPUT=$(sensors -A k10temp-pci-00c3 amdgpu-pci-0a00 | rofi -dmenu -p "Temperature")
printf "$(printf "$OUTPUT" | cut -d ':' -f2 | xargs)" | xsel -i -b
