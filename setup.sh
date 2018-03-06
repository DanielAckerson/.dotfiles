#! /bin/bash

#script to setup my preferred environment

#assumed that git is available

cmdexists() {
    command -v "$1" &>/dev/null
    return $?
}

DO=sudo
DOT="$HOME/.dotfiles"
PKGS="zsh tmux neovim python3 python3-pip lua5.3 curl"
PKGMGS=(apt apt-get pacman pkg)

#check if running as root
if [[ $EUID -eq 0 ]] ; then
    read -p "Running setup as root won't work as expected. Continue anyway? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[^Yy]$ ]] ; then
        echo "Setup stopped by user." >&2
        exit 1
    fi 
fi

#check if packages should be installed with sudo
read -p "Install with sudo? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[^Yy]$ ]] ; then
    unset DO
fi 

#find package manager
for MG in ${PKGMGS[@]} ; do
    if cmdexists "$MG" ; then
        break
    fi
done
echo "Using $MG to install packages"

#try installing packages
case $MG in
    apt|apt-get|pkg)
        eval $DO $MG install $PKGS
        ;;
    pacman)
        eval $DO pacman -S $PKGS
        ;;
esac

if [[ $? -ne 0 ]] ; then
    echo "error: Failed to install packages" >&2
    echo "errot: Need manual setup" >&2
    exit 1
fi

if ! eval $DO pip3 install --upgrade --force-reinstall pip ; then
    echo "error: Failed to get newest version of pip."
    exit 1
fi

#TODO find alternative to 'which'. look into command or type, etc.
echo "Setting default shell to zsh"
if ! chsh -s $(which zsh); then
    echo "Couldn't set default shell" >&2
fi

STAMP=$(date +"%y%m%d%H%M%S")
#zsh setup
#
#download oh-my-zsh
echo "Downloading Oh My ZSH!"
#TODO find better way to do this rather than brute force
git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" 2>/dev/null

#TODO make backing up optional
#backup zshrc and create new one that sources from .dotfiles
echo "Backing up old zshrc"
mv "$HOME/.zshrc" "$HOME/.zshrc-$STAMP.bk" &> /dev/null
echo "source \"$DOT/zsh/zshrc\"" > "$HOME/.zshrc"

#tmux setup
#
#TODO make backing up optional
#backup tmux conf and source from .dotfiles
echo "Backing up old tmux.conf"
mv "$HOME/.tmux.conf" "$HOME/.tmux.conf-$STAMP.bk" &> /dev/null
echo "source-file $DOT/tmux/tmux.conf" > "$HOME/.tmux.conf"

#vim setup
#
if cmdexists nvim ; then
    #config for neovim
    echo "setting up neovim"
    VIM="nvim"
    PLUG="$HOME/.local/share/nvim/site/autoload/plug.vim"
    CFGDIR="$HOME/.config/nvim"
    VIMRC_STD="$CFGDIR/init.vim"
    VIMRC_SRC="$DOT/vim/neo.vim"
    eval $DO pip install neovim
elif cmdexists vim ; then
    #config for vim 8
    echo "setting up vim"
    VIM=vim
    PLUG="$HOME/.vim/autoload/plug.vim"
    CFGDIR="$HOME/.vim/"
    VIMRC_STD="$CFGDIR/vimrc"
    VIMRC_SRC="$DOT/vim/vim8.vim"
else
    echo "vim not found" >&2
    exit 1
fi

#TODO make backing up optional
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
