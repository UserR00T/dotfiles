#!/bin/sh

sessions="$(lsof -Pi -n | grep ":22")"

if [ -n "$sessions" ]; then
    count=$(echo "$sessions" | wc -l)
    echo "($count): $(echo "$sessions" | cut -d ">" -f 2 | cut -d " " -f 1 | cut -d ":" -f 1 |  sed -z 's/\n/, /g')"
else
    echo "(0)"
fi
