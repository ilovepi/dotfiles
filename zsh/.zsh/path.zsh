# Set parts of path here ...
# Add Zotero to PATH
#PATH=$PATH:$HOME/Zotero_linux-x86_64

#add Zotero to path
#PATH=$PATH:$HOME/bootstrap/Zotero_linux-x86_64

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

PATH=$HOME/clang/bin:$PATH

FUCHSIA=${HOME}/fuchsia
PATH="${FUCHSIA}/.jiri_root/bin:${PATH}"

if [ -z "${localpath}"]; then
localpath="${localpath:=${HOME}/.local/bin}"
for dir in clang go qemu rust gn ninja cmake; do
  localpath="$HOME/fuchsia/prebuilt/third_party/$dir/linux-x64/bin:$localpath"
done

for dir in ninja gn; do
  localpath="$HOME/fuchsia/prebuilt/third_party/$dir/linux-x64:$localpath"
done

localpath="${HOME}/infra/fuchsia/prebuilt/tools:$localpath"
localpath="${HOME}/chromium/depot_tools:$localpath"
localpath="/usr/lib/google-golang/bin:$localpath"
fi

PATH=${localpath}:$PATH

PATH=${HOME}/arcanist/bin:${PATH}

export PATH
