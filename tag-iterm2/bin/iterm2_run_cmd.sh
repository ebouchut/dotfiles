#!/bin/bash

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Run the commands passed in as argument 
# in the current iTerm window 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[[ $OSTYPE == darwin* ]] || { 
  echo "This command only works on a Mac, aborting" >&2
  exit 1
}

osascript - "$@" <<EOF
on run argv
  tell application "iTerm"
    activate
    tell current session of current window
      repeat with arg in argv
        write text arg
      end repeat
    end tell
  end tell
end run
EOF
