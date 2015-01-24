#!/bin/bash
# This is a wrapper for the defaults command 
# `defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'`
# That command will add a new spacer to the OS X dock. 
# Usage: `dock-spacer` for one spacer. `dock-spacer -n 2` for 2. `dock-spacer -h` for help. 

argument=$1

if [[ "$argument" ]]; then
	if [[ "$argument"=="-n" ]]; then
		if [[ "$2" ]]; then
			echo "added two spacers"
			for (( i = 0; i < $2; i++ )); do
				#echo def 
				defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
			done
		else
			argument="-h"
		fi
	fi
	if [[ "$argument"=="-h" ]]; then
		echo "dock-spacer 0.1 (24 jan 2015)"
		echo 
		echo "usage: dock-spacer               add 1 spacer"
		echo "   or: dock-spacer -n [number]   add a number of spacers"
		echo "   or: dock-spacer -h            display this message"
	fi
else
	echo "added a spacer"
	#echo def 
	defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
fi

#echo killall Dock 
killall Dock