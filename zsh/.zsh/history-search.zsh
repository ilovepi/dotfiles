# setup vi mode and configure substring search
export KEYTIMEOUT=1

#if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  #function zle-line-init() {
    #echoti smkx
  #}
  #function zle-line-finish() {
    #echoti rmkx
  #}
  #zle -N zle-line-init
  #zle -N zle-line-finish
#fi

#enable vim mode
bindkey -v

# start typing + [Up-Arrow] - fuzzy find history forward
bindkey "${terminfo[kcuu1]}" history-substring-search-up

# start typing + [Down-Arrow] - fuzzy find history backward
bindkey "${terminfo[kcud1]}" history-substring-search-down

#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down
#bindkey '^[OA' history-substring-search-up
#bindkey '^[OB' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey "${terminfo[khome]}" beginning-of-line # [Home] - Go to beginning of line
bindkey "${terminfo[kend]}"  end-of-line       # [End] - Go to end of line
bindkey '^?' backward-delete-char              # [Backspace] - delete backward
bindkey "${terminfo[kdch1]}" delete-char       # [Delete] - delete forward
