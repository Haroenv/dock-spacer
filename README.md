# dock-spacer
This is a wrapper for the defaults command
`defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'` and others.
Those commands will add a new spacer (and more, read the source for more info) to the OS X dock.

This is tested on Yosemite, should be working for all versions from 10.5 and newer.

# Installation

Clone this directory with

```sh
git clone https://github.com/Haroenv/dock-spacer.git
```

Or download the zip, if you play that way.

Another option is to `curl` the script

```sh
curl -o dock-spacer.sh https://raw.githubusercontent.com/Haroenv/dock-spacer/master/dock-spacer.sh
```

And then just run the script from the downloaded directory.

# Usage

Don't forget to give the file the proper permissions (to execute), by using `chmod u+x dock-spacer.sh`

`./dock-spacer.sh` for one spacer.

`./dock-spacer.sh -n 2` for 2.

`./dock-spacer.sh -d` for one documents (the right part) spacer

`./dock-spacer.sh -d 2` for two document spacers

`./dock-spacer.sh -t` to make hidden apps transparent

`./dock-spacer.sh -v` to make hidden apps back regular

`./dock-spacer.sh -s` to enable scroll gestures in the Dock for exposé and opening folders

`./dock-spacer.sh -s d` to disable scroll gestures

`./dock-spacer.sh -r` to reset all changes made to the Dock

`./dock-spacer.sh -h` for help.

To remove a spacer, just drag it out of the dock.

# License

Apache license 2.0. see [License](LICENSE) file.
