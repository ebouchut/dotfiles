
#~~~~~~~~~~~~~~~~~~
# rvm
#~~~~~~~~~~~~~~~~~~
if  which rvm > /dev/null; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Rbenv
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

