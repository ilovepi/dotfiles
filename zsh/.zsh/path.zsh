# Set parts of path here ...
# Add Zotero to PATH
#PATH=$PATH:$HOME/Zotero_linux-x86_64

#add Zotero to path
PATH=$PATH:$HOME/bootstrap/Zotero_linux-x86_64

#add local bin dir to PATH
PATH=$HOME/bin:$PATH
PATH=$HOME/.local/bin:$PATH
PATH=$PATH:/usr/lib/llvm-7/share

# add Go directories to PATH
#export GOROOT=/usr/local/go
export GOPATH=$HOME/workspace/go

#PATH=$GOPATH/bin:$GOROOT/bin:$PATH
PATH=$GOPATH/bin:$PATH

#add cargo directories to PATH
PATH=$HOME/rust-install/bin:$PATH
PATH=$HOME/.cargo/bin:$PATH


#export LLVM_SRC=$HOME/workspace/mpk/rust/src/llvm
#export LLVM_OBJ=$HOME/workspace/mpk/rust/build/x86_64-unknown-linux-gnu/llvm/build
#export LLVM_DIR=$HOME/workspace/mpk/rust/build/x86_64-unknown-linux-gnu/llvm/build

#export LLVM_SRC=$HOME/workspace/llvm-dev/llvm
#export LLVM_OBJ=$HOME/workspace/llvm-dev/build
#export LLVM_DIR=$HOME/workspace/llvm-dev/build

#export LLVM_SRC=$HOME/workspace/llvm-project/llvm
#export LLVM_OBJ=$HOME/workspace/llvm-project/build
#export LLVM_DIR=$HOME/workspace/llvm-project/build


#PATH=$LLVM_DIR/bin:$PATH

PATH=$HOME/clang/bin:$PATH


export PATH
