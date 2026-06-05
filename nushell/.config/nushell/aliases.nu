# =============================================================================
# aliases.nu — general aliases (your zsh aliases.zsh, minus git/arch which are
# in git.nu / arch.nu). Plus the alias-bearing OMZ plugins you loaded:
# OMZP::rsync (rsync-* aliases). OMZP::pip and OMZP::rust were loaded purely as
# completions — nu has no equivalent, so only their few aliases are ported.
# =============================================================================

# --- listings -----------------------------------------------------------------
# Using nu's native `ls` (structured table) instead of eza for now. Old letters
# are reused so muscle memory keeps working; the sort variants are `def`s that
# pipe the table into `sort-by`. eza versions are commented out below.
alias l    = ls
alias la   = ls -a                                  # all, incl hidden
alias ll   = ls -l                                  # long/detailed columns
alias lla  = ls -la                                 # long + all
def   lt   [] { ls | sort-by modified }             # oldest → newest
def   lrt  [] { ls | sort-by modified --reverse }   # newest → oldest
def   lS   [] { ls | sort-by size --reverse }       # largest first
def   ldot [] { ls -a | where name =~ '^\.' }       # dotfiles only

# eza versions. NOTE: nu has no native `tree`; re-enable the eza line below for
# `tree`, or use the external `tree` binary.
#
# alias l    = eza --icons=auto --color=auto -lhF
# alias la   = eza --icons=auto --color=auto -lahF
# alias ll   = eza --icons=auto --color=auto -l
# alias lt   = eza --icons=auto --color=auto -lhF --sort=modified
# alias lr   = eza --icons=auto --color=auto -hRF --sort=modified
# alias lrt  = eza --icons=auto --color=auto -1F --sort=modified --reverse
# alias lart = eza --icons=auto --color=auto -1aF --sort=modified --reverse
# alias lS   = eza --icons=auto --color=auto -1F --sort=size
# alias ldot = eza --icons=auto --color=auto -ld .*
alias tree = eza --icons=auto --color=auto -T

# --- grep / coreutils flavouring ---------------------------------------------
alias grep = grep --color=auto
alias egrep = egrep --color=auto
alias fgrep = fgrep --color=auto
alias df = df -h
alias free = free -mt
alias wget = wget -c
alias rgs = rg --sort-files
alias userlist = cut -d: -f1 /etc/passwd
alias q = exit                        # `:q` isn't a legal alias name in nu

# --- rsync (OMZP::rsync) ------------------------------------------------------
alias rsync-copy = rsync -avz --progress -h
alias rsync-move = rsync -avz --progress -h --remove-source-files
alias rsync-update = rsync -avzu --progress -h
alias rsync-synchronize = rsync -avzu --delete --progress -h

# --- pip (OMZP::pip; plugin was mostly completions) --------------------------
alias pipi = pip install
alias pipu = pip install --upgrade
alias pipun = pip uninstall

# --- gpg helpers (your zsh aliases.zsh) --------------------------------------
alias gpg-check = gpg2 --keyserver-options auto-key-retrieve --verify
alias gpg-retrieve = gpg2 --keyserver-options auto-key-retrieve --receive-keys

# --- misc (your zsh aliases.zsh) ---------------------------------------------
alias magit = nvim -c MagitOnly
alias rmgitcache = rm -rf ~/.cache/git

# --- edit-the-config shortcuts -----------------------------------------------
# all open in $EDITOR (nvim, vim fallback) via the `e` helper in functions.nu
def nurc   [] { ^$env.EDITOR ($nu.default-config-dir | path join config.nu) }
def nuenv  [] { ^$env.EDITOR ($nu.default-config-dir | path join env.nu) }
def nugit  [] { ^$env.EDITOR ($nu.default-config-dir | path join git.nu) }
def nualias [] { ^$env.EDITOR ($nu.default-config-dir | path join aliases.nu) }
alias zshrc  = nvim ~/dotfiles/zsh/.zshrc
alias nvimrc = nvim ~/dotfiles/config/.config/nvim/init.lua
alias hyprrc = nvim ~/.config/hypr/hyprland.conf
alias parurc = nvim ~/.config/paru/paru.conf
alias nurc = nvim ~/.config/nushell/config.nu
