if [[ $ZSH_PROFILING ]]; then
    zmodload zsh/zprof
fi

#check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
        git clone https://github.com/zplug/zplug ~/.zplug
        source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

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
source ~/.zsh/zplug.zsh

# setup history substring search and keybindings
source ~/.zsh/history-search.zsh

# setup theme (bullet train w/ vi mode support)
source ~/.zsh/theme.zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

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

# Then, source plugins and add commands to $PATH
#zplug load --verbose
zplug load

source ~/.zsh/aliases.zsh

# Think about actually using vim to edit the command
#autoload edit-command-line; zle -N edit-command-line
#bindkey -M vicmd t edit-command-line

#FZF stuff
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh && source ~/.zsh/fzf.zsh

#spaceship_vi_mode_enable
unset zle_bracketed_paste
if [[ $ZSH_PROFILING ]]; then
    zprof
fi
