#!/usr/bin/env bash

if [ ! -d /sys/class/bluetooth ]; then
  echo # No Bluetooth interface
  exit 0
fi

read -r current_rice <"$HOME"/.config/bspwm/.rice

FILE="$HOME/.config/bspwm/rices/${current_rice}/config.ini"
POWER_ON=$(awk '/^blue =/ {print $3; exit}' "$FILE")
POWER_OFF=$(awk '/^grey =/ {print $3; exit}' "$FILE")

check_bluetooth() {
  if systemctl is-active --quiet bluetooth.service; then
    if bluetoothctl show | grep -q "Powered: yes"; then
      echo "%{F$POWER_ON}󰂯%{F-}"
    else
      echo "%{F$POWER_OFF}󰂲%{F-}"
    fi
  else
    echo
  fi
}

check_bluetooth
