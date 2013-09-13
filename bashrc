. ~/bin/dotfiles/bash/env
. ~/bin/dotfiles/bash/config
. ~/bin/dotfiles/bash/aliases

## ~~~~~~~~~
# RVM
## ~~~~~~~~
# The goal here is that when RVM is available, we use that, 
# and when it isn't we tell Bundler to install into a shared area 
# inside my home directory. 
# That way I never have to do gem installations with root privileges.
if which rvm > /dev/null; then
  # load RVM into a shell session.
  [[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm"

  if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
    source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
  else
     # make Bundler do passwordless installs to a sandbox rather than to the system
    export BUNDLE_PATH=~/.bundle
  fi
  export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi



## ~~~~~~~~~
## Rbenv
## ~~~~~~~~~
if which rbenv > /dev/null; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi





