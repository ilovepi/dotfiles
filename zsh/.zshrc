zmodload zsh/zprof

#check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
	git clone https://github.com/zplug/zplug ~/.zplug
	source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

export SHELL=/usr/bin/zsh
#export TERM=xterm-256color

mkdir -p ~/.zsh/completions $GOPATH

if ! type "$nvim" > /dev/null; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

alias zshconfig="edit ~/.zshrc"
alias ohmyzsh="edit ~/.oh-my-zsh"

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

fpath=(/usr/share/zsh/vendor-completions/ $fpath)
fpath=(/usr/share/zsh/site-functions/ $fpath)
fpath=(~/.zsh/completions/ $fpath)

# Adds aliases to open your current repo & branch on github.
#zplug "unixorn/git-extra-commands"

# Supports oh-my-zsh plugins and the like
zplug "plugins/pip",               from:oh-my-zsh
zplug "plugins/python",            from:oh-my-zsh
zplug "plugins/rsync",             from:oh-my-zsh
zplug "plugins/tmux",              from:oh-my-zsh
zplug "plugins/vagrant",           from:oh-my-zsh
zplug "plugins/npm",               from:oh-my-zsh
zplug "plugins/systemadmin",       from:oh-my-zsh
zplug "plugins/common-aliases",    from:oh-my-zsh
zplug "plugins/git",               from:oh-my-zsh
zplug "plugins/git-extras",        from:oh-my-zsh
zplug "plugins/git-flow",          from:oh-my-zsh

setopt extended_glob
case `lsb_release -sd` in
    *(#i)(arch)*)
        ;&
    *(#i)(manjaro)*)
        zplug "plugins/archlinux", from:oh-my-zsh
        ;;
    *(#i)(debian)*)
        ;&
    *(#i)(ubuntu)*)
        zplug "plugins/debian",    from:oh-my-zsh
        zplug "~/dotfiles/apt-fast",       from:local
        ;;
esac

zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh

zplug "zlsun/solarized-man"

zplug "djui/alias-tips"

zplug "yonchu/vimman"
#zplug "sharat87/zsh-vim-mode"
#zplug "laurenkt/zsh-vimto"

zplug "joel-porquet/zsh-dircolors-solarized"

zplug "sharat87/pip-app"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "supercrabtree/k"
zplug wfxr/forgit, from:github, defer:1
zplug "zdharma/zsh-diff-so-fancy"

# Disable updates using the "frozen" tag
zplug "k4rthik/git-cal", as:command

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
zplug "junegunn/fzf", as:command, use:bin/fzf, hook-build:"./install --all"

# Load if "if" tag returns true
#zplug "lib/clipboard", from:oh-my-zsh
#zplug "lib/key-bindings", from:oh-my-zsh
#zplug "lib/termsupport", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/compfix", from:oh-my-zsh


# Run a command after a plugin is installed/updated
# Provided, it requires to set the variable like the following:
# ZPLUG_SUDO_PASSWORD="********"
ZPLUG_SUDO_PASSWORD="a"
zplug "jhawthorn/fzy", as:command, rename-to:fzy, hook-build:"make && sudo make install"



#zplug "burgerga/better-vi-mode"
zplug "b4b4r07/zsh-vimode-visual", defer:3
zplug "b4b4r07/enhancd", use:init.sh
if zplug check "b4b4r07/enhancd"; then
    #export ENHANCD_FILTER="fzf --height 50% --reverse --ansi --preview 'ls -l {}' --preview-window down"
    export ENHANCD_FILTER="fzf --height 50% --reverse --ansi"
    export ENHANCD_DOT_SHOW_FULLPATH=1
    export ENHANCD_COMMAND=ecd
fi

# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug zdharma/fast-syntax-highlighting, from:github
#zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "plugins/ssh-agent",   from:oh-my-zsh, defer:3
zstyle :omz:plugins:ssh-agent agent-forwarding on

export KEYTIMEOUT=1

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

bindkey -v
# start typing + [Up-Arrow] - fuzzy find history forward
bindkey "${terminfo[kcuu1]}" history-substring-search-up
# start typing + [Down-Arrow] - fuzzy find history backward
bindkey "${terminfo[kcud1]}" history-substring-search-down

#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down
#bindkey '^[OA' history-substring-search-up
#bindkey '^[OB' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey "${terminfo[khome]}" beginning-of-line # [Home] - Go to beginning of line
bindkey "${terminfo[kend]}"  end-of-line       # [End] - Go to end of line
bindkey '^?' backward-delete-char              # [Backspace] - delete backward
bindkey "${terminfo[kdch1]}" delete-char       # [Delete] - delete forward

# Can manage local plugins
#zplug "~/.zsh", from:local

# Load theme file
zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3 # defer until other plugins like oh-my-zsh is loaded

function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

prompt_vi_mode()
{
    case ${KEYMAP} in
        vicmd)
            prompt='black white NORMAL'
            ;;
        viins|main|'')
            prompt='yellow black INSERT'
            ;;
        vivis)
            prompt='magenta white VISUAL'
            ;;
        *)
            prompt='208 black UNKNOWN'
            ;;
    esac
    prompt_segment $(echo $prompt)
}

BULLETTRAIN_PROMPT_ORDER=(
    vi_mode
    time
    status
    context
    dir
    screen
    virtualenv
    #nvm
    go
    rust
    git
    cmd_exec_time
  )

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi



#####################################################################
# options
######################################################################
#{{{
setopt auto_resume
# Ignore <C-d> logout
setopt ignore_eof
# Disable beeps
setopt no_beep
# {a-c} -> a b c
setopt brace_ccl
# Enable spellcheck
setopt correct
# Enable "=command" feature
setopt equals
# Disable flow control
setopt no_flow_control
# Ignore dups
setopt hist_ignore_dups
# Reduce spaces
setopt hist_reduce_blanks
# Ignore add history if space
setopt hist_ignore_space
# Save time stamp
setopt extended_history
# Expand history
setopt hist_expand
# Better jobs
setopt long_list_jobs
# Enable completion in "--option=arg"
setopt magic_equal_subst
# Add "/" if completes directory
setopt mark_dirs
# Disable menu complete for vimshell
#setopt no_menu_complete
#setopt list_rows_first
# Expand globs when completion
setopt glob_complete
# Enable multi io redirection
setopt multios
# Can search subdirectory in $PATH
setopt path_dirs
# For multi byte
setopt print_eight_bit
# Print exit value if return code is non-zero
setopt print_exit_value
setopt pushd_ignore_dups
setopt pushd_silent
# Short statements in for, repeat, select, if, function
setopt short_loops
# Ignore history (fc -l) command in history
setopt hist_no_store
setopt transient_rprompt
#unsetopt promptcr
setopt hash_cmds
setopt numeric_glob_sort
# Enable comment string
setopt interactive_comments
# Improve rm *
#setopt rm_star_wait
# Enable extended glob
setopt extended_glob
unsetopt nomatch
# Note: It is a lot of errors in script
# setopt no_unset
# Prompt substitution
setopt prompt_subst
if [[ ${VIMSHELL_TERM:-""} != "" ]]; then
    setopt no_always_last_prompt
else
    setopt always_last_prompt
fi
# List completion
setopt auto_list
setopt auto_param_slash
setopt auto_param_keys
# List like "ls -F"
setopt list_types
# Compact completion
setopt list_packed
setopt auto_cd
setopt auto_pushd
setopt pushd_minus
setopt pushd_ignore_dups
# Check original command in alias completion
#setopt complete_aliases
unsetopt hist_verify
# }}}


#zstyle ':completion:*' group-name ''
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:descriptions' format '%d'
#zstyle ':completion:*:options' verbose yes
#zstyle ':completion:*:values' verbose yes
#zstyle ':completion:*:options' prefix-needed yes
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# cd search path
 cdpath=($HOME)


# Share zsh histories
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=500000
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups

# Enable math functions
zmodload zsh/mathfunc


# Then, source plugins and add commands to $PATH
zplug load --verbose

#unalias ag
alias :q='exit'
alias lh='ls -ld .?*'
unalias rm
unalias fd

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Completion w/ fzf is bad so far
#export FZF_COMPLETION_TRIGGER=''
#export FZF_CTRL_T_COMMAND='fd --follow --exclude .git --color=always'
#export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
#export FZF_DEFAULT_OPTS="--ansi"
#export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
#export FZF_COMPLETION_OPTS='+c -x'
#bindkey '^T' fzf-completion
#bindkey '^I' $fzf_default_completion
