# =============================================================================
# git.nu — port of the Oh-My-Zsh `git` plugin alias set (OMZP::git).
# Your zsh loaded this via `zinit snippet OMZP::git`; this reproduces the
# day-to-day aliases as nu aliases, plus the handful that need a `def`
# because OMZ computes a branch name at runtime ($(git_main_branch) etc).
#
# Reviewing later: plain `alias name = git ...` lines map 1:1 to OMZ.
# The `def`s at the bottom are the dynamic ones (main/develop/current branch).
# `gd` = `git diff` (OMZ default). The fzf diff browser is `gdf` in fzf.nu.
# =============================================================================

# --- helpers (OMZ git_* functions) -------------------------------------------
# current checked-out branch name ("" if detached / not a repo)
def git_current_branch [] {
  do -i { git symbolic-ref --short HEAD } | default "" | str trim
}
# first existing of the usual primary branch names, else "main"
def git_main_branch [] {
  let refs = (do -i { git branch -a --format '%(refname:short)' | lines } | default [])
  for b in [main trunk mainline master] {
    if ($b in $refs) or ($"origin/($b)" in $refs) { return $b }
  }
  "main"
}
# first existing of the usual develop branch names, else "develop"
def git_develop_branch [] {
  let refs = (do -i { git branch -a --format '%(refname:short)' | lines } | default [])
  for b in [dev devel develop development] {
    if ($b in $refs) or ($"origin/($b)" in $refs) { return $b }
  }
  "develop"
}

# --- the alias set (static; 1:1 with OMZ) ------------------------------------
alias g = git

alias ga = git add
alias gaa = git add --all
alias gapa = git add --patch
alias gau = git add --update
alias gav = git add --verbose

alias gb = git branch
alias gba = git branch --all
alias gbd = git branch --delete
alias "gbD" = git branch --delete --force
alias gbr = git branch --remote
alias gbnm = git branch --no-merged

alias gbl = git blame -b -w

alias gbs = git bisect
alias gbsb = git bisect bad
alias gbsg = git bisect good
alias gbsr = git bisect reset
alias gbss = git bisect start

alias gc = git commit --verbose
alias "gc!" = git commit --verbose --amend
alias "gcn!" = git commit --verbose --no-edit --amend
alias gca = git commit --verbose --all
alias "gca!" = git commit --verbose --all --amend
alias "gcan!" = git commit --verbose --all --no-edit --amend
alias gcam = git commit --all --message
alias gcas = git commit --all --signoff
alias gcasm = git commit --all --signoff --message
alias gcmsg = git commit --message
alias gcs = git commit --gpg-sign
alias gcss = git commit --gpg-sign --signoff
alias gcssm = git commit --gpg-sign --signoff --message

alias gcb = git checkout -b
alias gco = git checkout
alias gcor = git checkout --recurse-submodules

alias gcp = git cherry-pick
alias gcpa = git cherry-pick --abort
alias gcpc = git cherry-pick --continue

alias gcf = git config --list
alias gcl = git clone --recurse-submodules
alias gclean = git clean --interactive -d

alias gd = git diff
alias gdca = git diff --cached
alias gdcw = git diff --cached --word-diff
alias gds = git diff --staged
alias gdt = git diff-tree --no-commit-id --name-only -r
alias gdw = git diff --word-diff

alias gf = git fetch
alias gfa = git fetch --all --tags --prune --jobs=10
alias gfo = git fetch origin

alias ghh = git help

alias gignored = git ls-files -v
alias gignore = git update-index --assume-unchanged
alias gunignore = git update-index --no-assume-unchanged

alias gl = git pull
alias gpull = git pull
alias glg = git log --stat
alias glgp = git log --stat --patch
alias glo = git log --oneline --decorate
alias glog = git log --oneline --decorate --graph
alias gloga = git log --oneline --decorate --graph --all
alias glol = git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'
alias glola = git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all

alias gm = git merge
alias gma = git merge --abort
alias gmc = git merge --continue
alias gms = git merge --squash

alias gp = git push
alias gpd = git push --dry-run
alias gpf = git push --force-with-lease
alias "gpf!" = git push --force
alias gpv = git push --verbose
alias gpu = git push upstream

alias gr = git remote
alias gra = git remote add
alias grv = git remote --verbose
alias grrm = git remote remove
alias grset = git remote set-url

alias grb = git rebase
alias grba = git rebase --abort
alias grbc = git rebase --continue
alias grbi = git rebase --interactive
alias grbo = git rebase --onto
alias grbs = git rebase --skip

alias grh = git reset
alias grhh = git reset --hard
alias grhk = git reset --keep
alias grhs = git reset --soft
alias gru = git reset --

alias grm = git rm
alias grmc = git rm --cached

alias grs = git restore
alias grss = git restore --source
alias grst = git restore --staged

alias gsb = git status --short --branch
alias gss = git status --short
alias gst = git status
alias gsh = git show
alias gsps = git show --pretty=short --show-signature

alias gsta = git stash push
alias gstaa = git stash apply
alias gstc = git stash clear
alias gstd = git stash drop
alias gstl = git stash list
alias gstp = git stash pop
alias gsts = git stash show --text

alias gsw = git switch
alias gswc = git switch --create

alias gts = git tag --sign
alias gtv = git tag | sort -V

alias gwch = git whatchanged -p --abbrev-commit --pretty=medium
alias gwt = git worktree
alias gwta = git worktree add
alias gwtls = git worktree list
alias gwtrm = git worktree remove

# --- the alias set (dynamic; OMZ used $(git_main_branch) etc) -----------------
def gcm [] { git checkout (git_main_branch) }
def gcd [] { git checkout (git_develop_branch) }
def gswm [] { git switch (git_main_branch) }
def gswd [] { git switch (git_develop_branch) }
def grbm [] { git rebase (git_main_branch) }
def grbd [] { git rebase (git_develop_branch) }
def gprom [] { git pull --rebase origin (git_main_branch) }
def gpsup [] { git push --set-upstream origin (git_current_branch) }
def groh [] { git reset $"origin/(git_current_branch)" --hard }
def grt [] { cd (do -i { git rev-parse --show-toplevel } | default "." | str trim) }
def gpristine [] { git reset --hard; git clean --force -dfx }

# --- your custom fork-update helpers (from zsh aliases.zsh) -------------------
# sync local main from upstream, fast-forward only
def gpm [] {
  git checkout (git_main_branch)
  git pull upstream (git_main_branch) --ff-only
}
def gpmgp [] {
  gpm
  git push
}
