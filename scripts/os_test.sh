#!/usr/bin/env zsh

NAME=`lsb_release -sd`
setopt extended_glob
case $NAME in
    *(#i)(arch)*)
        ;&
    *(#i)(manjaro)*)
        echo manjaro
        ;;
    *(#i)(debian)*)
        ;&
    *(#i)(ubuntu)*)
        echo debian
        ;;
esac
