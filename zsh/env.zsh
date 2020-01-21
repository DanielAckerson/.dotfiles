export LANG=en_US.UTF-8

if command -v nvim &>/dev/null; then
    export EDITOR="nvim"
    export VISUAL="nvim"
    export MANPAGER="nvim +Man!"
elif command -v vim &>/dev/null; then
    export EDITOR="vim"
    export VISUAL="vim"
    export MANPAGER="less"
else
    export EDITOR="vi"
    export VISUAL="vi"
    export MANPAGER="less"
fi
