if [[ $ZSH_PROFILING ]]; then
    zmodload zsh/zprof
fi


### Added by Zplugin's installer
source '/Users/paul/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

# TODO: avoid this hack
# Docker doesn't set the SHELL vaiable, so we'll set it ourselves
SHELL=`which zsh`
export SHELL
#export TERM=xterm-256color

mkdir -p $GOPATH

#setup vim/nvim as editor
source ~/.zsh/editor.zsh

# update fpath w/ some normal system paths for zsh completions
source ~/.zsh/fpath.zsh

# load plugins w/ zplug
source ~/.zsh/zplugin.zsh

# setup history substring search and keybindings
source ~/.zsh/history-search.zsh

# setup theme (bullet train w/ vi mode support)
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

autoload -Uz compinit
compinit

zplugin cdreplay -q

if [[ $ZSH_PROFILING ]]; then
    zprof
fi
