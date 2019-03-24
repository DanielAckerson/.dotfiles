#! /bin/bash

# git setup

DOT="$HOME/.dotfiles"
DOTGIT="$DOT/git/gitconfig"
GIT="$HOME/.gitconfig"
STAMP=$(date +"%y%m%d%H%M%S")

echo "Setting up git"

echo "Backing up old .gitconfig"
if [[ -f $GIT && ! -L $GIT ]]; then
    mv "$GIT" "$GIT-$STAMP.bk" >/dev/null 2>&1
fi
ln -s -T "$DOTGIT" "$GIT"
