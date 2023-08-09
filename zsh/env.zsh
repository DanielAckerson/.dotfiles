export LANG=en_US.UTF-8

if command -v nvim &>/dev/null; then
    export EDITOR="nvim"
    export VISUAL="nvim"
    #export MANPAGER="nvim +Man!"
    export MANPAGER="less"
elif command -v vim &>/dev/null; then
    export EDITOR="vim"
    export VISUAL="vim"
    export MANPAGER="less"
else
    export EDITOR="vi"
    export VISUAL="vi"
    export MANPAGER="less"
fi

# export LESS="-RiF --mouse --wheel-lines=3"
export LESS="-Ri --mouse --wheel-lines=3"
