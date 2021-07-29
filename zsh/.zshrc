if [[ $ZSH_PROFILING ]]; then
    zmodload zsh/zprof
fi

module_path+=( "${HOME}/.zinit/bin/zmodules/Src" )
zmodload zdharma/zplugin

source "${HOME}/.zinit/bin/zinit.zsh"

# Docker doesn't set the SHELL vaiable, so we'll set it ourselves
#if grep -q docker /proc/1/cgroup; then
    #export SHELL=${SHELL:=`which zsh`}
#fi
[ -f /.dockerenv ] && export SHELL=${SHELL:=`which zsh`}

GOPATH=${GOPATH:=$HOME/workspace/go}

mkdir -p $GOPATH

#setup vim/nvim as editor
source ${HOME}/.zsh/editor.zsh

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

zinit ice wait lucid
zinit light  zsh-users/zsh-history-substring-search

#autoload -Uz compinit
zinit ice wait atload"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zpcdreplay" lucid
zinit light zdharma/fast-syntax-highlighting

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^x' edit-command-line
#compinit

#zinit cdreplay -q

eval "$(zoxide init zsh)"

if [[ $ZSH_PROFILING ]]; then
    zprof
fi

