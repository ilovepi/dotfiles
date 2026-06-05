# =============================================================================
# env.nu — loaded BEFORE config.nu. Put environment + PATH here.
# Mirrors zsh/.zsh/{editor,path}.zsh + zsh/.zsh/fzf.zsh env vars.
# =============================================================================

# --- Editor (zsh editor.zsh) ---
$env.EDITOR = (if (which nvim | is-not-empty) { "nvim" } else { "vim" })
$env.VISUAL = $env.EDITOR

# --- Go (zsh path.zsh) ---
$env.GOPATH = ($env.HOME | path join workspace go)
mkdir $env.GOPATH

# --- PATH ---------------------------------------------------------------
# In Nushell $env.PATH is a LIST, not a colon string. prepend = higher
# priority. We only add dirs that actually exist (like the zsh guards).
def --env prepend-path [p: string] {
  if ($p | path exists) and ($p not-in $env.PATH) {
    $env.PATH = ($env.PATH | prepend $p)
  }
}
def --env append-path [p: string] {
  if ($p | path exists) and ($p not-in $env.PATH) {
    $env.PATH = ($env.PATH | append $p)
  }
}

# go bin is low priority in your zsh config -> append
append-path ($env.GOPATH | path join bin)

# cargo
prepend-path ($env.HOME | path join .cargo bin)

# --- Work-specific paths (only when the dir exists) ---
let fuchsia = ($env.HOME | path join fuchsia)
if ($fuchsia | path exists) {
  $env.FUCHSIA = $fuchsia
  prepend-path ($fuchsia | path join .jiri_root bin)
  for dir in [clang go qemu rust gn ninja cmake] {
    prepend-path ($fuchsia | path join prebuilt third_party $dir linux-x64 bin)
  }
  for dir in [ninja gn] {
    prepend-path ($fuchsia | path join prebuilt third_party $dir linux-x64)
  }
}
prepend-path ($env.HOME | path join infra fuchsia prebuilt tools)
prepend-path ($env.HOME | path join chromium depot_tools)
prepend-path "/usr/lib/google-golang/bin"

# local bins win over everything (matches the tail of your zsh path.zsh)
prepend-path ($env.HOME | path join bin)
prepend-path ($env.HOME | path join .local bin)

# --- FZF env (zsh fzf.zsh) ---
$env.FZF_DEFAULT_OPTS  = "--ansi"
$env.FZF_CTRL_T_COMMAND = "fd --follow --exclude .git --color=always"

# --- Colored man pages (replaces zsh OMZP solarized-man) ---
# render man pages through bat with the `man` syntax theme
$env.MANPAGER = "sh -c 'col -bx | bat --language man --plain'"
$env.MANROFFOPT = "-c"

# --- Prompt + zoxide init generation -------------------------------------
# Generate starship + zoxide init scripts into <data-dir>/init/ once (only
# if missing, so startup stays fast). config.nu sources them explicitly.
# Delete these files to force a refresh after upgrading the tools.
#   rm ~/.local/share/nushell/init/*.nu
let init_dir = ($nu.data-dir | path join init)
mkdir $init_dir

let starship_nu = ($init_dir | path join starship.nu)
if not ($starship_nu | path exists) {
  starship init nu | save -f $starship_nu
}

let zoxide_nu = ($init_dir | path join zoxide.nu)
if not ($zoxide_nu | path exists) {
  zoxide init nushell --cmd z | save -f $zoxide_nu
}
