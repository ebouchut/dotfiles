source ~/bin/dotfiles/zsh/env       # Environment variables
source ~/bin/dotfiles/zsh/aliases
source ~/bin/dotfiles/zsh/settings  # Zsh specific settings
source ~/bin/dotfiles/zsh/other     # 3rd party programs settings (non zsh) 

# Disable suggestion of correction for non existent commands
# does not work for whatever reason when in zsh/settings, so it ends up here.
unsetopt correct_all

