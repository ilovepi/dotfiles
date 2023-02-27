#!/bin/zsh -e

function gcert() {
  if [[ -n $TMUX ]]; then
    eval $(tmux show-environment -s)
  fi

  command gcert "$@"
}
