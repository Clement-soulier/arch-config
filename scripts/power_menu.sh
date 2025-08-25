#!/bin/bash

choice=$(echo -e "💤 Mode Économie\n⚡ Mode Performance" | rofi -dmenu -p "Choisir profil énergie")

case "$choice" in
  "💤 Mode Économie")
    ~/.local/bin/power_saver.sh
    ;;
  "⚡ Mode Performance")
    ~/.local/bin/power_performance.sh
    ;;
esac
