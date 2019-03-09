#! /bin/bash

# tmux setup

DOT="$HOME/.dotfiles"

echo "Setting up tmux"

STAMP=$(date +"%y%m%d%H%M%S")

# TODO make backing up optional
# backup tmux conf and source from .dotfiles
echo "Backing up old tmux.conf"
mv "$HOME/.tmux.conf" "$HOME/.tmux.conf-$STAMP.bk" &> /dev/null

echo "source-file $DOT/tmux/tmux.conf" > "$HOME/.tmux.conf"
