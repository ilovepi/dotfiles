# History configuration

# Share zsh histories
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=500000
setopt share_history

# Ignore dups
setopt hist_ignore_dups

# never find dups
setopt hist_find_no_dups

# Reduce spaces
setopt hist_reduce_blanks

# Ignore add history if space
setopt hist_ignore_space

# Save time stamp
setopt extended_history

# Expand history
setopt hist_expand

# apend history
setopt inc_append_history

