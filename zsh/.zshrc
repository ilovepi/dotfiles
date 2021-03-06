if [[ $ZSH_PROFILING ]]; then
    zmodload zsh/zprof
fi

source "${HOME}/.zinit/bin/zinit.zsh"

# TODO: avoid this hack
# Docker doesn't set the SHELL vaiable, so we'll set it ourselves
SHELL=`which zsh`
export SHELL
#export TERM=xterm-256color

GOPATH=${GOPATH:=$HOME/workspace/go}

mkdir -p $GOPATH

#setup vim/nvim as editor
source ~/.zsh/editor.zsh

# update fpath w/ some normal system paths for zsh completions
source ~/.zsh/fpath.zsh

### Added by zinit's installer
#autoload -Uz _zinit
#(( ${+_comps} )) && _comps[zinit]=_zinit
### End of zinit's installer chunk

# load plugins w/ zplug
source ~/.zsh/zplugin.zsh

# setup history substring search and keybindings
source ~/.zsh/history-search.zsh

source ~/.zsh/theme.zsh

# set zsh options
source ~/.zsh/options.zsh

#zstyle ':completion:*' group-name ''
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:descriptions' format '%d'
#zstyle ':completion:*:options' verbose yes
#zstyle ':completion:*:values' verbose yes
#zstyle ':completion:*:options' prefix-needed yes
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# cd search path
cdpath=($HOME)

source ~/.zsh/history.zsh

# Enable math functions
zmodload zsh/mathfunc

source ~/.zsh/aliases.zsh

# Think about actually using vim to edit the command
#autoload edit-command-line; zle -N edit-command-line
#bindkey -M vicmd t edit-command-line

#FZF stuff
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh && source ~/.zsh/fzf.zsh

zinit ice wait"0" lucid
zinit light  zsh-users/zsh-history-substring-search

#autoload -Uz compinit
zinit ice wait"0" atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zpcdreplay" lucid
zinit light zdharma/fast-syntax-highlighting

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^x' edit-command-line
#compinit

#zinit cdreplay -q

if [[ $ZSH_PROFILING ]]; then
    zprof
fi
