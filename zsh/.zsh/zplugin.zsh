# Can manage local plugins
#zplug "~/.zsh", from:local

# oh-my-zsh plugins
zplugin snippet OMZ::plugins/pip/pip.plugin.zsh
#zplug "plugins/python",            from:oh-my-zsh, lazy:yes
zplugin ice as"completion"
zplugin snippet OMZ::plugins/rust/_rust
zplugin ice as"completion"
zplugin snippet OMZ::plugins/cargo/_cargo
zplugin snippet OMZ::plugins/rsync/rsync.plugin.zsh
zplugin snippet OMZ::plugins/tmux/tmux.plugin.zsh
#zplug "plugins/tmuxinator",        from:oh-my-zsh, lazy:yes
#zplug "plugins/vagrant",           from:oh-my-zsh, lazy:yes
#zplug "plugins/npm",               from:oh-my-zsh, lazy:yes
zplugin snippet OMZ::plugins/systemadmin/systemadmin.plugin.zsh
zplugin snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/git-extras/git-extras.plugin.zsh
zplugin snippet OMZ::plugins/git-flow/git-flow.plugin.zsh

setopt extended_glob

case "$OSTYPE" in
    darwin*)
        alias dircolors=gdircolors
        #zplugin snippet OMZ::plugins/osx/osx.plugin.zsh
        # Or with most recent Zplugin and with ~/.zplugin/snippeds directory pruned (rm -rf -- ${ZPLGM[SNIPPETS_DIR]}):
        zplugin ice svn
        zplugin snippet OMZ::plugins/osx

        ;;
    linux*)
        case `lsb_release -sd` in
            *(#i)(arch)*)
                ;&
            *(#i)(manjaro)*)
                zplugin snippet OMZ::plugins/archlinux/archlinux.plugin.zsh
                ;;
            *(#i)(debian)*)
                ;&
            *(#i)(ubuntu)*)
                zplugin snippet OMZ::plugins/debian/debian.plugin.zsh
                #zplug "~/dotfiles/apt-fast",       from:local
                ;;
        esac
        ;;
esac

zplugin light  djui/alias-tips
zplugin light  zlsun/solarized-man
zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh"
zplugin load trapd00r/LS_COLORS
zplugin light  zsh-users/zsh-autosuggestions
zplugin light  zsh-users/zsh-completions

#zplugin light  sharat87/pip-app

#zplugin light  supercrabtree/k
#zplugin light  k4rthik/git-cal
zplugin light  wfxr/forgit
zplugin ice as"program" pick"bin/git-dsf"
zplugin light zdharma/zsh-diff-so-fancy


zplugin ice as"program" make"!" atclone'./install --all' atpull'%atclone' pick"bin/fzf"
zplugin light junegunn/fzf
#zplug "junegunn/fzf", as:command, use:bin/fzf, hook-build:"./install --all"
zplugin light  changyuheng/fz
zplugin light  rupa/z

#if zplug check "b4b4r07/enhancd"; then
    #export ENHANCD_FILTER="~/.zplug/bin/fzf --height 50% --reverse --ansi --preview 'ls -l {}' --preview-window down"
    export ENHANCD_FILTER="fzf --height 50% --reverse --ansi"
    export ENHANCD_DOT_SHOW_FULLPATH=1
    export ENHANCD_COMMAND=ecd
    export ENHANCD_DOT_ARG=...
zplugin light  b4b4r07/enhancd
#fi

# Load if "if" tag returns true
#zplugin snippet OMZ::lib/clipboard/clipboard.zsh
#zplugin snippet OMZ::lib/key-bindings/bindings.zsh
#zplugin snippet OMZ::lib/termsupport/termsupport.zsh
#zplugin snippet OMZ::lib/theme-and-appearance.zsh
zplugin snippet OMZ::lib/theme-and-appearance.zsh
zplugin snippet OMZ::lib/completion.zsh
zplugin snippet OMZ::lib/compfix.zsh


#zplugin ice pick"completion.zsh" src"theme-and-appearance.zsh" src"compfix.zsh"
#zplugin snippet OMZ::lib



# Fake password for docker/vagrant
#zplug "jhawthorn/fzy", as:command, hook-build:"make && PREFIX=$ZPLUG_BIN make install"

#zplugin light  yonchu/vimman
#zplugin light  sharat87/zsh-vim-mode
#zplugin light  laurenkt/zsh-vimto
#zplugin light  burgerga/better-vi-mode
#zplugin light  b4b4r07/zsh-vimode-visual

zplugin light zdharma/fast-syntax-highlighting
zplugin light  zsh-users/zsh-history-substring-search
zplugin snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
zstyle :omz:plugins:ssh-agent agent-forwarding on
