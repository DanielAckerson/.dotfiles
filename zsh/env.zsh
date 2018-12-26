export TERM=xterm-256color

export LANG=en_US.UTF-8

export MANPAGER='less'

if command -v nvim &>/dev/null ; then
    export EDITOR='nvim'
    export VISUAL='nvim'
elif command -v vim &>/dev/null ; then
    export EDITOR='vim'
    export VISUAL='vim'
else
    export EDITOR='vi'
    export VISUAL='vi'
fi
