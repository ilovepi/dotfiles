#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

sudo apt-add-repository ppa:apt-fast/stable
sudo apt-add-repository "deb http://apt.llvm.org/artful/ llvm-toolchain-artful main"
sudo apt-get update

PACKAGES=apt-fast                     \
           aptitude                   \
           autoconf                   \
           autotools-dev              \
           bison                      \
           build-essential            \
           byobu                      \
           clang-7                    \
           clang-format-7             \
           clang-tools-7              \
           cmake                      \
           curl                       \
           docker                     \
           emacs                      \
           exuberant-ctags            \
           flex                       \
           g++                        \
           g++-6                      \
           g++-8                      \
           gcc                        \
           gcc-6                      \
           gcc-8                      \
           gcc-8-plugin-dev           \
           git                        \
           git-extras                 \
           git-flow                   \
           golang-go                  \
           htop                       \
           keychain                   \
           libssl-dev                 \
           libxml2-dev                \
           lld-7                      \
           lldb-7                     \
           lsb                        \
           man                        \
           meld                       \
           neovim                     \
           ninja-build                \
           nodejs                     \
           openssl                    \
           python-pip                 \
           python3                    \
           python3-dev                \
           python3-pip                \
           rake                       \
           rubber                     \
           ruby                       \
           silversearcher-ag          \
           software-properties-common \
           stow                       \
           terminator                 \
           texinfo                    \
           texliv-vull                \
           texmaker                   \
           tmux                       \
           valgrind                   \
           vim-gnome                  \
           wget                       \
           xclip                      \
           xutils-dev                 \
           zsh

sudo apt-get install $PACKAGES
ssh-keygen -t rsa
chsh -s /bin/zsh

git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
git clone --recursive https://github.com/ilovepi/dotfiles.git

mkdir -p .config .zsh workspace
pushd dotfiles/
stow --target $HOME zsh git vim spacemacs tmux byobu clang
popd
curl -sL zplug.sh/installer| zsh

curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

sudo apt-get install xclip
#xclip -sel clip < ~/.ssh/id_rsa.pub 



