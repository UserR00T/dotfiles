#! /bin/sh

if sessionlist=$(tmux list-windows); then
    echo "$sessionlist" | while read -r line; do
        session=$(echo "$line" | cut -d ':' -f 2 | cut -d '(' -f 1)
        printf "%s" "$session"
    done
else
    printf "none"
fi
