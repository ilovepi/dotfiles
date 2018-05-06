zmodload zsh/zprof

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
zplug load --verbose

source ~/.zsh/aliases.zsh

#FZF stuff
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Completion w/ fzf is bad so far
#export FZF_COMPLETION_TRIGGER=''
export FZF_CTRL_T_COMMAND='fd --follow --exclude .git --color=always'
#export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_OPTS="--ansi"
#export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
#export FZF_COMPLETION_OPTS='+c -x'
#bindkey '^T' fzf-completion
#bindkey '^I' $fzf_default_completion
