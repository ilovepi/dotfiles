
# oh-my-zsh plugins
zinit ice wait'4' lucid
zinit snippet OMZ::plugins/pip/pip.plugin.zsh
zinit ice as"completion" wait lucid
zinit snippet OMZ::plugins/rust/_rust
zinit ice as"completion" wait lucid
zinit snippet OMZ::plugins/cargo/cargo.plugin.zsh
zinit ice wait'1' lucid
zinit snippet OMZ::plugins/rsync/rsync.plugin.zsh
zinit ice wait'1' lucid
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
               #zplug "~/dotfiles/apt-fast",       from:local
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
zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions
zinit ice wait lucid
zinit light zsh-users/zsh-completions

zinit ice wait lucid
zinit light wfxr/forgit
zinit ice as"program" pick"bin/git-dsf" wait lucid
zinit light zdharma-continuum/zsh-diff-so-fancy

zinit ice as"program" make"!" atclone'./install --all' atpull'%atclone' pick"bin/fzf"
zinit light junegunn/fzf

zinit ice wait lucid
zinit snippet OMZ::lib/git.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/completion.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/compfix.zsh

#zinit ice wait lucid
#zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
#zstyle :omz:plugins:ssh-agent agent-forwarding on
