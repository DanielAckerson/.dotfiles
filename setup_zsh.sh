#! /bin/bash

# zsh setup

DOT="$HOME/.dotfiles"
DOTCONFIG="$HOME/.config/dotfiles"
DOTZSH="$DOT/zsh/zshrc"
ZSH="$HOME/.zshrc"
OHMYZSH="$DOTCONFIG/zsh/oh-my-zsh"
STAMP=$(date +"%y%m%d%H%M%S")

echo "Setting up zsh"

echo "Setting default shell to zsh"
chsh -s $(command -v zsh) || echo "Couldn't set default shell" >&2

echo "Downloading Oh My ZSH!"
if [[ ! -d $OHMYZSH ]]; then
    mkdir -p "$DOTCONFIG/zsh" && \
    git clone https://github.com/robbyrussell/oh-my-zsh.git "$OHMYZSH"
fi

echo "Backing up old zshrc"
if [[ -f $ZSH && ! -L $ZSH ]]; then
    mv "$ZSH" "$ZSH-$STAMP.bk" >/dev/null 2>&1
fi
ln -s -T "$DOTZSH" "$ZSH"
