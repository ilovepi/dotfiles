#!/usr/bin/zsh

function frg() {

    local choice="`rg -il "$1" | fzf -0 -1 --ansi --preview "bat {} | rg --color=always $1 --context 3" --preview-window=60%`"
    if [ "$choice"  ]; then
      $EDITOR  "+/$1" "$choice"
    fi
}
