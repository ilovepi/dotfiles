#export TERM=xterm-256color
#_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true

# Add Zotero to PATH
PATH=$PATH:$HOME/Zotero_linux-x86_64

export SHELL=/usr/bin/zsh
#export TERM=xterm-256color

#add local bin dir to PATH
PATH=$HOME/bin:$PATH

# add Go directories to PATH
#export GOROOT=/usr/local/go
export GOPATH=$HOME/workspace/go

PATH=$GOPATH/bin:$GOROOT/bin:$PATH

#add cargo directories to PATH
PATH=$HOME/rust-install/bin:$PATH
PATH=$HOME/.cargo/bin:$PATH

export PATH

