#!/bin/bash

options="Lock\nLogout\nSuspend\nReboot\nShutdown"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power" -theme /home/motagi/.config/rofi/scripts/config.rasi)

case "$chosen" in
    Shutdown)
        systemctl poweroff
        ;;
    Lock)
        hyprlock
        ;;
    Logout)
        hyprctl dispatch exit
        ;;
    Suspend)
        systemctl suspend
        ;;
    Reboot)
        systemctl reboot
        ;;
esac
