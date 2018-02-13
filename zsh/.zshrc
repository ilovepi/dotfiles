zmodload zsh/zprof

#check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
	git clone https://github.com/zplug/zplug ~/.zplug
	source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

export SHELL=/usr/bin/zsh
#export TERM=xterm-256color

#add Zotero to path
PATH=$PATH:$HOME/bootstrap/Zotero_linux-x86_64

#add local bin dir to PATH
PATH=$HOME/bin:$PATH

# add Go directories to PATH
export GOROOT=/usr/local/go
export GOPATH=$HOME/workspace/go

PATH=$GOPATH/bin:$GOROOT/bin:$PATH

#add cargo directories to PATH
PATH=$HOME/.cargo/bin:$PATH

export PATH

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

# Adds aliases to open your current repo & branch on github.
zplug "unixorn/git-extra-commands"

# Supports oh-my-zsh plugins and the like
zplug "plugins/pip",               from:oh-my-zsh
zplug "plugins/python",            from:oh-my-zsh
zplug "plugins/github",            from:oh-my-zsh
zplug "plugins/rsync",             from:oh-my-zsh
zplug "plugins/tmux",              from:oh-my-zsh
zplug "plugins/docker",            from:oh-my-zsh
zplug "plugins/vagrant",           from:oh-my-zsh
zplug "plugins/colorize",          from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/npm",               from:oh-my-zsh
zplug "plugins/systemadmin",       from:oh-my-zsh
#zplug "plugins/emacs",             from:oh-my-zsh
zplug "plugins/z",                 from:oh-my-zsh
zplug "plugins/common-aliases",    from:oh-my-zsh
zplug "plugins/history",           from:oh-my-zsh
zplug "plugins/git",               from:oh-my-zsh
zplug "plugins/git-extras",        from:oh-my-zsh
zplug "plugins/git-flow",          from:oh-my-zsh
zplug "plugins/debian",            from:oh-my-zsh,  hook-build:"~/dotfiles/fix_debian_alias.sh"


zplug "djui/alias-tips"
zplug "unixorn/git-extra-commands"
zplug "skx/sysadmin-util"

zplug "yonchu/vimman"

zplug "joel-porquet/zsh-dircolors-solarized"

zplug "sharat87/pip-app"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "supercrabtree/k"
#zplug "unixorn/jpb.zshplugin"
#zplug "chrissicool/zsh-256color"

# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# Can manage everything e.g., other person's zshrc
zplug "tcnksm/docker-alias", use:zshrc

# Disable updates using the "frozen" tag
zplug "k4rthik/git-cal", as:command, frozen:1

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf


#if [[ ! -d ~/dir_colors ]] ; then
    #git clone https://github.com/seebi/dircolors-solarized.git ~/dir_colors
    #ln -s ~/dir_colors/dircolors.ansi-dark ~/.dircolors
    #ln -s ~/.dircolors ~/.dir_colors
#fi


#if [[ "$OSTYPE" == darwin*  ]]; then
    ## commands for OS X go here
    #eval `gdircolors $HOME/.dircolors`
#else
    ## commands for Linux go here
    #eval `dircolors $HOME/.dircolors`
#fi

# Load if "if" tag returns true
zplug "lib/clipboard", from:oh-my-zsh 
zplug "lib/key-bindings", from:oh-my-zsh 
zplug "lib/termsupport", from:oh-my-zsh 
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh 
zplug "lib/compfix", from:oh-my-zsh 


# Run a command after a plugin is installed/updated
# Provided, it requires to set the variable like the following:
# ZPLUG_SUDO_PASSWORD="********"
ZPLUG_SUDO_PASSWORD="a"
zplug "jhawthorn/fzy", as:command, rename-to:fzy, hook-build:"make && sudo make install"

# Supports checking out a specific branch/tag/commit
zplug "b4b4r07/enhancd", at:v1
zplug "mollifier/anyframe", at:4c23cb60

# Can manage gist file just like other packages
zplug "b4b4r07/79ee61f7c140c63d2786", \
    from:gist, \
    as:command, \
    use:get_last_pane_path.sh

# Support bitbucket
zplug "b4b4r07/hello_bitbucket", \
    from:bitbucket, \
    as:command, \
    use:"*.sh"

# Rename a command with the string captured with `use` tag
zplug "b4b4r07/httpstat", \
    as:command, \
    use:'(*).sh', \
    rename-to:'$1'

# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "plugins/ssh-agent",   from:oh-my-zsh, defer:3
zstyle :omz:plugins:ssh-agent agent-forwarding on

# Can manage local plugins
zplug "~/.zsh", from:local

# Load theme file
zplug 'caiogondim/bullet-train-oh-my-zsh-theme', as:theme

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
unsetopt promptcr
setopt hash_cmds
setopt numeric_glob_sort
# Enable comment string
setopt interactive_comments
# Improve rm *
setopt rm_star_wait
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
setopt complete_aliases
unsetopt hist_verify
# }}}


zstyle ':completion:*' group-name ''
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:descriptions' format '%d'
zstyle ':completion:*:options' verbose yes
zstyle ':completion:*:values' verbose yes
zstyle ':completion:*:options' prefix-needed yes
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
unalias rm
alias lh='ls -ld .?*'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
