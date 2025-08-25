#!/bin/bash

# Vérifie le niveau de batterie
BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT*/capacity)
STATUS=$(cat /sys/class/power_supply/BAT*/status)

# Envoie une notification si batterie <= 15% et pas en charge
if [ "$BATTERY_LEVEL" -le 20 ] && [ "$STATUS" != "Charging" ]; then
    notify-send -u critical "Batterie faible ⚡" "Niveau actuel : ${BATTERY_LEVEL}%. Branchez le chargeur."
fi
