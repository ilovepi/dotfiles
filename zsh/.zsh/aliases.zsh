
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
alias fim='$EDITOR $(fd | fzf)'
alias rgs='rg --sort-files'

alias :q='exit'
alias lh='ls -ld .?*'
alias magit='nvim -c MagitOnly'
alias fpth='sed "s/ /\n/g" <<< $fpath'

if type lsd > /dev/null; then
    alias ls=lsd
elif type ls++ > /dev/null; then
    alias ls=ls++
elif type exa > /dev/null; then
    alias ls=exa
fi

if type fdfind > /dev/null; then
    alias fd='fdfind'
fi


if type batcat > /dev/null; then
    alias bat='batcat'
fi
#unalias ag
#unalias rm
#unalias fd
