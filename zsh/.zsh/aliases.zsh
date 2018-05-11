
#Editor aliases
alias zshconfig="edit /dotfiles/zsh/.zshrc"
alias zprofile="edit ~/dotfiles/zsh/.zprofile"
alias zshplug="edit ~/dotfiles/zsh/.zsh/zplug.zsh"
alias ztheme="edit ~/dotfiles/zsh/.zsh/theme.zsh"
alias zaliases="edit ~/dotfiles/zsh/.zsh/aliases.zsh"
alias ztheme="edit ~/dotfiles/zsh/.zsh/theme.zsh"
alias ztheme="edit ~/dotfiles/zsh/.zsh/theme.zsh"
alias nvimrc="edit ~/dotfiles/config/nvim/init.vim"
alias vv="edit $(fd | fzf)"

alias :q='exit'
alias lh='ls -ld .?*'
alias magit='nvim -c MagitOnly'
alias fpth='sed "s/ /\n/g" <<< $fpath'

#unalias ag
unalias rm
unalias fd
