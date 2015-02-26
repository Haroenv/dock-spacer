#!/bin/bash
# This is a wrapper for the defaults command
# `defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'`
# That command will add a new spacer to the OS X dock.
# Usage: `dock-spacer` for one spacer. `dock-spacer -n 2` for 2. For document spacers,
# use `dock-spacer -d 2`, with 2 being the number of spacers (null will yield a single spacer).
# `-t` will allow you to make hidden apps transparent.
# `-v` will undo the making transparent of hidden apps.
# `-s` will enable scroll gestures;
# `-s d` will disable scroll gestures;
# `dock-spacer -h` for help.

argument=$1

if [[ $argument ]]; then
	case $argument in
	"-n" )
		if [[ "$2" ]]; then
			echo "added $2 spacers"
			for (( i = 0; i < $2; i++ )); do
				defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
			done
			killall Dock
		elif [[ !"$2" ]]; then
			argument="-h"
		fi
		;;
	"-d" )
		if [[ "$2" ]]; then
			echo "added $2 spacers"
			for (( i = 0; i < $2; i++ )); do
				defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'
			done
			killall Dock
		else
			echo "added a spacer"
			defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'
			killall Dock
		fi
		;;
	"-t" )
		echo "made hidden apps transparent"
		defaults write com.apple.dock showhidden -bool TRUE
		killall Dock
		;;
	"-v" )
		echo "made hidden apps visible in the dock"
		defaults write com.apple.dock showhidden -bool FALSE
		killall Dock
		;;
	"-s" )
		if [[ "$2" == "d" ]]; then
			echo "disabled scroll gestures"
			defaults write com.apple.dock scroll-to-open -bool FALSE
			killall Dock
		else
			echo "enabled scroll gestures"
			defaults write com.apple.dock scroll-to-open -bool TRUE
			killall Dock
		fi
		;;
	"-r" )
		echo "this will reset all changes you made to Dock settings."
		echo "do you want to continue? [Y/N]"
		read continue
		if [[ "$continue" == "y" || "$continue" == "Y" ]]; then
			echo "reset all settings for the Dock"
			defaults delete com.apple.dock
			killall Dock
		else
			echo "no settings changed"
		fi
		;;
	* | "-h" )
		echo "dock-spacer 3.0 (26 feb 2015)"
		echo
		echo "usage: dock-spacer               add 1 spacer"
		echo "   or: dock-spacer -n [number]   add a number of spacers"
		echo "   or: dock-spacer -d            add a spacer to the documents (right) part"
		echo "   or: dock-spacer -d [number]   add a number of spacers to the documents (right) part"
		echo "   or: dock-spacer -t            make hidden apps transparent"
		echo "   or: dock-spacer -v            make hidden apps regular"
		echo "   or  dock-spacer -s            enable scroll gestures"
		echo "   or  dock-spacer -s d          disable scroll gestures"
		echo "   or  dock-spacer -r            reset all changes made to the Dock"
		echo "   or: dock-spacer -h            display this message"
		;;
	esac
else
	echo "added a spacer"
	defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
	killall Dock
fi
