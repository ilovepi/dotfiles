
# Completion w/ fzf is bad so far
export FZF_COMPLETION_TRIGGER='~~'
export FZF_CTRL_T_COMMAND='fd --follow --exclude .git --color=always'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
#export FZF_COMPLETION_OPTS='+c -x'
#bindkey '^T' fzf-completion
#bindkey '^I' $fzf_default_completion


# git diff browser
forgit::diff::branch() {
    forgit::inside_work_tree || return 1
    local prefix=$(git rev-parse --show-toplevel)
    local cmd="git diff --color=always $1 -- $prefix/{} $forgit_emojify $forgit_fancy"
    git diff $1 --name-only |
        forgit::fzf -e -0 \
            --bind="enter:execute($cmd |LESS='-R' less)" \
            --preview="$cmd"
}

alias gd='forgit::diff::branch'

fed() {
  local files

  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200')"})

  if [[ -n $files ]]
  then
     vim -- $files
     print -l $files[1]
  fi
}


clang-format-all() {
  FMT=clang-format
  # Check all of the arguments first to make sure they're all directories
  for dir in "$@"; do
    if [ ! -d "${dir}" ]; then
        echo "${dir} is not a directory"
        usage
    fi
  done

  # Run clang-format -i on all of the things
  for dir in "$@"; do
    pushd "${dir}" &>/dev/null
    find . \
         \( -name '*.c' \
         -o -name '*.cc' \
         -o -name '*.cpp' \
         -o -name '*.h' \
         -o -name '*.hh' \
         -o -name '*.hpp' \) \
         -exec "${FMT}" -i '{}' \;
    popd &>/dev/null
  done
}
