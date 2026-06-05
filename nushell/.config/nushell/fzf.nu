# =============================================================================
# fzf.nu — fzf-driven helpers (your zsh fzf.zsh: forgit `gd`, `fed`, `fim`).
# The Ctrl-t fzf file-picker keybinding lives in config.nu (it must be inside
# the $env.config.keybindings record). These are the command helpers.
#
# `gdf` is the fzf diff browser. (It is NOT bound to `gd`: in your zsh the
# forgit `gd` alias lived in ~/.zsh/fzf.zsh, which .zshrc never sourced, so
# your real `gd` was always OMZ's plain `git diff` — that's in git.nu.)
# =============================================================================

# forgit-style diff browser: pick a changed file, preview its colored diff,
# enter opens the full diff in a pager. Optional arg = a ref/commit to diff.
def gdf [ref?: string] {
  let top = (do -i { git rev-parse --show-toplevel } | default "" | str trim)
  if ($top | is-empty) { print "not inside a git work tree"; return }
  # omit the ref entirely when none given — passing "" makes git see rev ''
  let refargs = (if ($ref | is-empty) { [] } else { [$ref] })
  let refstr  = ($refargs | str join " ")
  let files = (do -i { ^git diff ...$refargs --name-only | lines } | default [] | where ($it | is-not-empty))
  if ($files | is-empty) { print "no changes to diff"; return }
  $files
  | str join "\n"
  | fzf --ansi --preview $"git diff ($refstr) --color=always -- {}" --bind $"enter:execute\(git diff ($refstr) --color=always -- {} | less -R\)"
  | ignore
}

# locate + fzf + open in editor (your zsh `fed`)
def --wrapped fed [...terms] {
  let f = (
    do -i { locate -Ai ...$terms | lines } | default []
    | where ($it !~ '~$')
    | str join "\n"
    | fzf --preview 'bat --color=always {} 2> /dev/null | head -200'
    | str trim
  )
  if ($f | is-not-empty) { ^$env.EDITOR $f }
}

# fd + fzf + open in editor (your zsh `fim`)
def --wrapped fim [...args] {
  let f = (
    fd ...$args
    | fzf --preview 'bat --color=always {} 2> /dev/null | head -200'
    | str trim
  )
  if ($f | is-not-empty) { ^$env.EDITOR $f }
}
