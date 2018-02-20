#! /bin/bash --norc

#assume everything that is necessary to run script is installed

command -v nvim &> /dev/null
if [ $? == 0 ] ; then
    #config for neovim
    echo "setting up neovim"
    VIM="nvim"
    PLUG="$HOME/.local/share/nvim/site/autoload/plug.vim"
    CFGDIR="$HOME/.config/nvim"
    VIMRC_STD="$CFGDIR/init.vim"
    VIMRC_SRC="$HOME/.dotfiles/vim/neo.vim"
    pip3 install neovim
else
    command -v vim &> /dev/null
    if [ $? == 0 ] ; then
        #config for vim 8
        echo "setting up vim"
        VIM=vim
        PLUG="$HOME/.vim/autoload/plug.vim"
	CFGDIR="$HOME/.vim/"
        VIMRC_STD="$CFGDIR/vimrc"
        VIMRC_SRC="$HOME/.dotfiles/vim/vim8.vim"
    else
        echo "vim not found" >&2
        exit 1
    fi
fi

STAMP=$(date +"%y%m%d%H%M%S")
#backup rc file and make new one that sources from $HOME/.dotfiles/vim/
mkdir -p "$CFGDIR" && mv "$VIMRC_STD" "$VIMRC_STD-$STAMP.bk" &> /dev/null
echo "so $VIMRC_SRC" > "$VIMRC_STD"

#install vim-plug
curl -fLo "$PLUG" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#install vim plugins (don't know if vim 8 has the command 'UpdateRemotePlugins')
eval $VIM +PlugInstall +UpdateRemotePlugins +qall
