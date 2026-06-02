# Set parts of path here ...

# add Go directories to PATH
export GOPATH=${HOME}/workspace/go

path+=$GOPATH/bin

#add cargo directories to PATH
path=(${HOME}/.cargo/bin "$path[@]")

# --- Work-specific paths (only added when the directory exists) ---
# Fuchsia
if [[ -d ${HOME}/fuchsia ]]; then
  FUCHSIA=${HOME}/fuchsia
  path+="${FUCHSIA}/.jiri_root/bin"

  for dir in clang go qemu rust gn ninja cmake; do
    bindir="${FUCHSIA}/prebuilt/third_party/${dir}/linux-x64/bin"
    [[ -d ${bindir} ]] && path=("${bindir}" "$path[@]")
  done

  for dir in ninja gn; do
    bindir="${FUCHSIA}/prebuilt/third_party/${dir}/linux-x64"
    [[ -d ${bindir} ]] && path=("${bindir}" "$path[@]")
  done
fi

[[ -d ${HOME}/infra/fuchsia/prebuilt/tools ]] && path=("${HOME}/infra/fuchsia/prebuilt/tools" "$path[@]")
[[ -d ${HOME}/chromium/depot_tools ]] && path=("${HOME}/chromium/depot_tools" "$path[@]")
[[ -d /usr/lib/google-golang/bin ]] && path=("/usr/lib/google-golang/bin" "$path[@]")

#add local bin dir to PATH
path=(${HOME}/bin "$path[@]")
path=(${HOME}/.local/bin "$path[@]")
typeset -U path PATH
export -U PATH
