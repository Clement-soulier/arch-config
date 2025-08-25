#!/bin/bash

MODE=$(powerprofilesctl get)

case $MODE in
    power-saver)
        ICON="💤"
        ;;
    balanced)
        ICON="⚡"
        ;;
    performance)
        ICON="🔥"
        ;;
    *)
        ICON="❓"
        ;;
esac

echo "$ICON"
