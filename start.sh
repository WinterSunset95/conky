#!/bin/bash

# Check if conky is running
if ps -A | grep conky; then
	# If conky is running, killall and start
	echo "hello if"
	killall -q conky && conky
else
	echo "hello else"
	conky
fi
