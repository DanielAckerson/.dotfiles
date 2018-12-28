# neovim setup

echo "Setting up neovim"

STAMP=$(date +"%y%m%d%H%M%S")
DOT="$HOME/.dotfiles"
VIM="nvim"
PLUG="$HOME/.local/share/nvim/site/autoload/plug.vim"
CFGDIR="$HOME/.config/nvim"
VIMRC_STD="$CFGDIR/init.vim"
VIMRC_SRC="$DOT/vim/neo.vim"

mkdir -p "$CFGDIR"

# TODO make backing up optional
# backup rc file and make new one that sources from $HOME/.dotfiles/vim/
echo "Backing up old vimrc"
mv "$VIMRC_STD" "$VIMRC_STD\-$STAMP.bk" &> /dev/null

echo "so $VIMRC_SRC" > "$VIMRC_STD"

# install vim-plug
echo "Installing vim-plug"
curl -fLo "$PLUG" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install vim plugins (don't know if vim 8 has the command 'UpdateRemotePlugins')
echo "Installing vim plugins"
pip install --user neovim
eval $VIM +PlugInstall +qall
