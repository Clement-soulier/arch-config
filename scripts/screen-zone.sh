#!/bin/bash
wl-copy --clear

hyprshot -m region --clipboard-only

TMPFILE=$(mktemp --suffix=.png)

sleep 2

wl-paste --type image/png > "$TMPFILE"


if [[ -s "$TMPFILE" ]]; then
	swappy -f "$TMPFILE"
	rm -f "$TMPFILE"
else
	rm -f "$TMPFILE"
fi
