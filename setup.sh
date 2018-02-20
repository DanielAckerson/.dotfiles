#! /bin/bash --norc

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

chsh -s $(which zsh)

STAMP=$(date +"%y%m%d%H%M%S")
#zsh setup
#
#download oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" 2>/dev/null
#backup zshrc and create new one that sources from .dotfiles
mv "$HOME/.zshrc" "$HOME/.zshrc-$STAMP.bk"
echo "source \"$DOT/zsh/zshrc\"" > "$HOME/.zshrc"


#tmux setup
#
#backup tmux conf and source from .dotfiles
mv "$HOME/.tmux.conf" "$HOME/.tmux.conf-$STAMP.bk"
echo "source-file $DOT/tmux/tmux.conf" > "$HOME/.tmux.conf"

#vim setup
#
#run vim setup script
bash --norc "$DOT/setup-vim-env.sh"
