#!/bin/bash

# Met le profil d'alimentation en économie
sudo powerprofilesctl set power-saver

# Limite la fréquence CPU
sudo cpupower frequency-set -g powersave

notify-send "💤 Mode économie activé" "Profil: power-saver\nCPU: powersave"
