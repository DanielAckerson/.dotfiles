#! /bin/bash

# tmux setup

DOTF="$HOME/.dotfiles"
DOTFTMUX="$DOTF/tmux/tmux.conf"
TMUX="$HOME/.tmux.conf"
STAMP=$(date +"%y%m%d%H%M%S")

echo "Setting up tmux"

echo "Backing up old tmux.conf"
if [[ -f $TMUX && ! -L $TMUX ]]; then
    mv "$TMUX" "$TMUX-$STAMP.bk" >/dev/null 2>&1
fi
ln -s -T "$DOTFTMUX" "$TMUX"
