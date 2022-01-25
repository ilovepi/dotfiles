#Editor aliases
alias zshrc="$EDITOR ~/dotfiles/zsh/.zshrc"
alias zshconfig="$EDITOR ~/dotfiles/zsh/.zshrc"
alias zprofile="$EDITOR ~/dotfiles/zsh/.zprofile"
alias zshplug="$EDITOR ~/dotfiles/zsh/.zsh/zplugin.zsh"
alias ztheme="$EDITOR ~/dotfiles/zsh/.zsh/theme.zsh"
alias zaliases="$EDITOR ~/dotfiles/zsh/.zsh/aliases.zsh"
alias zeditor="$EDITOR ~/dotfiles/zsh/.zsh/editor.zsh"
alias zhistory="$EDITOR ~/dotfiles/zsh/.zsh/history.zsh"
alias zoptions="$EDITOR ~/dotfiles/zsh/.zsh/options.zsh"
alias zpath="$EDITOR ~/dotfiles/zsh/.zsh/path.zsh"
alias nvimrc="$EDITOR ~/dotfiles/config/.config/nvim/init.vim"
alias tmuxrc="$EDITOR ~/dotfiles/tmux/.tmux.conf.local"
alias bspwmrc="$EDITOR ~/.config/bspwm/bspwmrc"
alias sxhkdrc="$EDITOR ~/.config/bspwm/sxhkd/sxhkdrc"
alias fim='$EDITOR $(fd | fzf)'

# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'
alias lh='ls -ld .?*'

# enable diff color if possible.
if command diff --color . . &>/dev/null; then
  alias diff='diff --color'
fi

if type fdfind > /dev/null; then
    alias fd=fdfind
fi

if type batcat > /dev/null; then
    alias bat=batcat
fi

if type ls++ > /dev/null; then
    alias ls=ls++
elif type exa > /dev/null; then
    alias ls='exa'
    alias la='ls -laFh'   #long list,show almost all,show type,human readable
    alias lt='ls -lFht=modified'   #long list,sorted by date,show type,human readable
    alias lart='ls -1Fart=modified'
    alias lrt='ls -1Frt=modified'
fi

alias rgs='rg --sort-files'
alias :q='exit'
alias magit='nvim -c MagitOnly'
alias fpth='sed "s/ /\n/g" <<< $fpath'

alias ssh="kitty +kitten ssh"
