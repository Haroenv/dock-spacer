#!/bin/bash
# This is a wrapper for the defaults command 
# `defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'`
# That command will add a new spacer to the OS X dock. 
# Usage: `dock-spacer` for one spacer. `dock-spacer -n 2` for 2. `dock-spacer -h` for help. 

argument=$1

if [[ "$argument" ]]; then
	if [[ "$argument"=="-n" ]]; then
		if [[ "$2" ]]; then
			for (( i = 0; i < $2; i++ )); do
				echo def #defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
			done
		else
			echo "missing argument"
			#"$1"="-h"
		fi
	elif [[ "$argument"=="-h" ]]; then
		echo "Help-info" #todo
	fi
fi

echo killall Dock #killall Dock