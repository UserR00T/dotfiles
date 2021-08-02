#!/bin/sh

MENU="$(rofi -sep "|" -dmenu -i -p 'System' -location 3 -xoffset -10 -yoffset 28 -width 10 -hide-scrollbar -line-padding 4 -padding 20 -lines 4 <<< "> Shutdown|> Lock|> Logout|> Reboot")"
    case "$MENU" in
        *Shutdown) systemctl -i poweroff;;
        *Lock) i3lock-fancy ;;
        *Logout) openbox --exit;;
        *Reboot) systemctl reboot
    esac
