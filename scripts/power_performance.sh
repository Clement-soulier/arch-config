#!/bin/bash

# Profil équilibré (ou performance si tu veux vraiment forcer)
sudo powerprofilesctl set balanced

# Laisse le CPU gérer dynamiquement
sudo cpupower frequency-set -g schedutil

notify-send "⚡ Mode performance activé" "Profil: balanced\nCPU: schedutil"

