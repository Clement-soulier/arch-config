#!/bin/bash

# Lance hyprlock en arrière-plan
hyprlock &

# Attendre que hyprlock soit bien lancé (ajuster si besoin)
sleep 2

# Suspendre le système
systemctl suspend
