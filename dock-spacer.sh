#!/bin/bash
# This is a wrapper for the defaults command 
# `defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'`
# That command will add a new spacer to the OS X dock. 
# Usage: `dock-spacer` for one spacer. `dock-spacer -n 2` for 2. for document spacers,
# use `dock-spacer -d 2`, with 2 being the number of spacers (null will yield a single spacer).
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
		* | "-h" )
			echo "dock-spacer 2.0 (27 jan 2015)"
			echo 
			echo "usage: dock-spacer               add 1 spacer"
			echo "   or: dock-spacer -n [number]   add a number of spacers"
			echo "   or: dock-spacer -d            add a spacer to the documents (right) part"
			echo "   or: dock-spacer -d [number]   add a number of spacers to the documents (right) part"
			echo "   or: dock-spacer -h            display this message"
			;;
	esac
else
	echo "added a spacer"
	defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
	killall Dock
fi	



# if [[ "$argument" ]]; then
# 	if [[ "$argument" = "-n" ]]; then
# 		if [[ "$2" ]]; then
# 			echo "added $2 spacers"
# 			for (( i = 0; i < $2; i++ )); do
# 				defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
# 			done
# 			killall Dock
# 		elif [[ !"$2" ]]; then
# 			argument="-h"
# 		fi
# 	fi

# 	if [[ "$argument" = "-d" ]]; then
# 		if [[ "$2" ]]; then
# 			echo "added $2 spacers"
# 			for (( i = 0; i < $2; i++ )); do
# 				defaults write com.apple.dock persistent-others -array-add '{"tile-type"="spacer-tile";}'
# 			done
# 			killall Dock
# 		else
# 			echo "added a spacer"
# 			defaults write com.apple.dock persistent-others -array-add '{"tile-type"="spacer-tile";}'
# 			killall Dock
# 		fi
# 	fi

# 	argument="-h"
# 	if [[ "$argument" = "-h" ]]; then
# 		echo "dock-spacer 2.0 (27 jan 2015)"
# 		echo 
# 		echo "usage: dock-spacer               add 1 spacer"
# 		echo "   or: dock-spacer -n [number]   add a number of spacers"
# 		echo "   or: dock-spacer -d            add a spacer to the documents (right) part"
# 		echo "   or: dock-spacer -d [number]   add a number of spacers to the documents (right) part"
# 		echo "   or: dock-spacer -h            display this message"
# 	fi
# else
# 	echo "added a spacer"
# 	defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
# 	killall Dock
# fi
