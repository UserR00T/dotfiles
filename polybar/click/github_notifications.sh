#! /bin/bash

OUTPUT=$(echo "user = \"${GITHUB_USERNAME}:${GITHUB_ACCESS_TOKEN}\"" | curl -sf -K- https://api.github.com/notifications | jq -r '.[].repository.full_name + "\t" + .[].subject.title + "\t" + .[].subject.type + "\t" + .[].subject.url')
SELECTED=$(printf "$OUTPUT" | rofi -dmenu -p "Github Notifications" -width 70 -format 'i')
if [ "$SELECTED" = "" ]; then
  exit
fi
xdg-open $(printf "$OUTPUT" | sed "${SELECTED++}q;d" | awk -F $'\t' '{print $4}' | sed 's/api.github.com\/repos/github.com/g' | sed 's/pulls/pull/g')
