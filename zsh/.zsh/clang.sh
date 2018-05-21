#!/bin/usr/env zsh

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
