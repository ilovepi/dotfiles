#export TERM=xterm-256color
#_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true

# Add Zotero to PATH
PATH=$PATH:$HOME/Zotero_linux-x86_64

#add local bindirectories to PATH
#PATH=$HOME/bin:$HOME/rust-nightly/bin:$PATH

#Add cargo directories to PATH
PATH=$HOME/.cargo/bin:$HOME/bin:$PATH

export PATH


export PATH="$HOME/.cargo/bin:$PATH"
