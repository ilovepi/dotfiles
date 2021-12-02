# Can manage local plugins
#zplug "~/.zsh", from:local

# oh-my-zsh plugins
zplug "plugins/pip",               from:oh-my-zsh, lazy:yes
#zplug "plugins/python",            from:oh-my-zsh, lazy:yes
zplug "plugins/rust",              from:oh-my-zsh, lazy:yes
zplug "plugins/cargo",             from:oh-my-zsh, lazy:yes
zplug "plugins/rsync",             from:oh-my-zsh, lazy:yes
zplug "plugins/tmux",              from:oh-my-zsh, lazy:yes
#zplug "plugins/tmuxinator",        from:oh-my-zsh, lazy:yes
#zplug "plugins/vagrant",           from:oh-my-zsh, lazy:yes
#zplug "plugins/npm",               from:oh-my-zsh, lazy:yes
zplug "plugins/systemadmin",       from:oh-my-zsh
zplug "plugins/common-aliases",    from:oh-my-zsh
zplug "plugins/git",               from:oh-my-zsh
zplug "plugins/git-extras",        from:oh-my-zsh
zplug "plugins/git-flow",          from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh

setopt extended_glob

case "$OSTYPE" in
    darwin*)
        zplug "plugins/osx", from:oh-my-zsh
        ;;
    linux*)
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
        ;;
esac

zplug "djui/alias-tips"
#zplug "zlsun/solarized-man"
zplug "joel-porquet/zsh-dircolors-solarized"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

#zplug "sharat87/pip-app"

#zplug "supercrabtree/k"
#zplug "k4rthik/git-cal", as:command
zplug wfxr/forgit, from:github, defer:1
zplug "so-fancy/diff-so-fancy", as:command, use:diff-so-fancy


zplug "junegunn/fzf", as:command, use:bin/fzf, hook-build:"./install --all"
zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh

zplug "b4b4r07/enhancd", use:init.sh
if zplug check "b4b4r07/enhancd"; then
    #export ENHANCD_FILTER="~/.zplug/bin/fzf --height 50% --reverse --ansi --preview 'ls -l {}' --preview-window down"
    export ENHANCD_FILTER="fzf --height 50% --reverse --ansi"
    export ENHANCD_DOT_SHOW_FULLPATH=1
    export ENHANCD_COMMAND=ecd
    export ENHANCD_DOT_ARG=...
fi

# Load if "if" tag returns true
#zplug "lib/clipboard", from:oh-my-zsh
#zplug "lib/key-bindings", from:oh-my-zsh
#zplug "lib/termsupport", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/compfix", from:oh-my-zsh

# Fake password for docker/vagrant
#zplug "jhawthorn/fzy", as:command, hook-build:"make && PREFIX=$ZPLUG_BIN make install"

#zplug "yonchu/vimman"
#zplug "sharat87/zsh-vim-mode"
#zplug "laurenkt/zsh-vimto"
#zplug "burgerga/better-vi-mode"
#zplug "b4b4r07/zsh-vimode-visual", defer:3

zplug zdharma/fast-syntax-highlighting, from:github
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "plugins/ssh-agent",   from:oh-my-zsh, defer:3
zstyle :omz:plugins:ssh-agent agent-forwarding on