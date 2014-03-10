source ~/bin/dotfiles/zsh/env
source ~/bin/dotfiles/zsh/aliases

source $ZSH/oh-my-zsh.sh

#~~~~~~~~~~~~~~~~~~
# rvm
#~~~~~~~~~~~~~~~~~~
if  which rvm > /dev/null; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# rbenv
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if which rbenv > /dev/null; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  source ~/.rbenv/completions/rbenv.zsh 
fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Zsh settings
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set -k # Enable comments in command line
