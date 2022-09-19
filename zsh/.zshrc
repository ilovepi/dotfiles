if [[ $ZSH_PROFILING ]]; then
    zmodload zsh/zprof
fi


ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
#module_path+=( "${ZINIT_HOME}/zinit/bin/zmodules/Src" )
#zmodload zdharma-continuum/zinit
source "${ZINIT_HOME}/zinit.zsh"

# Docker doesn't set the SHELL vaiable, so we'll set it ourselves
#if grep -q docker /proc/1/cgroup; then
    #export SHELL=${SHELL:=`which zsh`}
#fi
[ -f /.dockerenv ] && export SHELL=${SHELL:=`which zsh`}

GOPATH=${GOPATH:=$HOME/workspace/go}

mkdir -p $GOPATH

#setup vim/nvim as editor
source ${HOME}/.zsh/editor.zsh

source ${HOME}/.zsh/path.zsh

# update fpath w/ some normal system paths for zsh completions
source ${HOME}/.zsh/fpath.zsh

# load plugins w/ zinit
source ${HOME}/.zsh/zplugin.zsh

# setup history substring search and keybindings
source ${HOME}/.zsh/history-search.zsh

source ${HOME}/.zsh/theme.zsh

# set zsh options
source ${HOME}/.zsh/options.zsh

#zstyle ':completion:*' group-name ''
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:descriptions' format '%d'
#zstyle ':completion:*:options' verbose yes
#zstyle ':completion:*:values' verbose yes
#zstyle ':completion:*:options' prefix-needed yes
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# cd search path
cdpath=(${HOME})

source ${HOME}/.zsh/history.zsh

# Enable math functions
zmodload zsh/mathfunc

source ${HOME}/.zsh/aliases.zsh

# Think about actually using vim to edit the command
#autoload edit-command-line; zle -N edit-command-line
#bindkey -M vicmd t edit-command-line

#FZF stuff
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#zstyle :omz:plugins:ssh-agent agent-forwarding on
#zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh

zinit ice wait lucid
zinit light  zsh-users/zsh-history-substring-search

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk

#autoload -Uz compinit
zinit ice wait atload"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zpcdreplay" lucid
zinit light zdharma-continuum/fast-syntax-highlighting

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^x' edit-command-line
#compinit

#zinit cdreplay -q

source /etc/bash_completion.d/g4d

unalias zi
eval "$(zoxide init zsh --cmd z)"

if [[ $ZSH_PROFILING ]]; then
    zprof
fi

