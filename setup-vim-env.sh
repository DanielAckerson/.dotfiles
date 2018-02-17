#! /bin/bash --norc

#assume everything that is necessary to run script is installed

if [ -x $(command -v nvim) ] ; then
    #config for neovim
    echo "setting up neovim"
    VIM="nvim"
    PLUGDIR="$HOME/.local/share/nvim/site/autoload/plug.vim"
    VIMRC_STD="$HOME/.config/nvim/init.vim"
    VIMRC_SRC="$HOME/.dotfiles/vim/neo.vim"
    pip3 install neovim
elif [ -x $(command -v vim) ] ; then
    #config for vim 8
    echo "setting up vim"
    VIM=vim
    PLUGDIR="$HOME/.vim/autoload/plug.vim"
    VIMRC_STD="$HOME/.vim/vimrc"
    VIMRC_SRC="$HOME/.dotfiles/vim/vim8.vim"
else
    >&2 echo "vim not found"
    exit 1
fi

#backup rc file and make new one that sources from $HOME/.dotfiles/vim/
backuprc "$VIMRC_STD"
printf "so $VIMRC_SRC" > "$VIMRC_STD"

#install vim-plug
curl -fLo "$PLUGDIR" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#install vim plugins (don't know if vim 8 has the command 'UpdateRemotePlugins')
eval $VIM +PlugInstall +UpdateRemotePlugins

############

function backuprc() {
    if [ -f "$1" ] ; then
        mv "$1" "$1.bk"
    fi
}
