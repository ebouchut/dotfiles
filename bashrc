. ~/bin/dotfiles/bash/env
. ~/bin/dotfiles/bash/config
. ~/bin/dotfiles/bash/aliases

## ~~~~~~~~~ RVM
# load RVM into a shell session.
#[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm"

# The goal here is that when RVM is available, we use that, 
# and when it isn't we tell Bundler to install into a shared area 
# inside my home directory. 
# That way I never have to do gem installations with root privileges.
#
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
else
   # make Bundler do passwordless installs to a sandbox rather than to the system
  export BUNDLE_PATH=~/.bundle
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

## ~~~~~~~~~ Rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi





