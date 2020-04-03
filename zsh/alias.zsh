alias l.="ls -d .*"
alias ll.="ls -lhd .*"

# get public IP using dig from dnsutils package; gets IP from DNS server because fast
alias wanip="dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com"
alias wanipv6="dig -6 TXT +short o-o.myaddr.l.google.com @ns1.google.com"

alias vim="echo 'did you mean nvim?'"

alias open="xdg-open &> /dev/null"

alias -g null="&> /dev/null" 

alias pip-upgrade-all="pip list -o --format=freeze | sed '/^\\-e/d;s/==.*$//' | xargs -n1 pip install -U"
