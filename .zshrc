#check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
	git clone https://github.com/zplug/zplug ~/.zplug
	source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

if ! type "$nvim" > /dev/null; then
    export EDITOR='vim'
else
    export EDITOR='nvim'

fi


alias zshconfig="edit ~/.zshrc"
alias ohmyzsh="edit ~/.oh-my-zsh"

#export LANG="en_US.UTF-8"
#export LC_COLLATE="en_US.UTF-8"
#export LC_CTYPE="en_US.UTF-8"
#export LC_MESSAGES="en_US.UTF-8"
#export LC_MONETARY="en_US.UTF-8"
#export LC_NUMERIC="en_US.UTF-8"
#export LC_TIME="en_US.UTF-8"
#export LC_ALL="en_US.UTF-8"



# Adds aliases to open your current repo & branch on github.
zplug "peterhurford/git-it-on.zsh"

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
zplug "plugins/emacs",             from:oh-my-zsh
zplug "plugins/z",                 from:oh-my-zsh
zplug "plugins/zsh-completions",   from:oh-my-zsh
zplug "plugins/common-aliases",    from:oh-my-zsh
zplug "plugins/history",           from:oh-my-zsh
zplug "plugins/git",               from:oh-my-zsh
zplug "plugins/git-extras",       from:oh-my-zsh


zplug "djui/alias-tips"
zplug "unixorn/git-extra-commands"
zplug "skx/sysadmin-util"

# Also prezto
# zplug "modules/prompt", from:prezto

zplug "sharat87/pip-app"
zplug "chrissicool/zsh-256color"
zplug "zsh-users/zsh-autosuggestions"
zplug "rimraf/k"
zplug "unixorn/jpb.zshplugin"


# Make sure to use double quotes
#zplug "zsh-users/zsh-history-substring-search", defer:3

#bindkey '^[OA' history-substring-search-up
#bindkey '^[OB' history-substring-search-down
#bindkey -M emacs '^P' history-substring-search-up
#bindkey -M emacs '^N' history-substring-search-down



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


# Load if "if" tag returns true
zplug "lib/clipboard", from:oh-my-zsh 
zplug "lib/key-bindings", from:oh-my-zsh 
zplug "lib/termsupport", from:oh-my-zsh 
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

zstyle ':completion:*' group-name ''
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:descriptions' format '%d'
zstyle ':completion:*:options' verbose yes
zstyle ':completion:*:values' verbose yes
zstyle ':completion:*:options' prefix-needed yes


# cd search path
cdpath=($HOME)

#Share zsh histories
HISTFILE=$HOME/.zsh-history
HISTSIZE=10000
SAVEHIST=50000
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups

# Enable math functions
zmodload zsh/mathfunc

# Then, source plugins and add commands to $PATH
zplug load --verbose

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
