# git setup

echo "Setting up git"

STAMP=$(date +"%y%m%d%H%M%S")

# TODO make backing up optional
# backup git conf and source from .dotfiles
echo "Backing up old .gitconfig"
mv "$HOME/.gitconfig" "$HOME/.gitconfig-$STAMP.bk" &> /dev/null

echo "[include]\n\
    path = $DOTFILES/git/gitconfig" > "$HOME/.gitconfig"
