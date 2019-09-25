
# oh-my-zsh plugins
zplugin ice wait"0" lucid
zplugin snippet OMZ::plugins/pip/pip.plugin.zsh
zplugin ice as"completion" wait"0" lucid
zplugin snippet OMZ::plugins/rust/_rust
zplugin ice as"completion" wait"0" lucid
zplugin snippet OMZ::plugins/cargo/_cargo
zplugin ice wait"0" lucid
zplugin snippet OMZ::plugins/rsync/rsync.plugin.zsh
zplugin ice wait"0" lucid
zplugin snippet OMZ::plugins/tmux/tmux.plugin.zsh
zplugin ice wait"0" lucid
zplugin snippet OMZ::plugins/systemadmin/systemadmin.plugin.zsh
zplugin ice wait"0" atload"unalias rm; unalias fd" lucid
zplugin snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
zplugin ice wait"0" lucid
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin ice wait"0" lucid
zplugin snippet OMZ::plugins/git-extras/git-extras.plugin.zsh
zplugin ice wait"0" lucid
zplugin snippet OMZ::plugins/git-flow/git-flow.plugin.zsh

setopt extended_glob

case "$OSTYPE" in
    darwin*)
        alias dircolors=gdircolors
        zplugin ice svn wait"0" lucid
        zplugin snippet OMZ::plugins/osx

        ;;
    linux*)
        case `lsb_release -sd` in
            *(#i)(arch)*)
                ;&
            *(#i)(manjaro)*)
                zplugin ice wait"0" lucid
                zplugin snippet OMZ::plugins/archlinux/archlinux.plugin.zsh
                ;;
            *(#i)(debian)*)
                ;&
            *(#i)(ubuntu)*)
                zplugin ice wait"0" lucid
                zplugin snippet OMZ::plugins/debian/debian.plugin.zsh
                #zplug "~/dotfiles/apt-fast",       from:local
                ;;
        esac
        ;;
esac

zplugin ice wait"0" lucid
zplugin light djui/alias-tips
zplugin ice wait"0" lucid
zplugin light zlsun/solarized-man
zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh"
zplugin load trapd00r/LS_COLORS
zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" lucid
zplugin light  wfxr/forgit
zplugin ice as"program" pick"bin/git-dsf"
zplugin light zdharma/zsh-diff-so-fancy


zplugin ice as"program" make"!" atclone'./install --all' atpull'%atclone' pick"bin/fzf"
zplugin light junegunn/fzf
zplugin ice wait"0" lucid
zplugin light changyuheng/fz
zplugin ice wait"0" lucid
zplugin light rupa/z

export ENHANCD_FILTER="fzf --height 50% --reverse --ansi"
export ENHANCD_DOT_SHOW_FULLPATH=1
export ENHANCD_COMMAND=ecd
export ENHANCD_DOT_ARG=...
zplugin ice wait"0" lucid
zplugin light  b4b4r07/enhancd

zplugin ice wait"0" lucid
zplugin snippet OMZ::lib/git.zsh
zplugin ice wait"0" lucid
zplugin snippet OMZ::lib/theme-and-appearance.zsh
zplugin ice wait"0" lucid
zplugin snippet OMZ::lib/completion.zsh
zplugin ice wait"0" lucid
zplugin snippet OMZ::lib/compfix.zsh

zplugin ice wait"0" lucid
zplugin snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
zstyle :omz:plugins:ssh-agent agent-forwarding on

