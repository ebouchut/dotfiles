Dotfiles
========

Instead of installing [Homebrew](https://brew.sh) formulae and AppStore apps,
one by one, I created this [Brewfile](./Brewfile) with the ones I need.
Now the `brew bundle` command offers a simple way to install them all in a row.

```shell
brew bundle
```

The  dotfiles I use for bash, zsh, vim, git, tmux...
I install using [rcm][] like so:

```shell
mkdir $HOME/dev/Perso
cd $HOME/dev/Perso
git clone git://github.com/ebouchut/dotfiles.git

cd dotfiles
RCRC=rcrc rcup -v
```

[rcm]: https://github.com/thoughtbot/rcm
