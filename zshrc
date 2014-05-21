source ~/bin/dotfiles/zsh/env
source ~/bin/dotfiles/zsh/aliases
source ~/bin/dotfiles/zsh/settings


#~~~~~~~~~~~~~~~~~~
# oh-my-zsh
#~~~~~~~~~~~~~~~~~~
source $ZSH/oh-my-zsh.sh

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/dev/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="ebouchut"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
export DISABLE_AUTO_TITLE="false"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(completion gem git github rails ruby ssh-agent)


#~~~~~~~~~~~~~~~~~~
# rvm
#~~~~~~~~~~~~~~~~~~
if  which rvm > /dev/null; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
fi

#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# rbenv
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if which rbenv > /dev/null; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  source $(rbenv root)/completions/rbenv.zsh 
fi

