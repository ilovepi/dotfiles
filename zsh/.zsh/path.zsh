# Set parts of path here ...
# Add Zotero to PATH
#PATH=$PATH:$HOME/Zotero_linux-x86_64

#add Zotero to path
#PATH=$PATH:$HOME/bootstrap/Zotero_linux-x86_64

export GOPATH=$HOME/workspace/go

if [ "${+localpath}" ]; then
#add local bin dir to PATH
PATH=${HOME}/bin:${PATH}
PATH=${HOME}/.local/bin:${PATH}
PATH=${PATH}:/usr/lib/llvm-7/share

# add Go directories to PATH
#export GOROOT=/usr/local/go

#PATH=$GOPATH/bin:$GOROOT/bin:${PATH}
PATH=$GOPATH/bin:${PATH}

#add cargo directories to PATH
PATH=${HOME}/rust-install/bin:${PATH}
PATH=${HOME}/.cargo/bin:${PATH}

PATH=${HOME}/clang/bin:${PATH}

FUCHSIA=${HOME}/fuchsia
PATH="${FUCHSIA}/.jiri_root/bin:${PATH}"

localpath="${localpath:=${HOME}/.local/bin}"
for dir in go qemu rust gn ninja cmake clang ; do
  localpath="$HOME/fuchsia/prebuilt/third_party/$dir/linux-x64/bin:$localpath"
done

for dir in ninja gn; do
  localpath="$HOME/fuchsia/prebuilt/third_party/$dir/linux-x64:$localpath"
done

localpath="${HOME}/infra/fuchsia/prebuilt/tools:$localpath"
localpath="${HOME}/chromium/depot_tools:$localpath"
localpath="/usr/lib/google-golang/bin:$localpath"
fi

export localpath

export FUCHSIA

PATH=${localpath}:$PATH

PATH=${HOME}/arcanist/bin:${PATH}

export PATH
