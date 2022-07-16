export DOTDIR="$HOME/dotfiles-thin"
export ZDOTDIR="$HOME/.zsh"


if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/lib" ] ; then
    export PATH="$HOME/.local/lib:$PATH"
fi
