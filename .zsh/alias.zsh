alias sudo='sudo '

alias ls="ls -F"
alias ll="ls -laF"

alias cpi="cp -i"
alias mvi="mv -i"
alias rmi="rm -i"
alias his="history"
alias relogin="exec $SHELL -l"
alias getpath="echo $PATH | sed -e 's/:/\n/g'"

if type nvim > /dev/null 2>&1; then
    alias vim="nvim"
fi

if type git > /dev/null 2>&1; then
    alias g="git"
fi
