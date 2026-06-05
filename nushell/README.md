# nushell (experiment)

A Nushell config aiming for **parity** with my zsh setup, split into topical
files that mirror `zsh/.zsh/*.zsh` so each piece is reviewable on its own.
Experiment — nothing committed; lives in its own stow package.

```
nushell/.config/nushell/
├── env.nu        # loaded first: $env, PATH, editor, MANPAGER, init-script generation
├── config.nu     # loaded second: core settings + keybindings, then sources the files below
├── git.nu        # OMZ `git` plugin alias set (g, ga, gst, gco, gcm, gpsup, ...)
├── arch.nu       # pacman/paru + OMZ archlinux conveniences + mirror/cleanup
├── aliases.nu    # general: eza ls-family, grep, rsync, pip, edit-config shortcuts
├── functions.nu  # ex, clang-format-all, psgrep, e (open in $EDITOR)
└── fzf.nu        # forgit-style gd, fed, fim
```

Generated (NOT in repo): `~/.local/share/nushell/init/{starship,zoxide}.nu`,
created once by `env.nu`, sourced by `config.nu`. `rm` them to refresh.

## Enable / disable

```sh
cd ~/dotfiles && stow nushell      # symlinks all *.nu into ~/.config/nushell/
nu                                  # try it
cd ~/dotfiles && stow -D nushell   # remove symlinks; zsh untouched
```

If `stow` reports a conflict, Nushell left auto-generated stub `config.nu`/`env.nu`
in `~/.config/nushell/` on a prior launch — delete those two stubs and re-stow
(`history.sqlite3` can stay).

## Parity map — what each zsh piece became

| zsh source | nu file | notes |
|---|---|---|
| `OMZP::git` (the git plugin) | `git.nu` | ~150 aliases ported 1:1; dynamic ones (`gcm`, `gswm`, `grbm`, `gpsup`, `groh`, `grt`, `gpristine`) are `def`s using `git_main_branch`/`git_current_branch`/`git_develop_branch` helpers |
| `OMZP::archlinux` + your pacman aliases | `arch.nu` | `pacin*`/`pacre*`/`pacls`/… plus your `mirror*`, `cleanup`, `rip`, `jctl` |
| `OMZP::rsync` | `aliases.nu` | `rsync-copy/move/update/synchronize` |
| `OMZP::pip` | `aliases.nu` | only its aliases (`pipi/pipu/pipun`); the plugin was mostly completions |
| `OMZP::rust` | — | was loaded **as completions only**; nu has no equivalent (see "Gaps") |
| eza aliases (`l`,`la`,…) | `aliases.nu` | currently mapped to native `ls` (eza commented out — see "Listings" below) |
| `clang.sh`, `ex`, `psgrep` | `functions.nu` | `def`s; `psgrep` is now structured (`ps | where name =~ …`) |
| forgit `gd`, `fed`, `fim` | `fzf.nu` | `gd` = fzf diff browser, shadows OMZ's `git diff` alias (same as your zsh) |
| `fast-syntax-highlighting` | — | **built-in** (reedline) |
| `zsh-autosuggestions` | — | **built-in** (reedline history hints) |
| `zsh-history-substring-search` | — | **built-in** (Ctrl-r fuzzy menu) |
| `zsh-completions` + `compinit` | — | native nu completions (see "Gaps") |
| `solarized-man` | `env.nu` | `MANPAGER` → `bat` |
| starship / zoxide | `env.nu` + `config.nu` | generated init, sourced |
| `bindkey -v`, history opts | `config.nu` | `edit_mode: vi`, sqlite shared history |

## Gaps vs zsh (honest)

- **External-command argument completions.** zsh's `zsh-completions`/compinit gave
  you `git checkout <Tab>` → branch names, `systemctl <Tab>`, etc. Nu completes
  command names, paths, and its own command signatures, but **not** third-party
  argument completions out of the box. The usual fix (carapace) is deliberately
  **not** installed. If you want this later, the no-daemon option is hand-written
  nu `extern` completion stubs for specific commands.
- **`OMZP::rust`** was completions-only → no nu equivalent.
- **`alias-tips`** (nudge when a long command had an alias) — no nu port.
- **`gtv`** uses a pipe inside an alias; fine for the no-arg case.

## Listings: native `ls`, eza commented out

Currently the short listing names wrap nu's **native** `ls` (structured table),
not eza — eza would throw away the table. The eza block in `aliases.nu` is
commented out; uncomment it to switch back.

| name | does |
|---|---|
| `l` | `ls` |
| `la` | `ls -a` (incl hidden) |
| `ll` | `ls -l` (long columns) |
| `lla` | `ls -la` |
| `lt` / `lrt` | `ls | sort-by modified` (/ reversed) |
| `lS` | `ls | sort-by size --reverse` |
| `ldot` | dotfiles only |

No native `tree` in nu — re-enable the eza `tree` line in `aliases.nu`, or use
the external `tree` binary.

```nushell
ls | where size > 10mb | sort-by modified
ps | where cpu > 5
git_main_branch                 # helper resolves master/main for this repo
```

## Startup (measured, warm cache, this machine)

| | mean |
|---|---|
| `nu` bare, no config | ~5 ms |
| **`nu` + full parity config** | **~19.6 ms** |
| `zsh -i` (your turbo `.zshrc`) | ~44 ms |

Adding the entire parity set cost only ~2.6 ms over the skeleton config, because
the aliases are nearly free and nu's built-ins replace zsh's expensive
`compinit`+plugin-sourcing. Net: **~2.2× faster than zsh, and fully loaded** (no
turbo-style async deferral — everything is live the instant the prompt appears).

## Sanity check after stow

```nushell
$nu.default-config-dir          # ~/.config/nushell (symlink)
scope aliases | length          # git/arch/general aliases present
help commands | where command_type == custom   # ex, psgrep, gd, fed, fim, gcm, ...
which gd                         # => custom (forgit), not the git-diff alias
which z                          # => zoxide alias
```
