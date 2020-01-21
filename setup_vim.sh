#! /bin/bash

# vim setup

echo "Setting up vim"

DOTF="$HOME/.dotfiles"
DOTFVIM="$DOTF/vim/vim8.vim"
VIMDIR="$HOME/.vim"
VIM="$VIMDIR/vimrc"
PLUG="$VIMDIR/autoload/plug.vim"
STAMP=$(date +"%y%m%d%H%M%S")

mkdir -p "$VIMDIR"

echo "Backing up old vimrc"
if [[ -f $VIM && ! -L $VIM ]]; then
    mv "$VIM" "$VIM-$STAMP.bk" >/dev/null 2>&1
fi
ln -s -T "$DOTFVIM" "$VIM"

echo "Installing vim-plug"
curl -fLo "$PLUG" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing vim plugins"
vim +PlugInstall +qall
