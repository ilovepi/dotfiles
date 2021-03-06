
# oh-my-zsh plugins
zinit ice wait lucid
zinit snippet OMZ::plugins/pip/pip.plugin.zsh
zinit ice as"completion" wait lucid
zinit snippet OMZ::plugins/rust/_rust
zinit ice as"completion" wait lucid
zinit snippet OMZ::plugins/cargo/_cargo
zinit ice wait lucid
zinit snippet OMZ::plugins/rsync/rsync.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/tmux/tmux.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/git-extras/git-extras.plugin.zsh
zinit ice wait lucid
zinit snippet OMZ::plugins/git-flow/git-flow.plugin.zsh

setopt extended_glob
if [ `env | rg -i wsl | rg Debian` ];
then
   zinit ice wait lucid
   zinit snippet OMZ::plugins/debian/debian.plugin.zsh
else
   case "$OSTYPE" in
      darwin*)
         alias dircolors=gdircolors
         ;;
      linux*)
         case `lsb_release -sd` in
            *(#i)(arch)*)
               ;&
            *(#i)(manjaro)*)
               zinit ice wait lucid
               zinit snippet OMZ::plugins/archlinux/archlinux.plugin.zsh
               ;;
            *(#i)(debian)*)
               ;&
            *(#i)(ubuntu)*)
               zinit ice wait lucid
               zinit snippet OMZ::plugins/debian/debian.plugin.zsh
               ;;
         esac
         ;;
   esac

fi

zinit ice wait lucid
zinit light djui/alias-tips
zinit ice wait lucid
zinit light zlsun/solarized-man
zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh"
zinit load trapd00r/LS_COLORS
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

zinit ice wait lucid
zinit light  wfxr/forgit
zinit ice as"program" pick"bin/git-dsf"
zinit light zdharma/zsh-diff-so-fancy

zinit ice as"program" make"!" atclone'./install --all' atpull'%atclone' pick"bin/fzf"
zinit light junegunn/fzf
zinit ice wait lucid
zinit light changyuheng/fz
zinit ice wait lucid
zinit light rupa/z

export ENHANCD_FILTER="fzf --height 50% --reverse --ansi"
export ENHANCD_DOT_SHOW_FULLPATH=1
export ENHANCD_COMMAND=ecd
export ENHANCD_DOT_ARG=...
zinit ice wait lucid
zinit light  b4b4r07/enhancd

zinit ice wait lucid
zinit snippet OMZ::lib/git.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/completion.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/compfix.zsh

zinit ice wait lucid
zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
zstyle :omz:plugins:ssh-agent agent-forwarding on
