#!/bin/zsh

#Install oh-my-zsh if not present:
if [[ ! -e $HOME/.oh-my-zsh/oh-my-zsh.sh  ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

#Install stow via homebrew if not present
if [[ -e stow ]]; then
    brew install stow
fi

## neovim configuration ##

#Install vim-plug if not found
if [[ ! -e $HOME/.local/share/nvim/site/autoload/plug.vim ]]; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

#Links for neovim
stow -v3 -R -t $HOME/ nvim

#Links for zsh
stow -v3 -R -t $HOME/ zsh
#Links for emacs (.emacs.d)
stow -v3 -R -t $HOME/ emacs
#Links for aquamacs config
stow -v3 -R -t $HOME/Library/Preferences/Aquamacs\ Emacs/ aquamacs


