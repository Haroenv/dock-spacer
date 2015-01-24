# dock-spacer
This is a wrapper for the defaults command 
`defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'`
That command will add a new spacer to the OS X dock. 

Tested on Yosemite, should be working for all versions from 10.5 and newer.

# Installation

Clone this directory with 

    git clone https://github.com/Haroenv/dock-spacer.git

And then just run the script from the downloaded directory. 

# Usage

`./dock-spacer` for one spacer. 

`./dock-spacer -n 2` for 2. 

`./dock-spacer -h` for help. 

#License

Apache license 2.0. see [License](LICENSE) file.