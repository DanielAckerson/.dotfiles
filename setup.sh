#! /bin/bash --norc

#script to setup my preferred environment

#assumed that git is available

PKGS="zsh tmux neovim python3 python3-pip lua5.3 curl"

if [ -x $(command -v pacman) ] ; then
    #install using pacman
    sudo pacman -S "$PKGS"
elif [ -x $(command -v apt) ] ; then
    #install using apt (preferred)
    sudo apt install "$PKGS"
elif [ -x $(command -v apt-get) ] ; then
    #install using apt-get
    sudo apt-get install "$PKGS"
else
    >&2 printf "error: cannot find way to install packages. manual install necessary"
    exit 1
fi

chsh -s $(which zsh)

#zsh setup
#
#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#backup zshrc and create new one that sources from .dotfiles
mv "$HOME/.zshrc" "$HOME/.zshrc.autobk"
printf "source '$HOME/dotfiles/zsh/zshrc_manager.sh'" > "$HOME/.zshrc"


#tmux setup
#
#backup tmux conf and source from .dotfiles
mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.autobk"
printf "source-file $HOME/dotfiles/tmux/tmux.conf" > "$HOME/.tmux.conf"

#vim setup
#
#run vim setup script
bash setup-vim-env.sh
