# zsh setup

echo "Setting up zsh"

# TODO find alternative to 'which'. look into command or type, etc.
echo "Setting default shell to zsh"
if ! chsh -s $(which zsh); then
    echo "Couldn't set default shell" >&2
fi

STAMP=$(date +"%y%m%d%H%M%S")

# download oh-my-zsh
echo "Downloading Oh My ZSH!"
# TODO find better way to do this rather than brute force
git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" 2>/dev/null

# TODO make backing up optional
# backup zshrc and create new one that sources from .dotfiles
echo "Backing up old zshrc"
mv "$HOME/.zshrc" "$HOME/.zshrc-$STAMP.bk" &> /dev/null

echo "source \"$DOT/zsh/zshrc\"" > "$HOME/.zshrc"
