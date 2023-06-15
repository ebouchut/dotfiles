
If you do not have Brew on your Mac, [install it first](https://brew.sh/#install).


## Install Brew Formulae and AppStore Apps

Instead of manually installing [Homebrew](https://brew.sh) formulae and AppStore apps,
I use the `brew bundle` command to automate their instalation installation.

This is 2 steps process:
- Create a `Brewfile`  
  > I created this [Brewfile](./Brewfile) with the list of Brew forulae and AppStore apps I want to install on a new Mac.
    Of course, you can tweak it in your cloned repository to match your needs.
    You need to comment the line `mas 'Things', id: 904280696` (because this is my private copy of the `Things` Mac AppStore app and it won't work for you).
- Start the instalation
  ```shell
  brew bundle
  ```


## Dotfiles

These are the dotfiles I use for bash, zsh, vim, git, tmux, espanso...
I install them using [rcm][] like so:

```shell
mkdir $HOME/dev/Perso
cd $HOME/dev/Perso
git clone git://github.com/ebouchut/dotfiles.git

cd dotfiles
RCRC=rcrc rcup -v
```


## Sources

- https://openfolder.sh/macos-migrations-with-brewfile
- https://github.com/Homebrew/homebrew-bundle
- https://robots.thoughtbot.com/brewfile-a-gemfile-but-for-homebrew


[rcm]: https://github.com/thoughtbot/rcm
