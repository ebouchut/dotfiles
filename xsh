#!/bin/sh

# Make the 'xsh' command available in all shells
export PATH=$PATH:/Users/ebouchut/dev/xiki/bin

# Define some key shortcuts for quickly switching from your shell to xsh
xiki_open_key="\C-x"        # Ctrl+X to expand in xsh
xiki_dropdown_key="\C-d"    # Ctrl+D to show a dropdown menu for a command
xiki_grab_key="\C-g"        # Ctrl+G to grab commands to and from xsh
xiki_tab_key="\e\C-i"       # Esc, Tab to do autocomplete
xiki_reverse_key="\e\C-r"   # Esc, Ctrl+R to search shell history

# Some examples, in case you want to update this file:
# xiki_open_key="\C-x"      # Ctrl+X/
# xiki_open_key="\e\C-X"    # Esc, Ctrl+X

# Enable the key shortcuts and the xsh wrapper function
source ~/dev/xiki/bin/.xsh
