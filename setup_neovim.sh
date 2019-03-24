#! /bin/bash

# neovim setup

echo "Setting up neovim"

DOT="$HOME/.dotfiles"
DOTNVIM="$DOT/vim/nvim.vim"
NVIMDIR="$HOME/.config/nvim"
NVIM="$NVIMDIR/init.vim"
PLUG="$HOME/.local/share/nvim/site/autoload/plug.vim"
STAMP=$(date +"%y%m%d%H%M%S")

mkdir -p "$NVIMDIR"

echo "Backing up old vimrc"
if [[ -f $NVIM && ! -L $NVIM ]]; then
    mv "$NVIM" "$NVIM-$STAMP.bk" >/dev/null 2>&1
fi
ln -s -T "$DOTNVIM" "$NVIM"

echo "Installing vim-plug"
curl -fLo "$PLUG" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

echo "Installing vim plugins"
python3 -m pip install --user neovim
nvim +PlugInstall +qall
