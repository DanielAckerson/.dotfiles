#! /bin/bash

#script to setup my preferred environment

#assumed that git is available

DOT="$HOME/.dotfiles"
PKGS="zsh tmux neovim python3 python3-pip lua5.3 curl"
PKGMGS=(apt apt-get pacman pkg)

for MG in ${PKGMGS[@]}
do
    command -v "$MG" &> /dev/null
    if [ $? == 0 ] ; then
        break
    fi
done

echo "Using $MG to install packages"

case $MG in
    apt|apt-get|pkg)
        sudo $MG install $PKGS
        ;;
    pacman)
        sudo pacman -S $PKGS
        ;;
esac

if [ $? != 0 ] ; then
    echo "Failed to install packages" >&2
    echo "Need manual setup" >&2
    exit 1
fi

echo "Setting default shell to zsh"
chsh -s $(which zsh)
if [ $? != 0 ] ; then
    echo "Couldn't set default shell" >&2
fi

STAMP=$(date +"%y%m%d%H%M%S")
#zsh setup
#
#download oh-my-zsh
echo "Downloading Oh My ZSH!"
git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" 2>/dev/null
#backup zshrc and create new one that sources from .dotfiles
echo "Backing up old zshrc"
mv "$HOME/.zshrc" "$HOME/.zshrc-$STAMP.bk"
echo "source \"$DOT/zsh/zshrc\"" > "$HOME/.zshrc"

#tmux setup
#
#backup tmux conf and source from .dotfiles
echo "Backing up old tmux.conf"
mv "$HOME/.tmux.conf" "$HOME/.tmux.conf-$STAMP.bk"
echo "source-file $DOT/tmux/tmux.conf" > "$HOME/.tmux.conf"

#vim setup
#
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

#backup rc file and make new one that sources from $HOME/.dotfiles/vim/
echo "Backing up old vimrc"
mkdir -p "$CFGDIR" && mv "$VIMRC_STD" "$VIMRC_STD\-$STAMP.bk" &> /dev/null
echo "so $VIMRC_SRC" > "$VIMRC_STD"

#install vim-plug
echo "Installing vim-plug"
curl -fLo "$PLUG" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#install vim plugins (don't know if vim 8 has the command 'UpdateRemotePlugins')
echo "Installing vim plugins"
eval $VIM +PlugInstall +qall
