#! /bin/bash --norc

if [ -x $(command -v nvim) ] ; then
    #do neovim setup
    echo "setting up neovim"
    VIM="nvim"
    #where to install vim-plug
    PLUGDIR="~/.local/share/nvim/site/autoload/plug.vim"
    pip3 install neovim
    VIMRC="~/.config/nvim/init.vim"
    backuprc "$VIMRC"




elif [ -x $(command -v vim) ] ; then
    #do vim setup
    echo "setting up vim"
    VIM=vim
    #where to install vim-plug
    PLUGDIR="~/.vim/autoload/plug.vim"
    VIMRC="~/.vimrc"
    if [ -f "$VIMRC" ] ; then
        mv "$VIMRC" "$VIMRC.bk"
    fi
else
    >&2 echo "vim not found"
    exit 1
fi

#install vim-plug
curl -fLo $PLUGDIR --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#install vim plugins
eval $VIM +PlugInstall +UpdateRemotePlugins

function backuprc() {
    if [ -f "$1" ] ; then
        mv "$1" "$1.bk"
    fi
}
