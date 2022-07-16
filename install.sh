#!/bin/bash -x

# bash -c "$(curl -L raw.github.com/Sakurai00/dotfiles-thin/master/install.sh)"

export DOTDIR="$HOME/dotfiles-thin"
export ZDOTDIR="$HOME/.zsh"


if ! type git >/dev/null 2>&1; then
    sudo apt install -y git
fi

if [ ! -d "$DOTDIR" ]; then
    git clone https://github.com/Sakurai00/dotfiles-thin.git "$DOTDIR"
    cd "$DOTDIR" || exit
else
    cd "$DOTDIR" || exit
    git pull
fi


# Install
sudo apt update

sudo apt install -y  \
    zsh \
    tmux \
    vim \
    neovim \

# Install tpm
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
    cd "$HOME/.tmux/plugins/tpm" || exit
    git pull
fi

# Install dein vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh >installer.sh
sh ./installer.sh "$HOME/.cache/nvim/dein"
rm ./installer.sh


# Link
ln -sf "$DOTDIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTDIR/.gitconfig" "$HOME/.gitconfig"

# Link zsh
if [ ! -d "$HOME/.zsh" ]; then
    mkdir "$HOME/.zsh"
fi
ln -sf "$DOTDIR/.zsh/.zshenv" "$HOME/.zshenv"
ln -sf "$DOTDIR/.zsh/.zshrc" "$ZDOTDIR/.zshrc"
ln -sf "$DOTDIR/.zsh/alias.zsh" "$ZDOTDIR/alias.zsh"
ln -sf "$DOTDIR/.zsh/plugin.zsh" "$ZDOTDIR/plugin.zsh"
ln -sf "$DOTDIR/.zsh/p10k.zsh" "$ZDOTDIR/p10k.zsh"
ln -sf "$DOTDIR/.zsh/.dircolors" "$ZDOTDIR/.dircolors"

# Link vim
if [ ! -d "$HOME/.config/nvim" ]; then
    mkdir "$HOME/.config/nvim"
fi
ln -sf "$DOTDIR/.nvim/init.vim" "$HOME/.config/nvim/init.vim"
ln -sf "$DOTDIR/.nvim/dein.toml" "$HOME/.config/nvim/dein.toml"
