export TERM=xterm-256color

export LANG=en_US.UTF-8

export MANPAGER='less'

if [ -x "$(command -v nvim)" ]; then
    export EDITOR='nvim'
elif [ -x "$(command -v vim)" ]; then
    export EDITOR='vim'
else
    export EDITOR='nano'
fi

# User scripts
export PATH=$DOTFILES/bin:$PATH
