Dotfiles
========

The  dotfiles I use for bash, zsh, vim, git, tmux...
I install using [rcm][] like so:

    mkdir $HOME/dev
    cd $HOME/dev
    git clone git://github.com/ebouchut/dotfiles.git

    cd dotfiles
    RCRC=rcrc rcup -v

[rcm]: https://github.com/thoughtbot/rcm
