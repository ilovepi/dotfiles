# =============================================================================
# fzf.nu — fzf-driven helpers (your zsh fzf.zsh: forgit `gd`, `fed`, `fim`).
# The Ctrl-t fzf file-picker keybinding lives in config.nu (it must be inside
# the $env.config.keybindings record). These are the command helpers.
#
# `gd` shadows OMZ's `git diff` alias on purpose — same as your zsh, where
# fzf.zsh redefined `gd` after the git plugin loaded.
# =============================================================================

# forgit-style diff browser: pick a changed file, preview its colored diff,
# enter opens the full diff in a pager. Optional arg = a ref/commit to diff.
def gd [ref?: string] {
  let top = (do -i { git rev-parse --show-toplevel } | default "" | str trim)
  if ($top | is-empty) { print "not inside a git work tree"; return }
  let r = ($ref | default "")
  let files = (do -i { ^git diff $r --name-only | lines } | default [] | where ($it | is-not-empty))
  if ($files | is-empty) { print "no changes to diff"; return }
  $files
  | str join "\n"
  | fzf --ansi --preview $"git diff ($r) --color=always -- {}" --bind $"enter:execute\(git diff ($r) --color=always -- {} | less -R\)"
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
