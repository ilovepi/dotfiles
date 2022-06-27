#!/bin/bash -e

pushd ${HOME}

# install arch packages
sudo pacman -S --needed - < pkglist.txt

# install zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

chsh -s /bin/zsh

git clone -b bspwm https://github.com/ilovepi/dotfiles.git

pushd dotfiles

[ -d "${XDG_CONFOG_DIR}/polybar" ] && mv ${XDG_CONFOG_DIR}/polybar{,.bak} 
[ -d "${XDG_CONFOG_DIR}/termite" ] && mv ${XDG_CONFOG_DIR}/termite{,.bak} 
[ -d "${XDG_CONFOG_DIR}/neovim" ] && mv ${XDG_CONFOG_DIR}/neovim{,.bak} 
[ -d "${XDG_CONFOG_DIR}/bottom" ] && mv ${XDG_CONFOG_DIR}/bottom{,.bak} 
[ -d "${XDG_CONFOG_DIR}/kitty" ] && mv ${XDG_CONFOG_DIR}/kitty{,.bak} 
[ -d "${HOME}/.zshrc" ] && mv ${HOME}/.zshrc{,.bak} 

stow -t ${HOME} git zsh config tmux byobu


#config neovim
nvim --headless -c autocmd User PackerComplete quitall -c PackerSync

# dotfiles
popd

# $HOME
popd
