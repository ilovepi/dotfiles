#!/bin/env zsh

fed() {
  local files

  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200')"})

  if [[ -n $files ]]
  then
     vim -- $files
     print -l $files[1]
  fi
}

