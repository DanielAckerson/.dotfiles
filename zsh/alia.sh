# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias l.='ls -d .*'
alias ll.='ls -lhd .*'

# get public IP using dig from dnsutils package; gets IP from DNS server because fast
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'

if [ -x "$(command -v nvim)" ]; then
    alias vim='nvim'
fi
