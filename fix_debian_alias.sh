#!/bin/bash

pushd ~/.zplug/repos/robbyrussell/oh-my-zsh/

git apply ~/dotfiles/silver_searcher_patch.diff

popd

