
#Editor aliases
alias zshconfig="$EDITOR ~/dotfiles/zsh/.zshrc"
alias zprofile="$EDITOR ~/dotfiles/zsh/.zprofile"
alias zshplug="$EDITOR ~/dotfiles/zsh/.zsh/zplug.zsh"
alias ztheme="$EDITOR ~/dotfiles/zsh/.zsh/theme.zsh"
alias zaliases="$EDITOR ~/dotfiles/zsh/.zsh/aliases.zsh"
alias ztheme="$EDITOR ~/dotfiles/zsh/.zsh/theme.zsh"
alias ztheme="$EDITOR ~/dotfiles/zsh/.zsh/theme.zsh"
alias nvimrc="$EDITOR ~/dotfiles/config/nvim/init.vim"
alias fim='$EDITOR $(fd | fzf)'

alias :q='exit'
alias lh='ls -ld .?*'
alias magit='nvim -c MagitOnly'
alias fpth='sed "s/ /\n/g" <<< $fpath'

#unalias ag
unalias rm
unalias fd
