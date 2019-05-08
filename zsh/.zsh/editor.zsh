if which nvim &> /dev/null; then
    export EDITOR=$(which nvim)
else
    export EDITOR=$(which vim)
fi
