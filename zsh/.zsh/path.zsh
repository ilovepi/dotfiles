# Set parts of path here ...

#add local bin dir to PATH
PATH=$HOME/bin:$PATH
PATH=$HOME/.local/bin:$PATH

# add Go directories to PATH
export GOPATH=$HOME/workspace/go

PATH=$GOPATH/bin:$PATH

#add cargo directories to PATH
path=(${HOME}/.cargo/bin ${HOME}/rust-install/bin "$path[@]")

FUCHSIA=${HOME}/fuchsia
path+="${FUCHSIA}/.jiri_root/bin"

for dir in clang go qemu rust gn ninja cmake; do
  path=("$HOME/fuchsia/prebuilt/third_party/$dir/linux-x64/bin" "$path[@]")
done

for dir in ninja gn; do
  path=("$HOME/fuchsia/prebuilt/third_party/$dir/linux-x64" "$path[@]")
done

path=("${HOME}/infra/fuchsia/prebuilt/tools" "$path[@]")
path=("${HOME}/chromium/depot_tools" "$path[@]")
path=("/usr/lib/google-golang/bin" "$path[@]")

#add local bin dir to PATH
path=($HOME/bin "$path[@]")
path=($HOME/.local/bin "$path[@]")
typeset -U path PATH
export -U PATH
