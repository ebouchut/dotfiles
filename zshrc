. ~/bin/dotfiles/zsh/env
. ~/bin/dotfiles/zsh/aliases

set -k # Enable comments in command line

#~~~~~~~~~~~~~~~~~~
# oh-my-zsh
#~~~~~~~~~~~~~~~~~~
source $ZSH/oh-my-zsh.sh

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
if which $HOME/.rbenv/bin/rbenv > /dev/null; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Tmux
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

